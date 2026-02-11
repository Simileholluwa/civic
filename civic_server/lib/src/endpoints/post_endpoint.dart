import 'dart:async';

import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/endpoints/notification_endpoint.dart';
import 'package:civic_server/src/endpoints/project_endpoint.dart';
import 'package:civic_server/src/generated/endpoints.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:civic_server/src/services/recommendation_service.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// Endpoint for managing posts, articles, polls, comments, and related
/// engagement. Also handles synchronization of associated media assets and
/// emits real-time count updates via Serverpod message streams.
class PostEndpoint extends Endpoint {
  /// Synchronizes media assets for a post.
  ///
  /// Performs a set-based reconciliation using `objectKey`:
  /// - Inserts new assets not present on the post.
  /// - Updates existing assets if any metadata changed.
  /// - Deletes stale assets (and their storage objects) no longer referenced.
  ///
  /// Parameters:
  /// - [session]: Current request session.
  /// - [user]: Authenticated owner performing the change.
  /// - [existingPost]: The post whose assets are being updated.
  /// - [incoming]: Desired list of `MediaAsset` (may be null/empty).
  /// - [transaction]: Optional DB transaction context.
  @doNotGenerate
  Future<void> _syncMediaAssetsForPost(
    Session session, {
    required UserRecord user,
    required Post existingPost,
    required List<MediaAsset>? incoming,
    Transaction? transaction,
  }) async {
    final existing = await MediaAsset.db.find(
      session,
      where: (t) => t.postId.equals(existingPost.id!),
      transaction: transaction,
    );
    final existingByKey = {for (final e in existing) e.objectKey: e};
    final incomingList = incoming ?? const <MediaAsset>[];
    final incomingKeys = <String>{};
    final inserts = <MediaAsset>[];
    final updates = <MediaAsset>[];

    for (final a in incomingList) {
      final key = a.objectKey;
      if (key.isEmpty || incomingKeys.contains(key)) continue;
      incomingKeys.add(key);
      final current = existingByKey[key];
      if (current == null) {
        inserts.add(a.copyWith(ownerId: user.id!, postId: existingPost.id!));
        continue;
      }
      final changed =
          (current.publicUrl != a.publicUrl) ||
          (current.contentType != a.contentType) ||
          (current.size != a.size) ||
          (current.width != a.width) ||
          (current.height != a.height) ||
          (current.durationMs != a.durationMs) ||
          (current.kind != a.kind);
      if (changed) {
        updates.add(
          current.copyWith(
            publicUrl: a.publicUrl,
            contentType: a.contentType,
            size: a.size,
            width: a.width,
            height: a.height,
            durationMs: a.durationMs,
            kind: a.kind,
          ),
        );
      }
    }

    final staleKeys = existingByKey.keys
        .where((k) => !incomingKeys.contains(k))
        .toSet();
    if (staleKeys.isNotEmpty) {
      await MediaAsset.db.deleteWhere(
        session,
        where: (t) =>
            t.postId.equals(existingPost.id!) & t.objectKey.inSet(staleKeys),
        transaction: transaction,
      );
      for (final key in staleKeys) {
        unawaited(session.storage.deleteFile(storageId: 'public', path: key));
      }
    }

    if (updates.isNotEmpty) {
      for (final u in updates) {
        await MediaAsset.db.updateRow(session, u, transaction: transaction);
      }
    }

    if (inserts.isNotEmpty) {
      await MediaAsset.db.insert(session, inserts, transaction: transaction);
    }
  }

  /// Creates or updates a regular post.
  ///
  /// On update, media assets are synchronized and hashtags recorded.
  /// Returns the enriched `Post` including owner and media assets.
  Future<Post?> savePost(Session session, Post post) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      if (post.id != null) {
        final existingPost = await validatePostOwnership(
          session,
          post.id!,
          user,
        );
        await _syncMediaAssetsForPost(
          session,
          user: user,
          existingPost: existingPost,
          incoming: post.mediaAssets,
          transaction: transaction,
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

        await updatePost(session, updatedPost);

        await HashtagEndpoint().sendPostHashtags(
          session,
          post.tags ?? [],
          post.id!,
        );

        final enriched = await Post.db.findById(
          session,
          updatedPost.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            mediaAssets: MediaAsset.includeList(),
          ),
          transaction: transaction,
        );
        return enriched;
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

        if ((post.mediaAssets?.isNotEmpty ?? false)) {
          await MediaAsset.db.insert(
            session,
            post.mediaAssets!
                .map(
                  (e) => e.copyWith(ownerId: user.id!, postId: savedPost.id!),
                )
                .toList(),
            transaction: transaction,
          );
        }

        await HashtagEndpoint().sendPostHashtags(
          session,
          post.tags ?? [],
          savedPost.id!,
        );

        unawaited(notifyTaggedOrMentionedUsers(session, user, savedPost));

        final withAssets = await Post.db.findById(
          session,
          savedPost.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            mediaAssets: MediaAsset.includeList(),
          ),
          transaction: transaction,
        );
        return withAssets;
      }
    });
  }

  /// Reposts an existing post, toggling if already reposted.
  ///
  /// Updates repost counts, inserts engagement events and notifications.
  Future<Post?> repostPost(Session session, int postId) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      final original = await Post.db.findById(
        session,
        postId,
        include: Post.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
          article: Article.include(),
          poll: Poll.include(options: PollOption.includeList()),
          project: Project.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
          ),
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
        final targetType = original.postType == PostType.article
            ? NotificationTargetType.article
            : original.postType == PostType.poll
            ? NotificationTargetType.poll
            : original.postType == PostType.commentReply
            ? NotificationTargetType.reply
            : original.postType == PostType.comment
            ? NotificationTargetType.comment
            : NotificationTargetType.post;

        final route = original.article != null
            ? 'article'
            : original.poll != null
            ? 'poll'
            : 'post';

        unawaited(
          NotificationEndpoint().sendNotification(
            session,
            receiverId: original.ownerId,
            senderId: user.id!,
            actionType: NotificationActionType.repost,
            targetType: targetType,
            targetId: original.id!,
            senderAvatarUrl: user.userInfo!.imageUrl!,
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
            actionRoute: '/feed/$route/${repost.id}',
            body: _getNotificationBody(repost.text ?? ''),
            postId: original.id,
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
    });
  }

  /// Creates a quote post referencing another post.
  ///
  /// Increments repost count on the root post, logs engagement, and
  /// dispatches relevant notifications.
  Future<Post?> quotePost(
    Session session,
    int postId,
    Post quoteContent,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      final original = await Post.db.findById(
        session,
        postId,
        include: Post.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
          article: Article.include(),
          poll: Poll.include(options: PollOption.includeList()),
        ),
        transaction: transaction,
      );
      if (original == null) {
        throw ServerSideException(message: 'Original post not found.');
      }

      final sentPost = await Post.db.insertRow(
        session,
        quoteContent.copyWith(ownerId: user.id!, parentId: original.id),
        transaction: transaction,
      );

      await PostQuotes.db.insertRow(
        session,
        PostQuotes(
          postId: original.id!,
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

        unawaited(
          NotificationEndpoint().notifyPostSubscribers(
            session,
            senderId: user.id!,
            actionType: NotificationActionType.quote,
            targetType: targetType,
            targetId: sentPost.id!,
            postId: original.id!,
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
    });
  }

  /// Logs batch post impressions for the authenticated viewer.
  ///
  /// Each impression is bucketed by hour and increments a post's
  /// impression counters.
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
    final hourBucket = DateTime.utc(now.year, now.month, now.day, now.hour);

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

        final post = await Post.db.findById(session, pid, transaction: tx);
        if (post != null) {
          post.impressionsCount = (post.impressionsCount ?? 0) + 1;
          post.lastImpressionAt = now;
          await Post.db.updateRow(session, post, transaction: tx);
        }
      }
    });
  }

  /// Creates or updates a poll post and its options.
  ///
  /// On create, inserts poll/options and associates them with the post.
  /// Returns the updated or newly created `Post` with poll included.
  Future<Post?> savePoll(Session session, Post post) async {
    return await session.db.transaction((transaction) async {
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
          pollId: existingPost.pollId,
          commentCount: existingPost.commentCount,
          postType: existingPost.postType,
          dateCreated: existingPost.dateCreated,
        );

        await updatePost(session, updatedPost);
        await HashtagEndpoint().sendPostHashtags(
          session,
          post.tags ?? [],
          post.id!,
        );
        return updatedPost;
      } else {
        final savedPost = await Post.db.insertRow(
          session,
          post.copyWith(ownerId: user.id!),
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
            option.copyWith(pollId: savedPoll.id),
            transaction: transaction,
          );
          savedOptions.add(savedOption);
        }

        final updatedPoll = savedPoll.copyWith(options: savedOptions);
        await Poll.db.updateRow(session, updatedPoll, transaction: transaction);

        await Post.db.updateRow(
          session,
          savedPost.copyWith(pollId: updatedPoll.id),
          transaction: transaction,
        );

        unawaited(notifyTaggedOrMentionedUsers(session, user, savedPost));

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
    });
  }

  /// Creates or updates an article post and synchronizes its media.
  ///
  /// On update, preserves post metadata linkage, updates the article row,
  /// and returns the enriched `Post` with `Article` and assets.
  Future<Post> saveArticle(Session session, Post post) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      if (post.id != null) {
        final existingPost = await validatePostOwnership(
          session,
          post.id!,
          user,
        );

        final existingMedia = await MediaAsset.db.findFirstRow(
          session,
          where: (a) =>
              a.postId.equals(existingPost.id!) & a.ownerId.equals(user.id!),
          transaction: transaction,
        );

        await MediaAsset.db.updateRow(
          session,
          post.mediaAssets!.first.copyWith(
            ownerId: user.id!,
            postId: post.id!,
            id: existingMedia?.id,
          ),
          transaction: transaction,
        );

        final updatedPost = post.copyWith(
          updatedAt: DateTime.now(),
          parentId: existingPost.parentId,
          commentCount: existingPost.commentCount,
          postType: existingPost.postType,
          dateCreated: existingPost.dateCreated,
          articleId: existingPost.articleId,
        );

        await Article.db.updateRow(
          session,
          post.article!.copyWith(id: existingPost.articleId),
          transaction: transaction,
        );

        await updatePost(session, updatedPost);

        final enriched = await Post.db.findById(
          session,
          updatedPost.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            article: Article.include(),
            mediaAssets: MediaAsset.includeList(),
          ),
          transaction: transaction,
        );
        return enriched!;
      } else {
        final savedPost = await Post.db.insertRow(
          session,
          post.copyWith(ownerId: user.id!),
          transaction: transaction,
        );

        final savedArticle = await Article.db.insertRow(
          session,
          post.article!,
          transaction: transaction,
        );

        await Post.db.updateRow(
          session,
          savedPost.copyWith(articleId: savedArticle.id),
          transaction: transaction,
        );

        if ((post.mediaAssets?.isNotEmpty ?? false)) {
          await MediaAsset.db.insertRow(
            session,
            post.mediaAssets!.first.copyWith(
              ownerId: user.id!,
              postId: savedPost.id!,
            ),
            transaction: transaction,
          );
        }

        unawaited(notifyTaggedOrMentionedUsers(session, user, savedPost));

        final sent = await Post.db.findById(
          session,
          savedPost.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            article: Article.include(),
            mediaAssets: MediaAsset.includeList(),
          ),
          transaction: transaction,
        );

        if (sent == null) {
          throw ServerSideException(
            message: 'Something went wrong while saving your article',
          );
        }

        return sent;
      }
    });
  }

  /// Sends notifications to tagged users and mentioned users for a post.
  ///
  /// Dispatches per-user notification events with appropriate target types.
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
                '/feed/${savedPost.article != null
                    ? 'article'
                    : savedPost.poll != null
                    ? 'poll'
                    : 'post'}/${savedPost.id}',
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
                '/feed/${savedPost.article != null
                    ? 'article'
                    : savedPost.poll != null
                    ? 'poll'
                    : 'post'}/${savedPost.id}',
            body: _getNotificationBody(savedPost.text ?? ''),
            postId: savedPost.id,
          ),
        );
      }
    }
  }

  /// Casts or changes a vote on a poll option and updates counts.
  ///
  /// Emits engagement events and sends notifications if applicable.
  Future<void> castVote(Session session, int postId, int optionId) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      final post = await Post.db.findById(
        session,
        postId,
        include: Post.include(
          poll: Poll.include(options: PollOption.includeList()),
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
        await PollVote.db.updateRow(
          session,
          existingVote.copyWith(optionId: optionId, votedAt: DateTime.now()),
          transaction: transaction,
        );

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

        await PollOption.db.updateRow(
          session,
          option.copyWith(votesCount: (option.votesCount ?? 0) + 1),
          transaction: transaction,
        );

        await updatePoll(session, poll, transaction: transaction);
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

        await PollOption.db.updateRow(
          session,
          option.copyWith(votesCount: (option.votesCount ?? 0) + 1),
          transaction: transaction,
        );

        await updatePoll(
          session,
          poll.copyWith(votesCount: (poll.votesCount ?? 0) + 1),
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
            senderName: getFullName(
              user.firstName!,
              user.middleName,
              user.lastName!,
            ),
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

  /// Clears the authenticated user's vote in a given poll.
  ///
  /// Updates option and poll counts accordingly.
  Future<void> clearVote(Session session, int pollId) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      final poll = await Poll.db.findById(
        session,
        pollId,
        transaction: transaction,
        include: Poll.include(options: PollOption.includeList()),
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

  /// Creates or updates a comment or reply on a post.
  ///
  /// On update, synchronizes media assets; on create, inserts media and
  /// dispatches notifications and engagement events.
  Future<Post?> savePostComment(
    Session session,
    Post comment,
    bool isReply,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      if (comment.id != null) {
        final existingCommentOrReply = await validateCommentOwnership(
          session,
          comment.id!,
          comment.parentId!,
          user,
          isReply,
        );

        await _syncMediaAssetsForPost(
          session,
          user: user,
          existingPost: existingCommentOrReply,
          incoming: comment.mediaAssets,
          transaction: transaction,
        );

        final updatedComment = comment.copyWith(
          updatedAt: DateTime.now(),
          commentCount: existingCommentOrReply.commentCount,
          postType: existingCommentOrReply.postType,
          dateCreated: existingCommentOrReply.dateCreated,
        );

        await updatePost(session, updatedComment, transaction: transaction);

        return await Post.db.findById(
          session,
          comment.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            mediaAssets: MediaAsset.includeList(),
          ),
          transaction: transaction,
        );
      } else {
        Post? parent;
        if (comment.parentId != null) {
          parent = await Post.db.findById(
            session,
            comment.parentId!,
            include: Post.include(owner: UserRecord.include()),
            transaction: transaction,
          );
          if (parent != null) {
            await updatePost(
              session,
              parent.copyWith(commentCount: parent.commentCount! + 1),
              transaction: transaction,
            );
          }
        }

        final sentComment = await Post.db.insertRow(
          session,
          comment.copyWith(
            owner: user,
            postType: isReply ? PostType.commentReply : PostType.comment,
          ),
          transaction: transaction,
        );

        if (comment.mediaAssets != null && comment.mediaAssets!.isNotEmpty) {
          await MediaAsset.db.insert(
            session,
            comment.mediaAssets != null
                ? comment.mediaAssets!
                      .map(
                        (e) => e.copyWith(
                          ownerId: user.id!,
                          postId: sentComment.id!,
                        ),
                      )
                      .toList()
                : [],
            transaction: transaction,
          );
        }

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

        unawaited(notifyTaggedOrMentionedUsers(session, user, sentComment));

        final enriched = await Post.db.findById(
          session,
          sentComment.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            mediaAssets: MediaAsset.includeList(),
          ),
          transaction: transaction,
        );
        return enriched;
      }
    });
  }

  /// Returns paginated comments for a post, excluding ignored posts.
  ///
  /// Includes owner info and media assets for each comment.
  Future<PostList> getPostComments(
    Session session,
    int postId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(message: 'Invalid pagination parameters');
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
          t.id.notInSet(ignoredIds) &
          t.isDeleted.equals(false),
    );

    final results = await Post.db.find(
      session,
      where: (t) =>
          t.parentId.equals(postId) &
          t.postType.equals(PostType.comment) &
          t.id.notInSet(ignoredIds) &
          t.isDeleted.equals(false),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
      include: Post.include(
        owner: UserRecord.include(userInfo: UserInfo.include()),
        mediaAssets: MediaAsset.includeList(),
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

  /// Returns a single comment or reply enriched with user state.
  /// Throws if the target does not exist.
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
        owner: UserRecord.include(userInfo: UserInfo.include()),
        mediaAssets: MediaAsset.includeList(),
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

    if (comment.isDeleted == true) {
      throw ServerSideException(
        message: isComment
            ? 'This comment has been deleted.'
            : 'This reply has been deleted.',
      );
    }

    final enriched = await _enrichPosts(session, user, [comment]);
    return enriched.first;
  }

  /// Returns paginated replies for a specific comment.
  ///
  /// Includes owner info and media assets for each reply.
  Future<PostList> getPostCommentReplies(
    Session session,
    int commentId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(message: 'Invalid pagination parameters');
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
        owner: UserRecord.include(userInfo: UserInfo.include()),
        mediaAssets: MediaAsset.includeList(),
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

  /// Schedules a post to be sent at a future time using Serverpod.
  Future<void> schedulePost(
    Session session,
    Post post,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCalls
        .callAtTime(dateTime)
        .schedulePost
        .sendPostInFuture(post);
  }

  /// Traverses the parent chain to return the root post for a thread.
  Future<Post> getRootPost(Session session, Post post) async {
    var current = post;
    while (current.parentId != null) {
      final parent = await Post.db.findById(session, current.parentId!);
      if (parent == null) break;
      current = parent;
    }
    return current;
  }

  /// Creates a quote post referencing a project and updates project counts.
  Future<Post> quoteProject(
    Session session,
    int projectId,
    Post quoteContent,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
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

        await updatePost(session, updatedQuote);

        final quote = await Post.db.findById(
          session,
          quoteContent.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            project: Project.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
            ),
          ),
          transaction: transaction,
        );

        if (quote == null) {
          throw ServerSideException(message: 'Quote not found.');
        }

        return quote;
      } else {
        final selectedProject = await Project.db.findById(
          session,
          projectId,
          transaction: transaction,
          include: Project.include(owner: UserRecord.include()),
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
          transaction: transaction,
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
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
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
                user.firstName!,
                user.middleName,
                user.lastName!,
              ),
              actionRoute: '/feed/post/${sentPost.id}',
              body: _getNotificationBody(sentPost.text ?? ''),
            ),
          );
        }

        unawaited(notifyTaggedOrMentionedUsers(session, user, sentPost));

        final serverPost = await Post.db.findById(
          session,
          sentPost.id!,
          include: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            project: Project.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              projectMediaAssets: MediaAsset.includeList(),
            ),
          ),
          transaction: transaction,
        );

        if (serverPost == null) {
          throw ServerSideException(
            message: 'Something went wrong while creating your quote post.',
          );
        }
        return serverPost;
      }
    });
  }

  /// Returns an enriched post by id, including owner, media, and related data.
  Future<PostWithUserState> getPost(Session session, int id) async {
    final user = await authUser(session);
    final cacheKey = 'post:$id';

    // Try cache first for the raw post data
    Post? result = await session.caches.global.get<Post>(cacheKey);

    if (result == null) {
      result = await Post.db.findById(
        session,
        id,
        include: Post.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
          mediaAssets: MediaAsset.includeList(),
          project: Project.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            projectMediaAssets: MediaAsset.includeList(),
          ),
          parent: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            mediaAssets: MediaAsset.includeList(),
            project: Project.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              projectMediaAssets: MediaAsset.includeList(),
            ),
            poll: Poll.include(options: PollOption.includeList()),
            article: Article.include(),
            parent: Post.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              mediaAssets: MediaAsset.includeList(),
              project: Project.include(
                owner: UserRecord.include(userInfo: UserInfo.include()),
                projectMediaAssets: MediaAsset.includeList(),
              ),
              poll: Poll.include(options: PollOption.includeList()),
              article: Article.include(),
            ),
          ),
          poll: Poll.include(options: PollOption.includeList()),
          article: Article.include(),
        ),
      );

      if (result != null) {
        // Cache for 30 minutes
        unawaited(
          session.caches.global.put(
            cacheKey,
            result,
            lifetime: const Duration(minutes: 30),
          ),
        );
      }
    }

    if (result == null) {
      throw ServerSideException(
        message: 'This post does not exist. It may have been deleted.',
      );
    }

    if (result.isDeleted == true) {
      throw ServerSideException(
        message: result.postType == PostType.comment
            ? 'This comment has been deleted.'
            : result.postType == PostType.commentReply
            ? 'This reply has been deleted.'
            : 'This post has been deleted.',
        type: 'deleted',
      );
    }

    final enriched = await _enrichPosts(session, user, [result]);
    return enriched.first;
  }

  /// Returns ranked, paginated feed posts for the authenticated user.
  ///
  /// Supports content-type filtering and logs impressions opportunistically.
  Future<PostList> getPosts(
    Session session, {
    int limit = 50,
    int page = 1,
    String? contentType,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw ServerSideException(message: 'Invalid pagination parameters');
    }

    final user = await authUser(session);
    final cacheKey = 'feed:${user.id}:$contentType:$limit:$page';

    // Try cache first (short TTL for feed freshness)
    PostList? cachedResult = await session.caches.global.get<PostList>(
      cacheKey,
    );
    if (cachedResult != null) {
      return cachedResult;
    }

    final ignored = await PostNotInterested.db.find(
      session,
      where: (t) => t.userId.equals(user.id!),
    );
    final ignoredIds = ignored.map((e) => e.postId).toSet();
    Set<PostType>? allowedTypes;
    if (contentType == 'polls') {
      allowedTypes = {PostType.poll};
    } else if (contentType == 'articles') {
      allowedTypes = {PostType.article};
    } else if (contentType == 'regular') {
      allowedTypes = {
        PostType.regular,
        PostType.postRepost,
        PostType.projectQuote,
      };
    } else {
      allowedTypes = null;
    }

    Expression whereBuilder(PostTable t) {
      final base = t.id.notInSet(ignoredIds) & t.isDeleted.equals(false);
      if (allowedTypes == null) {
        return base &
            t.postType.notInSet({PostType.comment, PostType.commentReply});
      }
      return base & t.postType.inSet(allowedTypes);
    }

    final count = await Post.db.count(session, where: whereBuilder);
    final candidateLimit = (limit * 5).clamp(limit, 500);
    final candidates = await Post.db.find(
      session,
      limit: candidateLimit,
      where: whereBuilder,
      offset: (page * limit) - limit,
      include: Post.include(
        owner: UserRecord.include(userInfo: UserInfo.include()),
        mediaAssets: MediaAsset.includeList(),
        project: Project.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
          projectMediaAssets: MediaAsset.includeList(),
        ),
        parent: Post.include(
          owner: UserRecord.include(userInfo: UserInfo.include()),
          mediaAssets: MediaAsset.includeList(),
          project: Project.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            projectMediaAssets: MediaAsset.includeList(),
          ),
          poll: Poll.include(
            options: PollOption.includeList(
              orderBy: (p0) => p0.id,
              orderDescending: false,
            ),
          ),
          article: Article.include(),
          parent: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            mediaAssets: MediaAsset.includeList(),
            project: Project.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              projectMediaAssets: MediaAsset.includeList(),
            ),
            poll: Poll.include(options: PollOption.includeList()),
            article: Article.include(),
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

    final postList = PostList(
      count: count,
      limit: limit,
      page: page,
      results: enriched,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );

    // Cache for 2 minutes to balance freshness vs performance
    unawaited(
      session.caches.global.put(
        cacheKey,
        postList,
        lifetime: const Duration(minutes: 2),
      ),
    );

    return postList;
  }

  /// Logs a single feed-impression page event for the user.
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

  /// Logs a single engagement event (like, bookmark, repost, etc.).
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

  /// Deletes or soft-deletes a post, updating related counts when needed.
  Future<void> deletePost(
    Session session,
    int id, {
    bool fullDelete = false,
  }) async {
    return await session.db.transaction((tx) async {
      final user = await authUser(session);
      final post = await validatePostOwnership(session, id, user);

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
            parent.copyWith(commentCount: parent.commentCount),
            transaction: tx,
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
            project.copyWith(quotesCount: project.quotesCount),
          );
        }
      }

      if (fullDelete) {
        await Post.db.deleteRow(session, post, transaction: tx);
        return;
      }
      await updatePost(
        session,
        post.copyWith(isDeleted: true),
        transaction: tx,
      );
    });
  }

  /// Clears all bookmarks for the authenticated user and updates counts.
  Future<void> clearBookmarks(Session session) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      final userBookmarks = await PostBookmarks.db.find(
        session,
        where: (t) => t.ownerId.equals(user.id!),
        include: PostBookmarks.include(post: Post.include()),
        transaction: transaction,
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
        transaction: transaction,
      );

      // Invalidate user's bookmarks cache
      unawaited(_invalidateBookmarksCaches(session, user.id!));
    });
  }

  /// Toggles bookmark state on a post for the authenticated user.
  ///
  /// Updates counts and logs a corresponding engagement event.
  Future<void> toggleBookmark(Session session, int postId) async {
    await session.db.transaction((transaction) async {
      final user = await authUser(session);
      final post = await Post.db.findById(
        session,
        postId,
        transaction: transaction,
        include: Post.include(owner: UserRecord.include()),
      );
      if (post == null) {
        throw ServerSideException(message: "Post not found");
      }

      final existingBookmark = await PostBookmarks.db.findFirstRow(
        session,
        where: (t) => t.postId.equals(postId) & t.ownerId.equals(user.id!),
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
          PostBookmarks(postId: postId, ownerId: user.id!),
          transaction: transaction,
        );
        post.bookmarksCount = post.bookmarksCount! + 1;
        engagementType = 'bookmark';
      }
      await updatePost(session, post);

      // Invalidate user's bookmarks cache
      unawaited(_invalidateBookmarksCaches(session, user.id!));

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
    });
  }

  /// Toggles like state on a post for the authenticated user.
  ///
  /// Sends notifications to the post owner and subscribers on like.
  Future<void> toggleLike(Session session, int postId) async {
    await session.db.transaction((transaction) async {
      final user = await authUser(session);

      final post = await Post.db.findById(
        session,
        postId,
        transaction: transaction,
        include: Post.include(owner: UserRecord.include()),
      );
      if (post == null) {
        throw ServerSideException(message: "Post not found");
      }

      final existingLike = await PostLikes.db.findFirstRow(
        session,
        where: (t) => t.postId.equals(postId) & t.ownerId.equals(user.id!),
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
                  '/feed/${post.article != null
                      ? 'article'
                      : post.poll != null
                      ? 'poll'
                      : 'post'}/${post.id}',
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
                  '/feed/${post.article != null
                      ? 'article'
                      : post.poll != null
                      ? 'poll'
                      : 'post'}/${post.id}',
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
    });
  }

  /// Subscribes or unsubscribes the authenticated user from a post.
  ///
  /// Logs engagement and returns immediately.
  Future<void> subscribeToPost(Session session, int postId) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);

      final post = await Post.db.findById(
        session,
        postId,
        transaction: transaction,
      );

      if (post == null) {
        throw ServerSideException(message: 'Post not found');
      }

      final exists = await PostSubscription.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id!) & t.postId.equals(postId),
        transaction: transaction,
      );

      if (exists != null) {
        await PostSubscription.db.deleteWhere(
          session,
          where: (t) => t.userId.equals(user.id!) & t.postId.equals(postId),
          transaction: transaction,
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
          transaction: transaction,
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

  /// Returns paginated bookmarks for the authenticated user with enrichment.
  Future<PostList> getUserPostBookmarks(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      final cacheKey = 'bookmarks:${user.id}:$limit:$page';

      // Try cache first (medium TTL since bookmarks don't change frequently)
      PostList? cachedResult = await session.caches.global.get<PostList>(
        cacheKey,
      );
      if (cachedResult != null) {
        return cachedResult;
      }

      final count = await PostBookmarks.db.count(
        session,
        where: (t) =>
            t.ownerId.equals(user.id!) & t.post.isDeleted.equals(false),
      );

      final bookmarks = await PostBookmarks.db.find(
        session,
        where: (t) =>
            t.ownerId.equals(user.id!) & t.post.isDeleted.equals(false),
        limit: limit,
        offset: (page - 1) * limit,
        orderBy: (t) => t.dateCreated,
        orderDescending: true,
        include: PostBookmarks.include(
          post: Post.include(
            owner: UserRecord.include(userInfo: UserInfo.include()),
            mediaAssets: MediaAsset.includeList(),
            project: Project.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
            ),
            poll: Poll.include(options: PollOption.includeList()),
            article: Article.include(),
            parent: Post.include(
              owner: UserRecord.include(userInfo: UserInfo.include()),
              mediaAssets: MediaAsset.includeList(),
              project: Project.include(
                owner: UserRecord.include(userInfo: UserInfo.include()),
              ),
              poll: Poll.include(options: PollOption.includeList()),
              article: Article.include(),
              parent: Post.include(
                owner: UserRecord.include(userInfo: UserInfo.include()),
                mediaAssets: MediaAsset.includeList(),
                project: Project.include(
                  owner: UserRecord.include(userInfo: UserInfo.include()),
                ),
                poll: Poll.include(options: PollOption.includeList()),
                article: Article.include(),
              ),
            ),
          ),
        ),
      );
      final results = bookmarks.map((e) => e.post!).toList();
      final enriched = await _enrichPosts(session, user, results);

      final postList = PostList(
        count: count,
        limit: limit,
        page: page,
        results: enriched,
        numPages: (count / limit).ceil(),
        canLoadMore: page * limit < count,
      );

      // Cache for 15 minutes since bookmarks are relatively stable
      unawaited(
        session.caches.global.put(
          cacheKey,
          postList,
          lifetime: const Duration(minutes: 15),
        ),
      );

      return postList;
    });
  }

  /// Enriches posts with user-specific state (likes, bookmarks, reposts,
  /// subscriptions, following, and selected poll option).
  @doNotGenerate
  Future<List<PostWithUserState>> _enrichPosts(
    Session session,
    UserRecord user,
    List<Post> posts,
  ) async {
    if (posts.isEmpty) return const <PostWithUserState>[];

    final postIds = posts.map((p) => p.id!).toSet();
    final pollIds = posts
        .where((p) => p.pollId != null)
        .map((p) => p.pollId!)
        .toSet();
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
            selectedPollOptionId: p.pollId != null
                ? selectedOptionByPollId[p.pollId!]
                : null,
          ),
        )
        .toList();
  }

  /// Marks a post as "not interested" for the authenticated user.
  /// Logs an engagement event of type `notInterested`.
  Future<void> markNotInterested(
    Session session,
    int postId,
    String reason,
  ) async {
    return await session.db.transaction((transaction) async {
      final user = await authUser(session);
      final entry = PostNotInterested(
        userId: user.id!,
        postId: postId,
        reason: reason,
      );

      await PostNotInterested.db.insertRow(
        session,
        entry,
        transaction: transaction,
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
    });
  }

  /// Stream of post count updates (likes, reposts, bookmarks, comments,
  /// impressions) for a given post id.
  Stream<PostCounts> postCountsUpdates(Session session, int postId) async* {
    final updateStream = session.messages.createStream<PostCounts>(
      'post_counts_$postId',
    );
    final initial = await Post.db.findById(session, postId);
    if (initial != null) yield _buildPostCounts(initial);
    await for (final counts in updateStream) {
      yield counts;
    }
  }

  /// Stream of poll count updates for a given poll id.
  Stream<PollCounts> pollCountsUpdates(Session session, int pollId) async* {
    final stream = session.messages.createStream<PollCounts>(
      'poll_counts_$pollId',
    );
    final initial = await _loadCounts(session, pollId);
    if (initial != null) yield initial;
    await for (final update in stream) {
      yield update;
    }
  }

  /// Builds `PollCounts` from a `Poll` row.
  PollCounts _buildPollCounts(Poll poll) {
    return PollCounts(
      pollId: poll.id!,
      votesCount: poll.votesCount ?? 0,
      options: poll.options
          ?.map(
            (o) =>
                PollOptionCount(optionId: o.id!, votesCount: o.votesCount ?? 0),
          )
          .toList(),
    );
  }

  /// Loads poll counts for a given poll id, including its options.
  Future<PollCounts?> _loadCounts(
    Session session,
    int pollId, {
    Transaction? transaction,
  }) async {
    final poll = await Poll.db.findById(
      session,
      pollId,
      include: Poll.include(options: PollOption.includeList()),
      transaction: transaction,
    );
    if (poll == null) return null;
    return _buildPollCounts(poll);
  }

  /// Returns the authenticated `UserRecord` or throws if unauthenticated.
  /// Uses layered caching (local → Redis → database) for optimal performance.
  @doNotGenerate
  Future<UserRecord> authUser(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(message: 'You must be logged in');
    }

    final cacheKey = 'user:${authInfo.userId}';

    // Try local cache first (fastest)
    var userRecord = await session.caches.localPrio.get<UserRecord>(cacheKey);
    if (userRecord != null) return userRecord;

    // Try distributed cache (Redis) second
    userRecord = await session.caches.global.get<UserRecord>(cacheKey);
    if (userRecord != null) {
      // Populate local cache for next request
      await session.caches.localPrio.put(
        cacheKey,
        userRecord,
        lifetime: const Duration(minutes: 15),
      );
      return userRecord;
    }

    // Fallback to database
    userRecord = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
      include: UserRecord.include(userInfo: UserInfo.include()),
    );

    if (userRecord == null) {
      throw ServerSideException(message: 'User not found');
    }

    // Cache in both layers
    await Future.wait([
      session.caches.localPrio.put(
        cacheKey,
        userRecord,
        lifetime: const Duration(minutes: 15),
      ),
      session.caches.global.put(
        cacheKey,
        userRecord,
        lifetime: const Duration(hours: 1),
      ),
    ]);

    return userRecord;
  }

  /// Validates that a post exists and is owned by the user.
  /// Returns the post with `Article`/`Poll` relations included.
  @doNotGenerate
  Future<Post> validatePostOwnership(
    Session session,
    int postId,
    UserRecord user,
  ) async {
    final post = await Post.db.findById(
      session,
      postId,
      include: Post.include(
        article: Article.include(),
        poll: Poll.include(options: PollOption.includeList()),
      ),
    );
    if (post == null) {
      throw ServerSideException(message: 'Post not found');
    }
    if (post.ownerId != user.id) {
      throw ServerSideException(message: 'Unauthorised operation');
    }
    return post;
  }

  /// Validates that a comment or reply exists under the given parent post
  /// and is owned by the user.
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
      throw ServerSideException(message: 'Unauthorised operation');
    }
    return comment;
  }

  /// Persists changes to a post and emits real-time count updates.
  /// Also invalidates relevant caches.
  @doNotGenerate
  Future<void> updatePost(
    Session session,
    Post post, {
    Transaction? transaction,
  }) async {
    await Post.db.updateRow(session, post, transaction: transaction);
    session.messages.postMessage(
      'post_counts_${post.id}',
      _buildPostCounts(post),
    );

    // Invalidate caches
    await _invalidatePostCaches(session, post);
  }

  /// Invalidates all caches related to a post.
  @doNotGenerate
  Future<void> _invalidatePostCaches(Session session, Post post) async {
    final futures = <Future<void>>[];

    // Invalidate post cache
    futures.add(session.caches.global.invalidateKey('post:${post.id}'));
    futures.add(session.caches.localPrio.invalidateKey('post:${post.id}'));

    // Invalidate user cache if owner data might have changed
    futures.add(session.caches.global.invalidateKey('user:${post.ownerId}'));
    futures.add(session.caches.localPrio.invalidateKey('user:${post.ownerId}'));

    await Future.wait(futures);
  }

  /// Invalidates bookmarks-related caches for a user.
  @doNotGenerate
  Future<void> _invalidateBookmarksCaches(Session session, int userId) async {
    // Invalidate common bookmark cache keys (pages 1-5, common limits)
    final commonLimits = [10, 20, 50];
    final commonPages = [1, 2, 3, 4, 5];

    final futures = <Future<void>>[];
    for (final limit in commonLimits) {
      for (final page in commonPages) {
        futures.add(
          session.caches.global.invalidateKey('bookmarks:$userId:$limit:$page'),
        );
      }
    }

    await Future.wait(futures);
  }

  /// Persists changes to a poll and emits real-time count updates.
  @doNotGenerate
  Future<void> updatePoll(
    Session session,
    Poll poll, {
    Transaction? transaction,
  }) async {
    await Poll.db.updateRow(session, poll, transaction: transaction);
    final counts = await _loadCounts(
      session,
      poll.id!,
      transaction: transaction,
    );
    if (counts != null) {
      session.messages.postMessage('poll_counts_${poll.id}', counts);
    }
  }

  /// Builds `PostCounts` from a `Post` row.
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

  /// Concatenates a user's full name, including middle name if present.
  @doNotGenerate
  String getFullName(String firstName, String? middleName, String lastName) {
    if (middleName == null || middleName.trim().isEmpty) {
      return '$firstName $lastName';
    }
    return '$firstName $middleName $lastName';
  }

  /// Builds an optional notification body from text, truncating to 150 chars.
  @doNotGenerate
  String? _getNotificationBody(String text) {
    if (text.isEmpty) return null;
    if (text.length > 150) {
      return '${text.substring(0, 150)}...';
    }
    return text;
  }
}
