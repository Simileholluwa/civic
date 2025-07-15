import 'dart:async';

import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/endpoints/notification_endpoint.dart';
import 'package:civic_server/src/endpoints/project_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
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
              likedBy: existingPost.likedBy,
              bookmarkedBy: existingPost.bookmarkedBy,
              projectId: existingPost.projectId,
              parentId: existingPost.parentId,
              pollId: existingPost.pollId,
              quotedOrRepostedFromUserId:
                  existingPost.quotedOrRepostedFromUserId,
              commentCount: existingPost.commentCount,
              postType: existingPost.postType,
              dateCreated: existingPost.dateCreated,
              subscribers: existingPost.subscribers,
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
              likedBy: [],
              bookmarkedBy: [],
              subscribers: [],
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
              'post',
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
              likedBy: existingPost.likedBy,
              bookmarkedBy: existingPost.bookmarkedBy,
              pollId: existingPost.pollId,
              commentCount: existingPost.commentCount,
              postType: existingPost.postType,
              dateCreated: existingPost.dateCreated,
              subscribers: existingPost.subscribers,
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
              likedBy: [],
              bookmarkedBy: [],
              subscribers: [],
            ),
            transaction: transaction,
          );

          // 2. Save Poll and its options
          final savedPoll = await Poll.db.insertRow(
            session,
            post.poll!.copyWith(
              votedBy: [],
            ),
            transaction: transaction,
          );

          // 3. Save each poll option
          final savedOptions = <PollOption>[];
          for (final option in post.poll!.options ?? []) {
            final savedOption = await PollOption.db.insertRow(
              session,
              option.copyWith(
                pollId: savedPoll.id,
                votedBy: [],
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
              'poll',
            ),
          );

          // 6. Return the fully populated post with poll and options
          return await Post.db.findById(
            session,
            savedPost.id!,
            include: Post.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              poll: Poll.include(options: PollOption.includeList()),
            ),
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
              likedBy: existingPost.likedBy,
              bookmarkedBy: existingPost.bookmarkedBy,
              commentCount: existingPost.commentCount,
              postType: existingPost.postType,
              articleId: existingPost.articleId,
              dateCreated: existingPost.dateCreated,
              subscribers: existingPost.subscribers,
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
              likedBy: [],
              bookmarkedBy: [],
              subscribers: [],
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
              'article',
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
    String type,
  ) async {
    if (savedPost.taggedUsers!.isNotEmpty) {
      for (final tag in savedPost.taggedUsers!) {
        unawaited(
          NotificationEndpoint().sendNotification(
            session,
            receiverId: tag.id!,
            senderId: user.id!,
            actionType: 'tagged you in an $type',
            targetType: '',
            targetId: savedPost.id!,
            mediaThumbnailUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute: '/feed/$type/${savedPost.id}',
            content: savedPost.text!.length > 100
                ? '${savedPost.text!.substring(0, 100)}...'
                : savedPost.text!,
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
            actionType: 'mentioned you in a $type',
            targetType: '',
            targetId: savedPost.id!,
            mediaThumbnailUrl: user.userInfo!.imageUrl!,
            senderName:
                getFullName(user.firstName!, user.middleName, user.lastName!),
            actionRoute: '/feed/$type/${savedPost.id}',
            content: savedPost.text!.length > 100
                ? '${savedPost.text!.substring(0, 100)}...'
                : savedPost.text!,
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

      // Fetch the poll
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

      if (post == null) {
        throw PostException(message: 'Poll not found.');
      }

      final poll = post.poll!;

      // Check if user has already voted
      if (poll.votedBy!.contains(user.id)) {
        final options = await PollOption.db.find(
          session,
          where: (o) => o.pollId.equals(poll.id),
          transaction: transaction,
        );

        // Find the one the user voted on
        PollOption? votedOption = options.firstWhere(
          (option) => option.votedBy!.contains(user.id!),
          orElse: () => throw PostException(
            message: 'You have not voted for this option.',
          ),
        );

        if (votedOption.id == optionId) return;

        final updatedOption = votedOption.copyWith(
          votedBy: votedOption.votedBy!
              .where(
                (id) => id != user.id!,
              )
              .toList(),
        );

        await PollOption.db.updateRow(
          session,
          updatedOption,
          transaction: transaction,
        );

        poll.votedBy = poll.votedBy!
            .where(
              (id) => id != user.id!,
            )
            .toList();
      }

      // Ensure selected option belongs to the poll
      final option = await PollOption.db.findById(
        session,
        optionId,
        transaction: transaction,
      );

      if (option == null || option.pollId != poll.id) {
        throw PostException(message: 'Invalid poll option selected.');
      }

      // Update PollOption's votedBy
      final updatedOption = option.copyWith(
        votedBy: [
          ...option.votedBy!,
          user.id!,
        ],
      );

      await PollOption.db.updateRow(
        session,
        updatedOption,
        transaction: transaction,
      );

      final updatedPoll = poll.copyWith(
        votedBy: [...poll.votedBy!, user.id!],
      );

      await Poll.db.updateRow(
        session,
        updatedPoll,
        transaction: transaction,
      );

      await updatePost(
        session,
        post,
      );

      if (post.ownerId != user.id) {
        unawaited(
          NotificationEndpoint().sendNotification(
            session,
            receiverId: post.ownerId,
            senderId: user.id!,
            actionType: 'voted in',
            targetType: 'poll',
            targetId: post.id!,
            mediaThumbnailUrl: user.userInfo!.imageUrl!,
            senderName:
                getFullName(user.firstName!, user.middleName, user.lastName!),
            actionRoute: '/feed/poll/${post.id}',
            content: post.text!.length > 100
                ? '${post.text!.substring(0, 100)}...'
                : post.text!,
          ),
        );

        unawaited(
          NotificationEndpoint().notifyPostSubscribers(
            session,
            senderId: user.id!,
            postId: post.id!,
            triggerUser: getFullName(
              post.owner!.firstName!,
              post.owner!.middleName,
              post.owner!.lastName!,
            ),
            actionType: 'voted in',
            targetType: 'poll',
            targetId: post.id!,
            mediaThumbnailUrl: user.userInfo!.imageUrl!,
            senderName:
                getFullName(user.firstName!, user.middleName, user.lastName!),
            actionRoute: '/feed/poll/${post.id}',
            content: post.text!.length > 100
                ? '${post.text!.substring(0, 100)}...'
                : post.text!,
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
      final userId = user.id!;

      // Fetch the poll
      final poll = await Poll.db.findById(
        session,
        pollId,
        transaction: transaction,
      );

      if (poll == null) {
        throw Exception('Poll not found.');
      }

      // Check if user has voted
      if (!poll.votedBy!.contains(userId)) {
        throw Exception('You have not voted.');
      }

      // Fetch all options for the poll
      final options = await PollOption.db.find(
        session,
        where: (o) => o.pollId.equals(pollId),
        transaction: transaction,
      );

      // Find the one the user voted on
      PollOption? votedOption = options.firstWhere(
        (option) => option.votedBy!.contains(userId),
        orElse: () => throw PostException(
          message: 'You have not voted in this poll.',
        ),
      );

      // Remove user from PollOption.votedBy
      final updatedOption = votedOption.copyWith(
        votedBy: votedOption.votedBy!
            .where(
              (id) => id != userId,
            )
            .toList(),
      );

      await PollOption.db.updateRow(
        session,
        updatedOption,
        transaction: transaction,
      );

      // // Remove user from Poll.votedBy
      // final updatedPoll = poll.copyWith(
      //   votedBy: poll.votedBy!
      //       .where(
      //         (id) => id != userId,
      //       )
      //       .toList(),
      // );
      return true;
    });
  }

  Future<PostList> getPolls(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    final user = await authUser(session);
    final ignored = await PostNotInterested.db.find(
      session,
      where: (t) => t.userId.equals(user.id!),
    );
    final ignoredIds = ignored.map((e) => e.postId).toSet();
    final count = await Post.db.count(
      session,
      where: (t) =>
          t.postType.equals(PostType.poll) & t.id.notInSet(ignoredIds),
    );
    final results = await Post.db.find(
      session,
      where: (t) =>
          t.postType.equals(PostType.poll) & t.id.notInSet(ignoredIds),
      limit: limit,
      offset: (page * limit) - limit,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        poll: Poll.include(
          options: PollOption.includeList(
            orderBy: (p0) => p0.id,
            orderDescending: false,
          ),
        ),
      ),
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
    );

    return PostList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<PostList> getArticles(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    final user = await authUser(session);
    final ignored = await PostNotInterested.db.find(
      session,
      where: (t) => t.userId.equals(user.id!),
    );
    final ignoredIds = ignored.map((e) => e.postId).toSet();
    final count = await Post.db.count(
      session,
      where: (t) =>
          t.postType.equals(PostType.article) & t.id.notInSet(ignoredIds),
    );
    final results = await Post.db.find(
      session,
      where: (t) =>
          t.postType.equals(PostType.article) & t.id.notInSet(ignoredIds),
      limit: limit,
      offset: (page * limit) - limit,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        article: Article.include(),
      ),
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
    );

    return PostList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
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
            likedBy: existingCommentOrReply.likedBy,
            bookmarkedBy: existingCommentOrReply.bookmarkedBy,
            commentCount: existingCommentOrReply.commentCount,
            postType: existingCommentOrReply.postType,
            dateCreated: existingCommentOrReply.dateCreated,
            subscribers: existingCommentOrReply.subscribers,
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
            likedBy: [],
            bookmarkedBy: [],
            subscribers: [],
          ),
        );

        if (parent!.ownerId != user.id) {
          unawaited(
            NotificationEndpoint().sendNotification(
              session,
              receiverId: parent.ownerId,
              senderId: user.id!,
              actionType: isReply ? 'replied to' : 'commented on',
              targetType: isReply ? 'comment' : 'post',
              targetId: sentComment.id!,
              mediaThumbnailUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${sentComment.id!}',
              content: sentComment.text!.length > 100
                  ? '${sentComment.text!.substring(0, 100)}...'
                  : sentComment.text!,
            ),
          );

          unawaited(
            NotificationEndpoint().notifyPostSubscribers(
              session,
              senderId: user.id!,
              actionType: isReply ? 'replied to' : 'commented on',
              targetType: isReply ? 'comment' : 'post',
              targetId: sentComment.id!,
              triggerUser: getFullName(
                parent.owner!.firstName!,
                parent.owner!.middleName,
                parent.owner!.lastName!,
              ),
              postId: parent.id!,
              mediaThumbnailUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${parent.id}/comments',
              content: sentComment.text!.length > 100
                  ? '${sentComment.text!.substring(0, 100)}...'
                  : sentComment.text!,
            ),
          );
        }

        unawaited(
          notifyTaggedOrMentionedUsers(
            session,
            user,
            sentComment,
            'post',
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
      throw UserException(
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

    return PostList(
      count: count,
      results: results,
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
      throw PostException(
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
      throw UserException(
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

    return PostList(
      count: count,
      results: results,
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
              likedBy: existingQuote.likedBy,
              bookmarkedBy: existingQuote.bookmarkedBy,
              projectId: existingQuote.projectId,
              quotedOrRepostedFromUserId:
                  existingQuote.quotedOrRepostedFromUserId,
              commentCount: existingQuote.commentCount,
              dateCreated: existingQuote.dateCreated,
              postType: existingQuote.postType,
              subscribers: existingQuote.subscribers,
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
            throw PostException(message: 'Project not found.');
          }

          final sentPost = await Post.db.insertRow(
            session,
            quoteContent.copyWith(
              ownerId: user.id!,
              projectId: selectedProject.id,
              likedBy: [],
              bookmarkedBy: [],
              subscribers: [],
            ),
            transaction: transaction,
          );

          selectedProject.quoteCount = (selectedProject.quoteCount ?? 0) + 1;

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
                actionType: 'quoted',
                targetType: 'project',
                mediaThumbnailUrl: user.userInfo!.imageUrl!,
                targetId: sentPost.id!,
                senderName: getFullName(
                    user.firstName!, user.middleName, user.lastName!),
                actionRoute: '/feed/post/${sentPost.id}',
                content: sentPost.text == null
                    ? null
                    : sentPost.text!.length > 100
                        ? '${sentPost.text!.substring(0, 100)}...'
                        : sentPost.text!,
              ),
            );
            unawaited(
              NotificationEndpoint().notifyProjectSubscribers(
                session,
                senderId: user.id!,
                actionType: 'quoted',
                targetType: 'project',
                triggerUser: getFullName(
                  selectedProject.owner!.firstName!,
                  selectedProject.owner!.middleName,
                  selectedProject.owner!.lastName!,
                ),
                projectId: selectedProject.id!,
                mediaThumbnailUrl: user.userInfo!.imageUrl!,
                targetId: sentPost.id!,
                senderName: getFullName(
                    user.firstName!, user.middleName, user.lastName!),
                actionRoute: '/feed/post/${sentPost.id}',
                content: sentPost.text == null
                    ? null
                    : sentPost.text!.length > 100
                        ? '${sentPost.text!.substring(0, 100)}...'
                        : sentPost.text!,
              ),
            );
          }

          unawaited(
            notifyTaggedOrMentionedUsers(
              session,
              user,
              sentPost,
              'article',
            ),
          );

          return sentPost.copyWith(
            quotedOrRepostedFromUser: user,
            owner: user,
            project: selectedProject,
          );
        }
      } on PostException {
        rethrow;
      } catch (e, stackTrace) {
        session.log(
          'Error in repostOrQuote: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(
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
      throw PostException(
        message: 'This post does not exist. It may have been deleted.',
      );
    }

    return result;
  }

  Future<PostList> getPosts(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw PostException(
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
      where: (t) => (t.postType.equals(PostType.regular) |
          t.postType.equals(PostType.postRepost) |
          t.postType.equals(PostType.projectRepost) &
              t.id.notInSet(ignoredIds)),
    );
    final results = await Post.db.find(
      session,
      limit: limit,
      where: (t) => (t.postType.equals(PostType.regular) |
          t.postType.equals(PostType.postRepost) |
          t.postType.equals(PostType.projectRepost) &
              t.id.notInSet(ignoredIds)),
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
        quotedOrRepostedFromUser: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
    );

    return PostList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
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
        project.quoteCount = project.quoteCount! - 1;
        await ProjectEndpoint().updateProject(
          session,
          project.copyWith(
            quoteCount: project.quoteCount,
          ),
        );
      }
    }

    await Post.db.deleteRow(
      session,
      post,
    );
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
          throw PostException(
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
                user.userInfoId,
              ),
          transaction: transaction,
        );

        if (existingBookmark != null) {
          await PostBookmarks.db.deleteRow(
            session,
            existingBookmark,
            transaction: transaction,
          );
          post.bookmarkedBy?.remove(user.id!);
        } else {
          await PostBookmarks.db.insertRow(
            session,
            PostBookmarks(
              postId: postId,
              ownerId: user.id!,
            ),
            transaction: transaction,
          );
          post.bookmarkedBy?.add(user.id!);

          if (post.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: post.ownerId,
                senderId: user.id!,
                actionType: 'bookmarked',
                targetType: 'post',
                targetId: post.id!,
                mediaThumbnailUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/feed/post/${post.id}',
                content: post.text == null
                    ? null
                    : post.text!.length > 100
                        ? '${post.text!.substring(0, 100)}...'
                        : post.text!,
              ),
            );
            unawaited(
              NotificationEndpoint().notifyPostSubscribers(
                session,
                triggerUser: getFullName(
                  post.owner!.firstName!,
                  post.owner!.middleName,
                  post.owner!.lastName!,
                ),
                postId: post.id!,
                senderId: user.id!,
                actionType: 'bookmarked',
                targetType: 'post',
                targetId: post.id!,
                mediaThumbnailUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/feed/post/${post.id}',
                content: post.text == null
                    ? null
                    : post.text!.length > 100
                        ? '${post.text!.substring(0, 100)}...'
                        : post.text!,
              ),
            );
          }
        }
        await updatePost(session, post);
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
          throw PostException(
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
                user.userInfoId,
              ),
          transaction: transaction,
        );

        if (existingLike != null) {
          await PostLikes.db.deleteRow(
            session,
            existingLike,
            transaction: transaction,
          );
          post.likedBy?.remove(user.id!);
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
          post.likedBy?.add(user.id!);

          if (post.ownerId != user.id) {
            unawaited(
              NotificationEndpoint().sendNotification(
                session,
                receiverId: post.ownerId,
                senderId: user.id!,
                actionType: 'liked',
                targetType: 'post',
                targetId: post.id!,
                mediaThumbnailUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/feed/post/${post.id}',
                content: post.text == null
                    ? null
                    : post.text!.length > 100
                        ? '${post.text!.substring(0, 100)}...'
                        : post.text!,
              ),
            );
            unawaited(
              NotificationEndpoint().notifyPostSubscribers(
                session,
                postId: post.id!,
                triggerUser: getFullName(
                  post.owner!.firstName!,
                  post.owner!.middleName,
                  post.owner!.lastName!,
                ),
                senderId: user.id!,
                actionType: 'liked',
                targetType: 'post',
                targetId: post.id!,
                mediaThumbnailUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute: '/feed/post/${post.id}',
                content: post.text == null
                    ? null
                    : post.text!.length > 100
                        ? '${post.text!.substring(0, 100)}...'
                        : post.text!,
              ),
            );
          }
        }
        await updatePost(session, post);
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
        throw PostException(
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
        await updatePost(
          session,
          post.copyWith(
            subscribers: post.subscribers
                    ?.where(
                      (id) => id != user.id!,
                    )
                    .toList() ??
                [],
          ),
        );
        return;
      }

      await PostSubscription.db.insertRow(
        session,
        PostSubscription(
          userId: user.id!,
          postId: postId,
          createdAt: DateTime.now(),
        ),
      );

      await updatePost(
        session,
        post.copyWith(
          subscribers: [...post.subscribers ?? [], user.id!],
        ),
      );
    });
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
        quotedOrRepostedFromUser: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
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
        quotedOrRepostedFromUser: post.quotedOrRepostedFromUser,
      );
    }
  }

  @doNotGenerate
  Future<UserRecord> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(
        message: 'You must be logged in',
      );
    }

    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(
        authInfo.userId,
      ),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    return user;
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
      throw PostException(
        message: 'Post not found',
      );
    }
    if (post.ownerId != user.userInfoId) {
      throw PostException(
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
      throw PostException(
        message: isReply ? 'Reply not found' : 'Comment not found',
      );
    }
    if (comment.ownerId != user.userInfoId) {
      throw PostException(
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
}
