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

          final updatedPost = post.copyWith(
            updatedAt: DateTime.now(),
            projectId: existingPost.projectId,
            parentId: existingPost.parentId,
            pollId: existingPost.pollId,
            commentCount: existingPost.commentCount,
            postType: existingPost.postType,
            dateCreated: existingPost.dateCreated,
          );

          await updatePost(
            session,
            updatedPost,
          );
          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            post.id!,
          );
          return updatedPost;
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

  Future<Post?> repostPost(
    Session session,
    int postId,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final original = await Post.db.findById(
          session,
          postId,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            article: Article.include(),
            poll: Poll.include(options: PollOption.includeList()),
            project: Project.include(
                owner: UserRecord.include(userInfo: UserInfo.include())),
          ),
          transaction: transaction,
        );
        if (original == null) {
          throw ServerSideException(message: 'Original post not found.');
        }

        final existing = await PostReposts.db.findFirstRow(
          session,
          where: (t) =>
              t.ownerId.equals(user.id!) & t.postId.equals(original.id!),
          transaction: transaction,
        );
        if (existing != null) {
          await PostReposts.db.deleteRow(
            session,
            existing,
            transaction: transaction,
          );
          final existingRepost = await Post.db.findFirstRow(
            session,
            where: (t) =>
                t.ownerId.equals(user.id!) &
                t.parentId.equals(original.id!) &
                t.postType.equals(PostType.postRepost) &
                t.isDeleted.equals(false),
            transaction: transaction,
          );
          Post? updated;
          if (existingRepost != null) {
            updated = existingRepost.copyWith(isDeleted: true);
            await updatePost(session, updated);
          }
          final current = original.repostCount ?? 0;
          final updatedOriginal = original.copyWith(
            repostCount: current > 0 ? current - 1 : 0,
          );
          await updatePost(session, updatedOriginal);
          unawaited(
            EngagementEvent.db.insertRow(
              session,
              EngagementEvent(
                userId: user.id!,
                postId: original.id!,
                type: 'unrepost',
                createdAt: DateTime.now(),
              ),
            ),
          );
          return updated?.copyWith(owner: user, parent: original);
        }

        final repost = await Post.db.insertRow(
          session,
          Post(
            ownerId: user.id!,
            parentId: original.id,
            postType: PostType.postRepost,
          ),
          transaction: transaction,
        );

        await PostReposts.db.insertRow(
          session,
          PostReposts(
            postId: original.id!,
            ownerId: user.id!,
            dateCreated: DateTime.now(),
          ),
          transaction: transaction,
        );

        final updatedOriginal = original.copyWith(
          repostCount: (original.repostCount ?? 0) + 1,
        );
        await updatePost(session, updatedOriginal);

        unawaited(
          EngagementEvent.db.insertRow(
            session,
            EngagementEvent(
              userId: user.id!,
              postId: original.id!,
              type: 'repost',
              createdAt: DateTime.now(),
            ),
          ),
        );

        if (original.ownerId != user.id) {
          final targetType = original.article != null
              ? NotificationTargetType.article
              : original.poll != null
                  ? NotificationTargetType.poll
                  : NotificationTargetType.post;

          unawaited(
            NotificationEndpoint().sendNotification(
              session,
              receiverId: original.ownerId,
              senderId: user.id!,
              actionType: NotificationActionType.repost,
              targetType: targetType,
              targetId: repost.id!,
              senderAvatarUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${repost.id}',
              body: _getNotificationBody(repost.text ?? ''),
              postId: repost.id,
            ),
          );

          unawaited(
            NotificationEndpoint().notifyPostSubscribers(
              session,
              senderId: user.id!,
              actionType: NotificationActionType.repost,
              targetType: targetType,
              targetId: repost.id!,
              postId: original.id!,
              senderAvatarUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${repost.id}',
              body: _getNotificationBody(repost.text ?? ''),
            ),
          );
        }

        return repost.copyWith(owner: user, parent: original);
      } catch (e, stackTrace) {
        session.log(
          'Error in repostPost: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<Post?> quotePost(
    Session session,
    int postId,
    Post quoteContent,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final original = await Post.db.findById(
          session,
          postId,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            article: Article.include(),
            poll: Poll.include(options: PollOption.includeList()),
            project: Project.include(
                owner: UserRecord.include(userInfo: UserInfo.include())),
          ),
          transaction: transaction,
        );
        if (original == null) {
          throw ServerSideException(message: 'Original post not found.');
        }

        // Resolve the root post to normalize counts & join tracking
        final root = await getRootPost(session, original);

        final sentPost = await Post.db.insertRow(
          session,
          quoteContent.copyWith(
            ownerId: user.id!,
            // Preserve chain by quoting the selected post (which may itself be a quote)
            parentId: original.id,
          ),
          transaction: transaction,
        );

        await PostQuotes.db.insertRow(
          session,
          PostQuotes(
            // Track against the root so multiple layers map to a single original
            postId: root.id!,
            ownerId: user.id!,
            dateCreated: DateTime.now(),
          ),
          transaction: transaction,
        );

        await HashtagEndpoint().sendPostHashtags(
          session,
          quoteContent.tags ?? [],
          sentPost.id!,
        );

        // Increment root's repost/share count
        final updatedOriginal = root.copyWith(
          repostCount: (root.repostCount ?? 0) + 1,
        );
        await updatePost(session, updatedOriginal);

        unawaited(
          EngagementEvent.db.insertRow(
            session,
            EngagementEvent(
              userId: user.id!,
              postId: original.id!,
              type: 'quote',
              createdAt: DateTime.now(),
            ),
          ),
        );

        if (original.ownerId != user.id) {
          final targetType = original.article != null
              ? NotificationTargetType.article
              : original.poll != null
                  ? NotificationTargetType.poll
                  : NotificationTargetType.post;

          unawaited(
            NotificationEndpoint().sendNotification(
              session,
              receiverId: original.ownerId,
              senderId: user.id!,
              actionType: NotificationActionType.quote,
              targetType: targetType,
              targetId: sentPost.id!,
              senderAvatarUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${sentPost.id}',
              body: _getNotificationBody(sentPost.text ?? ''),
              postId: sentPost.id,
            ),
          );

          // Notify subscribers of the root thread
          unawaited(
            NotificationEndpoint().notifyPostSubscribers(
              session,
              senderId: user.id!,
              actionType: NotificationActionType.quote,
              targetType: targetType,
              targetId: sentPost.id!,
              postId: root.id!,
              senderAvatarUrl: user.userInfo!.imageUrl!,
              senderName: getFullName(
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${sentPost.id}',
              body: _getNotificationBody(sentPost.text ?? ''),
            ),
          );
        }

        return sentPost.copyWith(owner: user, parent: original);
      } catch (e, stackTrace) {
        session.log(
          'Error in quotePost: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<void> logPostImpressions(
    Session session,
    List<int> postIds,
    String? viewport,
    String? source,
  ) async {
    if (postIds.isEmpty) return;
    if (postIds.length > 100) {
      throw Exception('Too many postIds in a single impression batch');
    }

    late final UserRecord viewer;
    try {
      viewer = await authUser(session);
    } catch (e, st) {
      session.log(
        'logPostImpressions skipped: unauthenticated. postIds=${postIds.take(5).toList()}...',
        level: LogLevel.debug,
        exception: e,
        stackTrace: st,
      );
      return;
    }

    final now = DateTime.now().toUtc();
    final hourBucket = DateTime.utc(
      now.year,
      now.month,
      now.day,
      now.hour,
    );

    final distinctIds = postIds.toSet();

    await session.db.transaction((tx) async {
      for (final pid in distinctIds) {
        try {
          final sessionTag = 'user:${viewer.id!}';
          final impression = PostImpression(
            postId: pid,
            viewerId: viewer.id!,
            viewer: viewer,
            sessionId: sessionTag,
            source: source,
            hourBucket: hourBucket,
            createdAt: now,
          );
          await PostImpression.db.insertRow(
            session,
            impression,
            transaction: tx,
          );
        } catch (e) {
          continue;
        }

        final post = await Post.db.findById(
          session,
          pid,
          transaction: tx,
        );
        if (post != null) {
          post.impressionsCount = (post.impressionsCount ?? 0) + 1;
          post.lastImpressionAt = now;
          await Post.db.updateRow(
            session,
            post,
            transaction: tx,
          );
        }
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

          final updatedPost = post.copyWith(
            updatedAt: DateTime.now(),
            projectId: existingPost.projectId,
            parentId: existingPost.parentId,
            pollId: existingPost.pollId,
            commentCount: existingPost.commentCount,
            postType: existingPost.postType,
            dateCreated: existingPost.dateCreated,
          );

          await updatePost(
            session,
            updatedPost,
          );
          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            post.id!,
          );
          return updatedPost;
        } else {
          final savedPost = await Post.db.insertRow(
            session,
            post.copyWith(
              ownerId: user.id!,
            ),
            transaction: transaction,
          );

          final savedPoll = await Poll.db.insertRow(
            session,
            post.poll!,
            transaction: transaction,
          );

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

          final updatedPoll = savedPoll.copyWith(
            options: savedOptions,
          );
          await Poll.db.updateRow(
            session,
            updatedPoll,
            transaction: transaction,
          );

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

          final updatedPost = post.copyWith(
            updatedAt: DateTime.now(),
            parentId: existingPost.parentId,
            commentCount: existingPost.commentCount,
            postType: existingPost.postType,
            dateCreated: existingPost.dateCreated,
            articleId: existingPost.articleId,
            article: existingPost.article!.copyWith(
              content: post.article!.content,
              tag: [...existingPost.article!.tag!, ...post.article!.tag!],
            ),
          );

          await updatePost(
            session,
            updatedPost,
          );
          return updatedPost;
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
            targetType: savedPost.article != null
                ? NotificationTargetType.article
                : savedPost.poll != null
                    ? NotificationTargetType.poll
                    : NotificationTargetType.post,
            targetId: savedPost.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute:
                '/feed/${savedPost.article != null ? 'article' : savedPost.poll != null ? 'poll' : 'post'}/${savedPost.id}',
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
            targetType: savedPost.article != null
                ? NotificationTargetType.article
                : savedPost.poll != null
                    ? NotificationTargetType.poll
                    : NotificationTargetType.post,
            targetId: savedPost.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute:
                '/feed/${savedPost.article != null ? 'article' : savedPost.poll != null ? 'poll' : 'post'}/${savedPost.id}',
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

      final option = await PollOption.db.findById(
        session,
        optionId,
        transaction: transaction,
      );
      if (option == null || option.pollId != poll.id) {
        throw ServerSideException(message: 'Invalid poll option selected.');
      }

      final existingVote = await PollVote.db.findFirstRow(
        session,
        where: (t) => t.pollId.equals(poll.id!) & t.voterId.equals(user.id!),
        transaction: transaction,
      );

      if (existingVote != null) {
        if (existingVote.optionId == optionId) {
          return;
        }
        // Update the user's vote to the new option.
        await PollVote.db.updateRow(
          session,
          existingVote.copyWith(
            optionId: optionId,
            votedAt: DateTime.now(),
          ),
          transaction: transaction,
        );

        // Decrement the previous option's count.
        final prevOption = await PollOption.db.findById(
          session,
          existingVote.optionId,
          transaction: transaction,
        );
        if (prevOption != null) {
          await PollOption.db.updateRow(
            session,
            prevOption.copyWith(
              votesCount: (((prevOption.votesCount ?? 0) - 1) < 0)
                  ? 0
                  : (prevOption.votesCount ?? 0) - 1,
            ),
            transaction: transaction,
          );
        }

        // Increment the newly selected option's count.
        await PollOption.db.updateRow(
          session,
          option.copyWith(
            votesCount: (option.votesCount ?? 0) + 1,
          ),
          transaction: transaction,
        );

        // Total poll votes remain unchanged when switching options.
        // Broadcast updated poll counts (options changed) within the transaction.
        await updatePoll(session, poll, transaction: transaction);
      } else {
        // First-time vote: insert and increment counts.
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

        // Increment the selected option's count.
        await PollOption.db.updateRow(
          session,
          option.copyWith(
            votesCount: (option.votesCount ?? 0) + 1,
          ),
          transaction: transaction,
        );

        // Increment the poll's total votes and broadcast using fresh counts within the transaction.
        await updatePoll(
          session,
          poll.copyWith(
            votesCount: (poll.votesCount ?? 0) + 1,
          ),
          transaction: transaction,
        );
      }

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
            targetType: NotificationTargetType.poll,
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
            targetType: NotificationTargetType.poll,
            targetId: post.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute: '/feed/poll/${post.id}',
            body: _getNotificationBody(post.text ?? ''),
          ),
        );
      }

      return;
    });
  }

  Future<void> clearVote(
    Session session,
    int pollId,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      final poll = await Poll.db.findById(
        session,
        pollId,
        transaction: transaction,
        include: Poll.include(
          options: PollOption.includeList(),
        ),
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

      final option = await PollOption.db.findById(
        session,
        existingVote.optionId,
        transaction: transaction,
      );

      if (option == null || option.pollId != poll.id) {
        throw ServerSideException(message: 'Invalid poll option.');
      }

      await PollVote.db.deleteRow(
        session,
        existingVote,
        transaction: transaction,
      );

      await PollOption.db.updateRow(
        session,
        option.copyWith(
          votesCount: (((option.votesCount ?? 0) - 1) < 0)
              ? 0
              : (option.votesCount ?? 0) - 1,
        ),
        transaction: transaction,
      );

      await updatePoll(
        session,
        poll.copyWith(
          votesCount: (((poll.votesCount ?? 0) - 1) < 0)
              ? 0
              : (poll.votesCount ?? 0) - 1,
        ),
        transaction: transaction,
      );
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

        final updatedComment = comment.copyWith(
          updatedAt: DateTime.now(),
          commentCount: existingCommentOrReply.commentCount,
          postType: existingCommentOrReply.postType,
          dateCreated: existingCommentOrReply.dateCreated,
        );

        await updatePost(
          session,
          updatedComment,
        );

        return updatedComment.copyWith(
          owner: user,
        );
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

  Future<PostWithUserState> getComment(
    Session session,
    int commentId,
    bool isComment,
  ) async {
    final user = await authUser(session);
    final comment = await Post.db.findById(
      session,
      commentId,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        poll: Poll.include(options: PollOption.includeList()),
        article: Article.include(),
        project: Project.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
        ),
        parent: Post.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
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

    final enriched = await _enrichPosts(
      session,
      user,
      [comment],
    );
    return enriched.first;
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

          final updatedQuote = quoteContent.copyWith(
            updatedAt: DateTime.now(),
            projectId: existingQuote.projectId,
            commentCount: existingQuote.commentCount,
            dateCreated: existingQuote.dateCreated,
            postType: existingQuote.postType,
          );

          await updatePost(
            session,
            updatedQuote,
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

  Future<PostWithUserState> getPost(
    Session session,
    int id,
  ) async {
    final user = await authUser(session);
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

    final enriched = await _enrichPosts(
      session,
      user,
      [result],
    );
    return enriched.first;
  }

  Future<PostList> getPosts(
    Session session, {
    int limit = 50,
    int page = 1,
    String? contentType,
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
        PostType.projectQuote
      };
    } else {
      allowedTypes = null;
    }

    Expression whereBuilder(PostTable t) {
      final base = t.id.notInSet(ignoredIds) & t.isDeleted.equals(false);
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
          project: Project.include(
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

  @doNotGenerate
  Future<void> logFeedImpression(
    Session session, {
    required List<int> postIds,
    required int page,
  }) async {
    final user = await authUser(session);

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
    return await session.db.transaction((tx) async {
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
          transaction: tx,
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
      } else if (post.postType == PostType.projectQuote) {
        final project = await Project.db.findById(
          session,
          post.projectId!,
          transaction: tx,
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

      await updatePost(
        session,
        post.copyWith(
          isDeleted: true,
        ),
      );
    });
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
                targetType: post.postType == PostType.article
                    ? NotificationTargetType.article
                    : post.postType == PostType.poll
                        ? NotificationTargetType.poll
                        : post.postType == PostType.commentReply
                            ? NotificationTargetType.reply
                            : post.postType == PostType.comment
                                ? NotificationTargetType.comment
                                : NotificationTargetType.post,
                targetId: post.id!,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute:
                    '/feed/${post.article != null ? 'article' : post.poll != null ? 'poll' : 'post'}/${post.id}',
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
                targetType: post.postType == PostType.article
                    ? NotificationTargetType.article
                    : post.postType == PostType.poll
                        ? NotificationTargetType.poll
                        : post.postType == PostType.commentReply
                            ? NotificationTargetType.reply
                            : post.postType == PostType.comment
                                ? NotificationTargetType.comment
                                : NotificationTargetType.post,
                targetId: post.id!,
                senderAvatarUrl: user.userInfo!.imageUrl!,
                senderName: getFullName(
                  user.firstName!,
                  user.middleName,
                  user.lastName!,
                ),
                actionRoute:
                    '/feed/${post.article != null ? 'article' : post.poll != null ? 'poll' : 'post'}/${post.id}',
                body: _getNotificationBody(post.text ?? ''),
              ),
            );
          }
        }
        await updatePost(session, post);
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
    final ownerIds = posts.map((p) => p.ownerId).whereType<int>().toSet();

    Future<Set<int>> asIdSet<T>(Future<List<T>> fut, int Function(T) id) async {
      final rows = await fut;
      return rows.map(id).toSet();
    }

    final likedSet = await asIdSet(
      PostLikes.db.find(
        session,
        where: (t) => t.postId.inSet(postIds) & t.ownerId.equals(user.id!),
      ),
      (r) => r.postId,
    );

    final bookmarkedSet = await asIdSet(
      PostBookmarks.db.find(
        session,
        where: (t) => t.postId.inSet(postIds) & t.ownerId.equals(user.id!),
      ),
      (r) => r.postId,
    );

    final repostedSet = await asIdSet(
      PostReposts.db.find(
        session,
        where: (t) => t.postId.inSet(postIds) & t.ownerId.equals(user.id!),
      ),
      (r) => r.postId,
    );

    final subscribedSet = await asIdSet(
      PostSubscription.db.find(
        session,
        where: (t) => t.postId.inSet(postIds) & t.userId.equals(user.id!),
      ),
      (r) => r.postId,
    );

    final followingOwnerSet = await asIdSet(
      UserFollow.db.find(
        session,
        where: (t) =>
            t.followerId.equals(user.id!) & t.followeeId.inSet(ownerIds),
      ),
      (r) => r.followeeId,
    );

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
            hasReposted: repostedSet.contains(p.id!),
            isSubscribed: subscribedSet.contains(p.id!),
            isFollower: followingOwnerSet.contains(p.ownerId),
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

  Stream<PostCounts> postCountsUpdates(
    Session session,
    int postId,
  ) async* {
    final updateStream = session.messages.createStream<PostCounts>(
      'post_counts_$postId',
    );
    final initial = await Post.db.findById(session, postId);
    if (initial != null) yield _buildPostCounts(initial);
    await for (final counts in updateStream) {
      yield counts;
    }
  }

  Stream<PollCounts> pollCountsUpdates(Session session, int pollId) async* {
    final stream =
        session.messages.createStream<PollCounts>('poll_counts_$pollId');
    final initial = await _loadCounts(session, pollId);
    if (initial != null) yield initial;
    await for (final update in stream) {
      yield update;
    }
  }

  PollCounts _buildPollCounts(Poll poll) {
    return PollCounts(
      pollId: poll.id!,
      votesCount: poll.votesCount ?? 0,
      options: poll.options
          ?.map(
            (o) => PollOptionCount(
              optionId: o.id!,
              votesCount: o.votesCount ?? 0,
            ),
          )
          .toList(),
    );
  }

  Future<PollCounts?> _loadCounts(Session session, int pollId,
      {Transaction? transaction}) async {
    final poll = await Poll.db.findById(
      session,
      pollId,
      include: Poll.include(options: PollOption.includeList()),
      transaction: transaction,
    );
    if (poll == null) return null;
    return _buildPollCounts(poll);
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
    await Post.db.updateRow(session, post);
    session.messages.postMessage(
      'post_counts_${post.id}',
      _buildPostCounts(post),
    );
  }

  @doNotGenerate
  Future<void> updatePoll(Session session, Poll poll,
      {Transaction? transaction}) async {
    await Poll.db.updateRow(session, poll, transaction: transaction);
    final counts =
        await _loadCounts(session, poll.id!, transaction: transaction);
    if (counts != null) {
      session.messages.postMessage(
        'poll_counts_${poll.id}',
        counts,
      );
    }
  }

  @doNotGenerate
  PostCounts _buildPostCounts(Post post) {
    return PostCounts(
      postId: post.id!,
      likesCount: post.likesCount ?? 0,
      repostCount: post.repostCount ?? 0,
      bookmarksCount: post.bookmarksCount ?? 0,
      commentCount: post.commentCount ?? 0,
      impressionsCount: post.impressionsCount ?? 0,
      lastImpressionAt: post.lastImpressionAt,
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
