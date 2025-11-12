import 'dart:async';

import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/endpoints/notification_endpoint.dart';
import 'package:civic_server/src/endpoints/project_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:civic_server/src/services/recommendation_service.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> savePost(
    Session session,
    Post post,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(
          session,
        );
        if (post.id != null) {
          final existingPost = await validatePostOwnership(
            session,
            post.id!,
            user,
          );

          await updatePost(
            session,
            post.copyWith(
              updatedAt: DateTime.now(),
              projectId: existingPost.projectId,
              parentId: existingPost.parentId,
              pollId: existingPost.pollId,
              commentCount: existingPost.commentCount,
              postType: existingPost.postType,
              dateCreated: existingPost.dateCreated,
            ),
          );
          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            post.id!,
          );
          return existingPost;
        } else {
          final savedPost = await Post.db.insertRow(
            session,
            post.copyWith(
              ownerId: user.id,
              owner: user,
              postType: PostType.regular,
            ),
            transaction: transaction,
          );

          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            savedPost.id!,
          );

          unawaited(
            notifyTaggedOrMentionedUsers(
              session,
              user,
              savedPost,
            ),
          );

          return savedPost;
        }
      } catch (e, stackTrace) {
        session.log(
          'Error in savePost: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<Post?> savePoll(Session session, Post post) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);

        if (post.id != null) {
          final existingPost = await validatePostOwnership(
            session,
            post.id!,
            user,
          );

          await updatePost(
            session,
            post.copyWith(
              updatedAt: DateTime.now(),
              pollId: existingPost.pollId,
              commentCount: existingPost.commentCount,
              postType: existingPost.postType,
              dateCreated: existingPost.dateCreated,
            ),
          );
          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            post.id!,
          );
          return existingPost;
        } else {
          // 1. Insert the post first
          final savedPost = await Post.db.insertRow(
            session,
            post.copyWith(
              ownerId: user.id!,
            ),
            transaction: transaction,
          );

          // 2. Save Poll and its options
          final savedPoll = await Poll.db.insertRow(
            session,
            post.poll!,
            transaction: transaction,
          );

          // 3. Save each poll option
          final savedOptions = <PollOption>[];
          for (final option in post.poll!.options ?? []) {
            final savedOption = await PollOption.db.insertRow(
              session,
              option.copyWith(
                pollId: savedPoll.id,
              ),
              transaction: transaction,
            );
            savedOptions.add(savedOption);
          }

          // 4. Update the poll with options list
          final updatedPoll = savedPoll.copyWith(
            options: savedOptions,
          );
          await Poll.db.updateRow(
            session,
            updatedPoll,
            transaction: transaction,
          );

          // 5. Link the poll to the post and update the post again
          await Post.db.updateRow(
            session,
            savedPost.copyWith(
              pollId: updatedPoll.id,
            ),
            transaction: transaction,
          );

          unawaited(
            notifyTaggedOrMentionedUsers(
              session,
              user,
              savedPost,
            ),
          );

          // 6. Return the fully populated post with poll and options
          // Use the same transaction to ensure visibility of uncommitted writes.
          return await Post.db.findById(
            session,
            savedPost.id!,
            include: Post.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              poll: Poll.include(options: PollOption.includeList()),
            ),
            transaction: transaction,
          );
        }
      } catch (e, stackTrace) {
        session.log(
          'Error in savePoll: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<Post?> saveArticle(
    Session session,
    Post post,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        if (post.id != null) {
          final existingPost = await validatePostOwnership(
            session,
            post.id!,
            user,
          );

          await updatePost(
            session,
            post.copyWith(
              updatedAt: DateTime.now(),
              commentCount: existingPost.commentCount,
              postType: existingPost.postType,
              articleId: existingPost.articleId,
              dateCreated: existingPost.dateCreated,
              article: existingPost.article!.copyWith(
                content: post.article!.content,
                tag: [...existingPost.article!.tag!, ...post.article!.tag!],
              ),
            ),
          );
          return existingPost;
        } else {
          final savedPost = await Post.db.insertRow(
            session,
            post.copyWith(
              ownerId: user.id!,
            ),
            transaction: transaction,
          );

          final savedArticle = await Article.db.insertRow(
            session,
            post.article!,
            transaction: transaction,
          );

          await Post.db.updateRow(
            session,
            savedPost.copyWith(
              articleId: savedArticle.id,
            ),
            transaction: transaction,
          );

          unawaited(
            notifyTaggedOrMentionedUsers(
              session,
              user,
              savedPost,
            ),
          );

          return await Post.db.findById(
            session,
            savedPost.id!,
            include: Post.include(
              owner: UserRecord.include(
                userInfo: UserInfo.include(),
              ),
              article: Article.include(),
            ),
            transaction: transaction,
          );
        }
      } catch (e, stackTrace) {
        session.log(
          'Error in saveArticle: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  @doNotGenerate
  Future<void> notifyTaggedOrMentionedUsers(
    Session session,
    UserRecord user,
    Post savedPost,
  ) async {
    if (savedPost.taggedUsers!.isNotEmpty) {
      for (final tag in savedPost.taggedUsers!) {
        unawaited(
          NotificationEndpoint().sendNotification(
            session,
            receiverId: tag.id!,
            senderId: user.id!,
            actionType: NotificationActionType.tag,
            targetType: NotificationTargetType.post,
            targetId: savedPost.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute: '/feed/post/${savedPost.id}',
            body: _getNotificationBody(savedPost.text ?? ''),
            postId: savedPost.id,
          ),
        );
      }
    }

    if (savedPost.mentions!.isNotEmpty) {
      for (final mention in savedPost.mentions!) {
        unawaited(
          NotificationEndpoint().sendNotification(
            session,
            receiverId: mention.id!,
            senderId: user.id!,
            actionType: NotificationActionType.mention,
            targetType: NotificationTargetType.post,
            targetId: savedPost.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute: '/feed/post/${savedPost.id}',
            body: _getNotificationBody(savedPost.text ?? ''),
            postId: savedPost.id,
          ),
        );
      }
    }
  }

  Future<void> castVote(
    Session session,
    int postId,
    int optionId,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      // Fetch the post and poll
      final post = await Post.db.findById(
        session,
        postId,
        include: Post.include(
          poll: Poll.include(
            options: PollOption.includeList(),
          ),
          owner: UserRecord.include(),
        ),
        transaction: transaction,
      );

      if (post == null || post.poll == null) {
        throw ServerSideException(message: 'Poll not found.');
      }

      final poll = post.poll!;

      // Ensure selected option belongs to this poll
      final option = await PollOption.db.findById(
        session,
        optionId,
        transaction: transaction,
      );
      if (option == null || option.pollId != poll.id) {
        throw ServerSideException(message: 'Invalid poll option selected.');
      }

      // Upsert into PollVote: change selection if exists, insert otherwise
      final existingVote = await PollVote.db.findFirstRow(
        session,
        where: (t) => t.pollId.equals(poll.id!) & t.voterId.equals(user.id!),
        transaction: transaction,
      );

      if (existingVote != null) {
        if (existingVote.optionId == optionId) {
          return; // no-op
        }
        await PollVote.db.updateRow(
          session,
          existingVote.copyWith(
            optionId: optionId,
            votedAt: DateTime.now(),
          ),
          transaction: transaction,
        );
      } else {
        await PollVote.db.insertRow(
          session,
          PollVote(
            pollId: poll.id!,
            optionId: optionId,
            voterId: user.id!,
            votedAt: DateTime.now(),
          ),
          transaction: transaction,
        );
      }

      // Auto-log engagement: vote on a poll post
      unawaited(
        EngagementEvent.db.insertRow(
          session,
          EngagementEvent(
            userId: user.id!,
            postId: post.id!,
            type: 'vote',
            createdAt: DateTime.now(),
          ),
        ),
      );

      if (post.ownerId != user.id) {
        unawaited(
          NotificationEndpoint().sendNotification(
            session,
            receiverId: post.ownerId,
            senderId: user.id!,
            actionType: NotificationActionType.vote,
            targetType: NotificationTargetType.post,
            targetId: post.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName:
                getFullName(user.firstName!, user.middleName, user.lastName!),
            actionRoute: '/feed/poll/${post.id}',
            body: _getNotificationBody(post.text ?? ''),
            postId: postId,
          ),
        );

        unawaited(
          NotificationEndpoint().notifyPostSubscribers(
            session,
            senderId: user.id!,
            postId: post.id!,
            actionType: NotificationActionType.vote,
            targetType: NotificationTargetType.post,
            targetId: post.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute: '/feed/post/${post.id}',
            body: _getNotificationBody(post.text ?? ''),
          ),
        );
      }

      return;
    });
  }

  Future<bool> clearVote(
    Session session,
    int pollId,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      // Ensure poll exists
      final poll = await Poll.db.findById(
        session,
        pollId,
        transaction: transaction,
      );
      if (poll == null) {
        throw Exception('Poll not found.');
      }

      final existingVote = await PollVote.db.findFirstRow(
        session,
        where: (t) => t.pollId.equals(pollId) & t.voterId.equals(user.id!),
        transaction: transaction,
      );
      if (existingVote == null) {
        throw ServerSideException(message: 'You have not voted in this poll.');
      }

      await PollVote.db.deleteRow(
        session,
        existingVote,
        transaction: transaction,
      );
      return true;
    });
  }

  Future<Post?> savePostComment(
    Session session,
    Post comment,
    bool isReply,
  ) async {
    try {
      final user = await authUser(session);

      if (comment.id != null) {
        final existingCommentOrReply = await validateCommentOwnership(
          session,
          comment.id!,
          comment.parentId!,
          user,
          isReply,
        );

        await updatePost(
          session,
          comment.copyWith(
            updatedAt: DateTime.now(),
            commentCount: existingCommentOrReply.commentCount,
            postType: existingCommentOrReply.postType,
            dateCreated: existingCommentOrReply.dateCreated,
          ),
        );

        return comment;
      } else {
        Post? parent;
        if (comment.parentId != null) {
          parent = await Post.db.findById(
            session,
            comment.parentId!,
            include: Post.include(
              owner: UserRecord.include(),
            ),
          );
          if (parent != null) {
            await updatePost(
              session,
              parent.copyWith(
                commentCount: parent.commentCount! + 1,
              ),
            );
          }
        }

        final sentComment = await Post.db.insertRow(
          session,
          comment.copyWith(
            owner: user,
            postType: isReply ? PostType.commentReply : PostType.comment,
          ),
        );

        // Auto-log engagement for comment or reply
        unawaited(
          EngagementEvent.db.insertRow(
            session,
            EngagementEvent(
              userId: user.id!,
              postId: parent?.id ?? comment.parentId!,
              type: isReply ? 'reply' : 'comment',
              createdAt: DateTime.now(),
            ),
          ),
        );

        if (parent!.ownerId != user.id) {
          unawaited(
            NotificationEndpoint().sendNotification(
              session,
              receiverId: parent.ownerId,
              senderId: user.id!,
              actionType: isReply
                  ? NotificationActionType.reply
                  : NotificationActionType.comment,
              targetType: NotificationTargetType.post,
              targetId: sentComment.id!,
              senderAvatarUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${sentComment.id!}',
              body: _getNotificationBody(sentComment.text ?? ''),
              postId: sentComment.id!,
            ),
          );

          unawaited(
            NotificationEndpoint().notifyPostSubscribers(
              session,
              senderId: user.id!,
              actionType: isReply
                  ? NotificationActionType.reply
                  : NotificationActionType.comment,
              targetType: NotificationTargetType.post,
              targetId: sentComment.id!,
              postId: parent.id!,
              senderAvatarUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${parent.id}/comments',
              body: _getNotificationBody(sentComment.text ?? ''),
            ),
          );
        }

        unawaited(
          notifyTaggedOrMentionedUsers(
            session,
            user,
            sentComment,
          ),
        );

        return sentComment;
      }
    } catch (e, stackTrace) {
      session.log(
        'Failed to add comment: $e',
        stackTrace: stackTrace,
        level: LogLevel.error,
      );
      return null;
    }
  }

  Future<PostList> getPostComments(
    Session session,
    int postId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(
        message: 'Invalid pagination parameters',
      );
    }
    final user = await authUser(session);
    final ignored = await PostNotInterested.db.find(
      session,
      where: (t) => t.userId.equals(user.id!),
    );
    final ignoredIds = ignored.map((e) => e.postId).toSet();
    final count = await Post.db.count(
      session,
      where: (t) =>
          t.parentId.equals(postId) &
          t.postType.equals(PostType.comment) &
          t.id.notInSet(ignoredIds),
    );

    final results = await Post.db.find(
      session,
      where: (t) =>
          t.parentId.equals(postId) &
          t.postType.equals(PostType.comment) &
          t.id.notInSet(ignoredIds),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    // Enrich with user state flags
    final enriched = await _enrichPosts(session, user, results);

    return PostList(
      count: count,
      results: enriched,
      limit: limit,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<Post> getComment(
    Session session,
    int commentId,
    bool isComment,
  ) async {
    final comment = await Post.db.findById(
      session,
      commentId,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    if (comment == null) {
      throw ServerSideException(
        message: isComment
            ? 'This comment does not exist. It may have been deleted.'
            : 'This reply does not exist. It may have been deleted.',
      );
    }

    return comment;
  }

  Future<PostList> getPostCommentReplies(
    Session session,
    int commentId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(
        message: 'Invalid pagination parameters',
      );
    }

    final user = await authUser(session);
    final ignored = await PostNotInterested.db.find(
      session,
      where: (t) => t.userId.equals(user.id!),
    );
    final ignoredIds = ignored.map((e) => e.postId).toSet();

    final count = await Post.db.count(
      session,
      where: (t) =>
          t.parentId.equals(commentId) &
          t.postType.equals(PostType.commentReply) &
          t.id.notInSet(ignoredIds),
    );

    final results = await Post.db.find(
      session,
      where: (t) =>
          t.parentId.equals(commentId) &
          t.postType.equals(PostType.commentReply) &
          t.id.notInSet(ignoredIds),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    // Enrich with user state flags
    final enriched = await _enrichPosts(session, user, results);

    return PostList(
      count: count,
      results: enriched,
      limit: limit,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<void> schedulePost(
    Session session,
    Post post,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'schedulePostFutureCall',
      post,
      dateTime,
    );
  }

  Future<Post> getRootPost(Session session, Post post) async {
    var current = post;
    while (current.parentId != null) {
      final parent = await Post.db.findById(session, current.parentId!);
      if (parent == null) break;
      current = parent;
    }
    return current;
  }

  Future<Post> quoteProject(
    Session session,
    int projectId,
    Post quoteContent,
  ) async {
    final user = await authUser(session);
    return await session.db.transaction((transaction) async {
      try {
        if (quoteContent.id != null) {
          final existingQuote = await validatePostOwnership(
            session,
            quoteContent.id!,
            user,
          );

          await updatePost(
            session,
            quoteContent.copyWith(
              updatedAt: DateTime.now(),
              projectId: existingQuote.projectId,
              commentCount: existingQuote.commentCount,
              dateCreated: existingQuote.dateCreated,
              postType: existingQuote.postType,
            ),
          );

          return existingQuote;
        } else {
          final selectedProject = await Project.db.findById(
            session,
            projectId,
            transaction: transaction,
            include: Project.include(
              owner: UserRecord.include(),
            ),
          );

          if (selectedProject == null) {
            throw ServerSideException(message: 'Project not found.');
          }

          final sentPost = await Post.db.insertRow(
            session,
            quoteContent.copyWith(
              ownerId: user.id!,
              projectId: selectedProject.id,
            ),
            transaction: transaction,
          );

          selectedProject.quotesCount = selectedProject.quotesCount! + 1;

          await ProjectEndpoint().updateProject(
            session,
            selectedProject,
          );

          await HashtagEndpoint().sendPostHashtags(
            session,
            sentPost.tags ?? [],
            sentPost.id!,
          );

          if (selectedProject.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: selectedProject.ownerId,
                senderId: user.id!,
                actionType: NotificationActionType.quote,
                targetType: NotificationTargetType.project,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: sentPost.id!,
                senderName: getFullName(
                    user.firstName!, user.middleName, user.lastName!),
                actionRoute: '/feed/post/${sentPost.id}',
                body: _getNotificationBody(sentPost.text ?? ''),
                postId: sentPost.id!,
              ),
            );
            unawaited(
              NotificationEndpoint().notifyProjectSubscribers(
                session,
                senderId: user.id!,
                actionType: NotificationActionType.quote,
                targetType: NotificationTargetType.project,
                projectId: selectedProject.id!,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                targetId: sentPost.id!,
                senderName: getFullName(
                    user.firstName!, user.middleName, user.lastName!),
                actionRoute: '/feed/post/${sentPost.id}',
                body: _getNotificationBody(sentPost.text ?? ''),
              ),
            );
          }

          unawaited(
            notifyTaggedOrMentionedUsers(
              session,
              user,
              sentPost,
            ),
          );

          return sentPost.copyWith(
            owner: user,
            project: selectedProject,
          );
        }
      } on ServerSideException {
        rethrow;
      } catch (e, stackTrace) {
        session.log(
          'Error in repostOrQuote: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw ServerSideException(
          message: 'Error reposting or quoting post',
        );
      }
    });
  }

  Future<Post> getPost(
    Session session,
    int id,
  ) async {
    final result = await Post.db.findById(
      session,
      id,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        project: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        parent: Post.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        poll: Poll.include(
          options: PollOption.includeList(),
        ),
        article: Article.include(),
      ),
    );

    if (result == null) {
      throw ServerSideException(
        message: 'This post does not exist. It may have been deleted.',
      );
    }

    return result;
  }

  Future<PostList> getPosts(
    Session session, {
    int limit = 50,
    int page = 1,
    String? contentType, // 'polls' | 'articles' | 'regular' (includes reposts)
  }) async {
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(
        message: 'Invalid pagination parameters',
      );
    }
    final user = await authUser(session);
    final ignored = await PostNotInterested.db.find(
      session,
      where: (t) => t.userId.equals(user.id!),
    );
    final ignoredIds = ignored.map((e) => e.postId).toSet();
    // Build type filter set based on contentType
    Set<PostType>? allowedTypes;
    if (contentType == 'polls') {
      allowedTypes = {PostType.poll};
    } else if (contentType == 'articles') {
      allowedTypes = {PostType.article};
    } else if (contentType == 'regular') {
      // Regular posts and reposts
      allowedTypes = {
        PostType.regular,
        PostType.postRepost,
        PostType.projectRepost
      };
    } else {
      allowedTypes = null; // default: everything except comments & replies
    }

    Expression whereBuilder(PostTable t) {
      final base = t.id.notInSet(ignoredIds);
      if (allowedTypes == null) {
        return base &
            t.postType.notInSet({
              PostType.comment,
              PostType.commentReply,
            });
      }
      return base &
          t.postType.inSet(
            allowedTypes,
          );
    }

    final count = await Post.db.count(
      session,
      where: whereBuilder,
    );
    // Fetch a larger candidate pool for better ranking, then trim to [limit].
    final candidateLimit = (limit * 5).clamp(limit, 500);
    final candidates = await Post.db.find(
      session,
      limit: candidateLimit,
      where: whereBuilder,
      offset: (page * limit) - limit,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        project: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        parent: Post.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        poll: Poll.include(
          options: PollOption.includeList(
            orderBy: (p0) => p0.id,
            orderDescending: false,
          ),
        ),
        article: Article.include(),
      ),
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
    );
    // Rank candidates using heuristic/ML ranker with recent user engagement.
    final ranker = const RecommendationService();
    final userEngagementCounts = await ranker.recentUserEngagementCounts(
      session: session,
      userId: user.id!,
      lookbackHours: 24,
    );
    final ranked = await ranker.rankPosts(
      session: session,
      user: user,
      candidates: candidates,
      userEngagementCounts: userEngagementCounts,
    );
    final results = ranked.take(limit).toList();

    // Auto-log feed impression (list of post ids returned for this page)
    // Fire-and-forget to avoid impacting latency; failures are non-fatal.
    try {
      final impressionPostIds = results
          .map((e) => e.id)
          .where((id) => id != null)
          .cast<int>()
          .toList(growable: false);
      if (impressionPostIds.isNotEmpty) {
        unawaited(
          ImpressionLog.db.insertRow(
            session,
            ImpressionLog(
              userId: user.id!,
              postIds: impressionPostIds,
              page: page,
              createdAt: DateTime.now(),
            ),
          ),
        );
      }
    } catch (e, stackTrace) {
      session.log(
        'Failed to log impression: $e',
        level: LogLevel.warning,
        stackTrace: stackTrace,
      );
    }

    // Enrich with user state flags
    final enriched = await _enrichPosts(session, user, results);

    return PostList(
      count: count,
      limit: limit,
      page: page,
      results: enriched,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  /// TEMPORARY: Log an impression of a feed page. Stores postIds in a short-lived
  /// cache bucket keyed by user and timestamp. Replace with a persistent table.
  @doNotGenerate
  Future<void> logFeedImpression(
    Session session, {
    required List<int> postIds,
    required int page,
  }) async {
    final user = await authUser(session);
    // Persist to ImpressionLog
    await ImpressionLog.db.insertRow(
      session,
      ImpressionLog(
        userId: user.id!,
        postIds: postIds,
        page: page,
        createdAt: DateTime.now(),
      ),
    );
  }

  /// TEMPORARY: Log a single user engagement event (like/bookmark/comment/hide).
  /// For now we only cache; later persist in EngagementEvent table.
  @doNotGenerate
  Future<void> logEngagementEvent(
    Session session, {
    required int postId,
    required String type,
  }) async {
    final user = await authUser(session);
    await EngagementEvent.db.insertRow(
      session,
      EngagementEvent(
        userId: user.id!,
        postId: postId,
        type: type,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> deletePost(
    Session session,
    int id,
  ) async {
    final user = await authUser(
      session,
    );
    final post = await validatePostOwnership(
      session,
      id,
      user,
    );

    if (post.postType == PostType.comment ||
        post.postType == PostType.commentReply) {
      final parent = await Post.db.findById(
        session,
        post.parentId!,
      );
      if (parent != null) {
        parent.commentCount = parent.commentCount! - 1;
        await updatePost(
          session,
          parent.copyWith(
            commentCount: parent.commentCount,
          ),
        );
      }
    } else if (post.postType == PostType.projectRepost) {
      final project = await Project.db.findById(
        session,
        post.projectId!,
      );
      if (project != null) {
        project.quotesCount = project.quotesCount! - 1;
        await ProjectEndpoint().updateProject(
          session,
          project.copyWith(
            quotesCount: project.quotesCount,
          ),
        );
      }
    }

    await Post.db.deleteRow(
      session,
      post,
    );
  }

  Future<void> clearBookmarks(Session session) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(
          session,
        );
        final userBookmarks = await PostBookmarks.db.find(
          session,
          where: (t) => t.ownerId.equals(user.id!),
          include: PostBookmarks.include(
            post: Post.include(),
          ),
        );
        final posts = userBookmarks.map((e) => e.post!);
        for (final post in posts) {
          final current = post.bookmarksCount ?? 0;
          post.bookmarksCount = current > 0 ? current - 1 : 0;
          await updatePost(session, post);
        }
        await PostBookmarks.db.deleteWhere(
          session,
          where: (t) => t.ownerId.equals(user.id!),
        );
      } catch (e, stackTrace) {
        session.log(
          'Error in clearPostBookmarks: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw ServerSideException(
          message: 'Error clearing bookmarks',
        );
      }
    });
  }

  Future<void> toggleBookmark(
    Session session,
    int postId,
  ) async {
    final user = await authUser(session);

    await session.db.transaction((transaction) async {
      try {
        final post = await Post.db.findById(
          session,
          postId,
          transaction: transaction,
          include: Post.include(
            owner: UserRecord.include(),
          ),
        );
        if (post == null) {
          throw ServerSideException(
            message: "Post not found",
          );
        }

        final existingBookmark = await PostBookmarks.db.findFirstRow(
          session,
          where: (t) =>
              t.postId.equals(
                postId,
              ) &
              t.ownerId.equals(
                user.id!,
              ),
          transaction: transaction,
        );

        String engagementType;
        if (existingBookmark != null) {
          await PostBookmarks.db.deleteRow(
            session,
            existingBookmark,
            transaction: transaction,
          );
          post.bookmarksCount = post.bookmarksCount! - 1;
          engagementType = 'unbookmark';
        } else {
          await PostBookmarks.db.insertRow(
            session,
            PostBookmarks(
              postId: postId,
              ownerId: user.id!,
            ),
            transaction: transaction,
          );
          post.bookmarksCount = post.bookmarksCount! + 1;
          engagementType = 'bookmark';
        }
        await updatePost(session, post);
        // Log bookmark engagement event
        unawaited(
          EngagementEvent.db.insertRow(
            session,
            EngagementEvent(
              userId: user.id!,
              postId: postId,
              type: engagementType,
              createdAt: DateTime.now(),
            ),
          ),
        );
      } catch (e, stackTrace) {
        session.log(
          'Error in toggleBookmark: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

  Future<void> toggleLike(
    Session session,
    int postId,
  ) async {
    await session.db.transaction((transaction) async {
      try {
        final user = await authUser(
          session,
        );

        final post = await Post.db.findById(
          session,
          postId,
          transaction: transaction,
          include: Post.include(
            owner: UserRecord.include(),
          ),
        );
        if (post == null) {
          throw ServerSideException(
            message: "Post not found",
          );
        }

        final existingLike = await PostLikes.db.findFirstRow(
          session,
          where: (t) =>
              t.postId.equals(
                postId,
              ) &
              t.ownerId.equals(
                user.id!,
              ),
          transaction: transaction,
        );

        String engagementType;
        if (existingLike != null) {
          await PostLikes.db.deleteRow(
            session,
            existingLike,
            transaction: transaction,
          );
          post.likesCount = post.likesCount! - 1;
          engagementType = 'unlike';
        } else {
          await PostLikes.db.insertRow(
            session,
            PostLikes(
              postId: postId,
              ownerId: user.id!,
              dateCreated: DateTime.now(),
            ),
            transaction: transaction,
          );
          post.likesCount = post.likesCount! + 1;
          engagementType = 'like';

          if (post.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: post.ownerId,
                senderId: user.id!,
                actionType: NotificationActionType.like,
                targetType: NotificationTargetType.post,
                targetId: post.id!,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/feed/post/${post.id}',
                body: _getNotificationBody(post.text ?? ''),
                postId: post.id!,
              ),
            );
            unawaited(
              NotificationEndpoint().notifyPostSubscribers(
                session,
                postId: post.id!,
                senderId: user.id!,
                actionType: NotificationActionType.like,
                targetType: NotificationTargetType.post,
                targetId: post.id!,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/feed/post/${post.id}',
                body: _getNotificationBody(post.text ?? ''),
              ),
            );
          }
        }
        await updatePost(session, post);
        // Log like/unlike engagement event
        unawaited(
          EngagementEvent.db.insertRow(
            session,
            EngagementEvent(
              userId: user.id!,
              postId: postId,
              type: engagementType,
              createdAt: DateTime.now(),
            ),
          ),
        );
      } catch (e, stackTrace) {
        session.log(
          'Error in togglePostLike: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

  Future<void> subscribeToPost(Session session, int postId) async {
    return await session.db.transaction((transaction) async {
      // Authenticate the user
      final user = await authUser(session);

      final post = await Post.db.findById(
        session,
        postId,
      );

      if (post == null) {
        throw ServerSideException(
          message: 'Post not found',
        );
      }

      final exists = await PostSubscription.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id!) & t.postId.equals(postId),
      );

      if (exists != null) {
        await PostSubscription.db.deleteWhere(
          session,
          where: (t) => t.userId.equals(user.id!) & t.postId.equals(postId),
        );
        // Log unsubscribe engagement
        unawaited(
          EngagementEvent.db.insertRow(
            session,
            EngagementEvent(
              userId: user.id!,
              postId: postId,
              type: 'unsubscribe',
              createdAt: DateTime.now(),
            ),
          ),
        );
        return;
      } else {
        await PostSubscription.db.insertRow(
          session,
          PostSubscription(
            userId: user.id!,
            postId: postId,
            createdAt: DateTime.now(),
          ),
        );

        // Log subscribe engagement
        unawaited(
          EngagementEvent.db.insertRow(
            session,
            EngagementEvent(
              userId: user.id!,
              postId: postId,
              type: 'subscribe',
              createdAt: DateTime.now(),
            ),
          ),
        );

        return;
      }
    });
  }

  Future<PostList> getUserPostBookmarks(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      final count = await PostBookmarks.db.count(
        session,
        where: (t) => t.ownerId.equals(user.id!),
      );

      final bookmarks = await PostBookmarks.db.find(
        session,
        where: (t) => t.ownerId.equals(user.id!),
        limit: limit,
        offset: (page - 1) * limit,
        orderBy: (t) => t.dateCreated,
        orderDescending: true,
        include: PostBookmarks.include(
          post: Post.include(
            owner: UserRecord.include(
              userInfo: UserInfo.include(),
            ),
            project: Project.include(
              owner: UserRecord.include(
                userInfo: UserInfo.include(),
              ),
            ),
            poll: Poll.include(
              options: PollOption.includeList(),
            ),
            article: Article.include(),
            parent: Post.include(
              owner: UserRecord.include(
                userInfo: UserInfo.include(),
              ),
            ),
          ),
        ),
      );
      final results = bookmarks.map((e) => e.post!).toList();
      final enriched = await _enrichPosts(session, user, results);
      return PostList(
        count: count,
        limit: limit,
        page: page,
        results: enriched,
        numPages: (count / limit).ceil(),
        canLoadMore: page * limit < count,
      );
    });
  }

  // Build PostWithUserState list for the given posts for the current user
  @doNotGenerate
  Future<List<PostWithUserState>> _enrichPosts(
    Session session,
    UserRecord user,
    List<Post> posts,
  ) async {
    if (posts.isEmpty) return const <PostWithUserState>[];

    final postIds = posts.map((p) => p.id!).toSet();
    final pollIds =
        posts.where((p) => p.pollId != null).map((p) => p.pollId!).toSet();

    Future<Set<int>> asIdSet<T>(Future<List<T>> fut, int Function(T) id) async {
      final rows = await fut;
      return rows.map(id).toSet();
    }

    // Likes by this user on these posts
    final likedSet = await asIdSet(
      PostLikes.db.find(
        session,
        where: (t) => t.postId.inSet(postIds) & t.ownerId.equals(user.id!),
      ),
      (r) => r.postId,
    );

    // Bookmarks by this user on these posts
    final bookmarkedSet = await asIdSet(
      PostBookmarks.db.find(
        session,
        where: (t) => t.postId.inSet(postIds) & t.ownerId.equals(user.id!),
      ),
      (r) => r.postId,
    );

    // Subscriptions by this user on these posts
    final subscribedSet = await asIdSet(
      PostSubscription.db.find(
        session,
        where: (t) => t.postId.inSet(postIds) & t.userId.equals(user.id!),
      ),
      (r) => r.postId,
    );

    // Poll votes by this user for polls present in these posts
    final Map<int, int> selectedOptionByPollId = {};
    if (pollIds.isNotEmpty) {
      final votes = await PollVote.db.find(
        session,
        where: (t) => t.pollId.inSet(pollIds) & t.voterId.equals(user.id!),
      );
      for (final v in votes) {
        selectedOptionByPollId[v.pollId] = v.optionId;
      }
    }

    return posts
        .map(
          (p) => PostWithUserState(
            post: p,
            hasLiked: likedSet.contains(p.id!),
            hasBookmarked: bookmarkedSet.contains(p.id!),
            isSubscribed: subscribedSet.contains(p.id!),
            selectedPollOptionId:
                p.pollId != null ? selectedOptionByPollId[p.pollId!] : null,
          ),
        )
        .toList();
  }

  Future<void> markNotInterested(
    Session session,
    int postId,
    String reason,
  ) async {
    try {
      final user = await authUser(session);
      final entry = PostNotInterested(
        userId: user.id!,
        postId: postId,
        reason: reason,
      );

      await PostNotInterested.db.insertRow(
        session,
        entry,
      );

      // Auto-log engagement: user marked post not interested
      unawaited(
        EngagementEvent.db.insertRow(
          session,
          EngagementEvent(
            userId: user.id!,
            postId: postId,
            type: 'notInterested',
            createdAt: DateTime.now(),
          ),
        ),
      );
    } catch (e, stackTrace) {
      session.log(
        'Error in markPostNotInterested: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
    }
  }

  Stream<Post> postUpdates(Session session, int postId) async* {
    // Create a message stream for this post
    var updateStream = session.messages.createStream<Post>('post_$postId');

    // Yield the latest post details when the client subscribes
    var post = await Post.db.findById(
      session,
      postId,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        project: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        parent: Post.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        poll: Poll.include(
          options: PollOption.includeList(
            orderBy: (p0) => p0.id,
            orderDescending: false,
          ),
        ),
        article: Article.include(),
      ),
    );
    if (post != null) {
      yield post;
    }

    // Send updates when changes occur
    await for (var postUpdate in updateStream) {
      yield postUpdate.copyWith(
        owner: post!.owner,
        project: post.project,
        parent: post.parent,
        poll: post.poll,
        article: post.article,
      );
    }
  }

  @doNotGenerate
  Future<UserRecord> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(
        message: 'You must be logged in',
      );
    }

    // Fetch the user record from the local database
    var cacheKey = 'UserData-${authInfo.userId}';
    var userRecord = await session.caches.localPrio.get<UserRecord>(cacheKey);

    if (userRecord == null) {
      userRecord = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(authInfo.userId),
        include: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      );
      if (userRecord != null) {
        await session.caches.localPrio.put(
          cacheKey,
          userRecord,
          lifetime: Duration(
            days: 1,
          ),
        );
        return userRecord;
      }
    }
    if (userRecord == null) {
      throw ServerSideException(message: 'User not found');
    }
    return userRecord;
  }

  @doNotGenerate
  Future<Post> validatePostOwnership(
    Session session,
    int postId,
    UserRecord user,
  ) async {
    final post = await Post.db.findById(
      session,
      postId,
    );
    if (post == null) {
      throw ServerSideException(
        message: 'Post not found',
      );
    }
    if (post.ownerId != user.id) {
      throw ServerSideException(
        message: 'Unauthorised operation',
      );
    }
    return post;
  }

  @doNotGenerate
  Future<Post> validateCommentOwnership(
    Session session,
    int commentId,
    int postId,
    UserRecord user,
    bool isReply,
  ) async {
    final comment = await Post.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(commentId) &
          t.parentId.equals(postId) &
          t.ownerId.equals(user.id) &
          (isReply
              ? t.postType.equals(PostType.commentReply)
              : t.postType.equals(PostType.comment)),
    );
    if (comment == null) {
      throw ServerSideException(
        message: isReply ? 'Reply not found' : 'Comment not found',
      );
    }
    if (comment.ownerId != user.id) {
      throw ServerSideException(
        message: 'Unauthorised operation',
      );
    }
    return comment;
  }

  @doNotGenerate
  Future<void> updatePost(Session session, Post post) async {
    // Update the project in the database
    await Post.db.updateRow(session, post);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'post_${post.id}',
      post,
    );
  }

  @doNotGenerate
  String getFullName(String firstName, String? middleName, String lastName) {
    if (middleName == null || middleName.trim().isEmpty) {
      return '$firstName $lastName';
    }
    return '$firstName $middleName $lastName';
  }

  @doNotGenerate
  String? _getNotificationBody(String text) {
    if (text.isEmpty) return null;
    if (text.length > 150) {
      return '${text.substring(0, 150)}...';
    }
    return text;
  }
}
