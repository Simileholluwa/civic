import 'dart:convert';
import 'dart:io';

import 'package:civic_server/src/generated/protocol.dart';
import 'package:dio/dio.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';
import 'package:googleapis_auth/auth_io.dart' as google_auth;

class NotificationEndpoint extends Endpoint {
  static google_auth.AutoRefreshingAuthClient? _fcmAuthClient;
  static Dio? _dio;

  @doNotGenerate
  Future<Dio> _getDioClient(Session session) async {
    // If we already created them, return the cached dio instance
    if (_dio != null && _fcmAuthClient != null) {
      return _dio!;
    }

    // 1. Load service account JSON
    final serviceAccountFile = File(
      'config/firebase_service_account_key.json',
    );
    if (!await serviceAccountFile.exists()) {
      _safeLog(
        session,
        'Service account file not found.',
        level: LogLevel.error,
      );
      throw Exception(
        'FCM Service account file not found.',
      );
    }

    final serviceAccountJson = await serviceAccountFile.readAsString();
    final credentials = google_auth.ServiceAccountCredentials.fromJson(
      serviceAccountJson,
    );

    // 2. Define the FCM scope
    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    // 3. Get an authenticated, auto-refreshing client
    _fcmAuthClient = await google_auth.clientViaServiceAccount(
      credentials,
      scopes,
    );

    // 4. Create a new Dio instance
    _dio = Dio();

    // 5. Add the auth interceptor
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Get the latest, auto-refreshed access token
          final accessToken = _fcmAuthClient!.credentials.accessToken;

          // Add it to the header
          options.headers['Authorization'] = 'Bearer ${accessToken.data}';
          return handler.next(options);
        },
      ),
    );

    return _dio!;
  }

  @doNotGenerate
  void _safeLog(Session session, String message,
      {LogLevel level = LogLevel.info}) {
    try {
      session.log(message, level: level);
    } catch (_) {}
  }

  @doNotGenerate
  Future<void> sendNotification(
    Session session, {
    required int receiverId,
    required int senderId,
    required String senderName,
    required String? senderAvatarUrl,
    required NotificationActionType actionType,
    required NotificationTargetType targetType,
    required int targetId,
    required String actionRoute,
    required String? body,
    int? postId,
  }) async {
    final groupKey = '${actionType.name}_${targetType.name}_$targetId';

    final existing = await Notification.db.findFirstRow(
      session,
      where: (t) =>
          t.receiverId.equals(
            receiverId,
          ) &
          t.groupKey.equals(
            groupKey,
          ),
    );

    if (existing != null) {
      if (existing.groupedSenderNames!.contains(
        senderName,
      )) {
        return;
      }

      final updatedGroupedNames = {
        ...?existing.groupedSenderNames,
        senderName,
      }.toList();

      final title = _generateNotificationTitle(
        usernames: updatedGroupedNames,
        actionType: actionType,
        targetType: targetType,
      );

      final updatedNotification = existing.copyWith(
        senderId: senderId,
        senderAvatarUrl: senderAvatarUrl,
        groupedSenderNames: updatedGroupedNames,
        createdAt: DateTime.now(),
        isRead: false,
        title: title,
      );
      // Check whether we should create (persist/send) this notification at all
      final recvSettings = await _getSettings(session, receiverId) ??
          UserNotificationSettings(userId: receiverId);
      if (!_shouldCreateNotification(actionType, recvSettings)) {
        _safeLog(
          session,
          'Skipping notification for user $receiverId — both in-app and push disabled for ${actionType.name}',
          level: LogLevel.info,
        );
        return;
      }

      await Notification.db.updateRow(
        session,
        updatedNotification,
      );

      // Stream in-app notification (helper will respect user settings)
      await _sendInAppNotification(
        session,
        updatedNotification,
        settings: recvSettings,
      );

      _sendPushNotification(
        session,
        updatedNotification,
        settings: recvSettings,
      );
    } else {
      final title = _generateNotificationTitle(
        usernames: [senderName],
        actionType: actionType,
        targetType: targetType,
      );

      final notification = Notification(
        receiverId: receiverId,
        senderId: senderId,
        senderName: senderName,
        title: title,
        senderAvatarUrl: senderAvatarUrl,
        groupedSenderNames: [senderName],
        groupKey: groupKey,
        actionType: actionType,
        targetType: targetType,
        targetId: targetId,
        actionRoute: actionRoute,
        isRead: false,
        body: body,
        postId: postId,
        createdAt: DateTime.now(),
      );

      // Check whether we should create/send this notification at all
      final recvSettings = await _getSettings(session, receiverId) ??
          UserNotificationSettings(userId: receiverId);
      if (!_shouldCreateNotification(actionType, recvSettings)) {
        _safeLog(
          session,
          'Skipping notification for user $receiverId — both in-app and push disabled for ${actionType.name}',
          level: LogLevel.info,
        );
        return;
      }

      await Notification.db.insertRow(
        session,
        notification,
      );

      // Stream in-app notification (helper will respect user settings)
      await _sendInAppNotification(
        session,
        notification,
        settings: recvSettings,
      );

      _sendPushNotification(
        session,
        notification,
        settings: recvSettings,
      );
    }
  }

  @doNotGenerate
  Future<void> notifyProjectSubscribers(
    Session session, {
    required int senderId,
    required String senderName,
    required NotificationActionType actionType,
    required NotificationTargetType targetType,
    required int targetId,
    required String actionRoute,
    required String senderAvatarUrl,
    required int projectId,
    required String? body,
  }) async {
    final subscribers = await ProjectSubscription.db.find(
      session,
      where: (t) => t.projectId.equals(projectId),
    );

    if (subscribers.isEmpty) return;

    final subscriberIds =
        subscribers.map((s) => s.userId).where((id) => id != senderId).toSet();

    if (subscriberIds.isEmpty) return;

    final settingsMap = await _getNotificationSettings(session, subscriberIds);

    final groupKey = '${actionType.name}_${targetType.name}_$targetId';

    // 1. Find all existing notifications for this groupKey and these users
    final existingNotifications = await Notification.db.find(
      session,
      where: (t) =>
          t.groupKey.equals(
            groupKey,
          ) &
          t.receiverId.inSet(
            subscriberIds,
          ),
    );

    // Map them by receiverId for easy lookup
    final existingMap = {for (var n in existingNotifications) n.receiverId: n};

    final notificationsToUpdate = <Notification>[];
    final notificationsToInsert = <Notification>[];
    final notificationsToStream = <Notification>[];

    for (final receiverId in subscriberIds) {
      final existing = existingMap[receiverId];

      if (existing != null) {
        // This user already has a notification for this group, UPDATE it.
        if (existing.groupedSenderNames!.contains(senderName)) {
          continue;
        }

        final updatedGroupedNames = {
          ...?existing.groupedSenderNames,
          senderName,
        }.toList();

        final title = _generateNotificationTitle(
          usernames: updatedGroupedNames,
          actionType: actionType,
          targetType: targetType,
        );

        final updatedNotification = existing.copyWith(
          senderId: senderId,
          groupedSenderNames: updatedGroupedNames,
          isRead: false,
          createdAt: DateTime.now(),
          title: title,
        );
        // Skip creating/updating notifications if the user has disabled both
        // in-app and push notifications for this action type.
        final recvSettings = settingsMap[receiverId] ??
            UserNotificationSettings(userId: receiverId);
        if (!_shouldCreateNotification(actionType, recvSettings)) {
          _safeLog(
            session,
            'Skipping notification for user $receiverId — both in-app and push disabled for ${actionType.name}',
            level: LogLevel.info,
          );
          continue;
        }

        notificationsToUpdate.add(updatedNotification);
        notificationsToStream.add(updatedNotification);
      } else {
        final title = _generateNotificationTitle(
          usernames: [senderName],
          actionType: actionType,
          targetType: targetType,
        );

        final newNotification = Notification(
          receiverId: receiverId,
          senderId: senderId,
          groupedSenderNames: [senderName],
          groupKey: groupKey,
          actionType: actionType,
          targetType: targetType,
          senderAvatarUrl: senderAvatarUrl,
          targetId: targetId,
          actionRoute: actionRoute,
          title: title,
          isRead: false,
          body: body,
          createdAt: DateTime.now(),
        );
        // Skip creating notifications if user disabled both in-app and push
        final recvSettings = settingsMap[receiverId] ??
            UserNotificationSettings(userId: receiverId);
        if (!_shouldCreateNotification(actionType, recvSettings)) {
          _safeLog(
            session,
            'Skipping notification for user $receiverId — both in-app and push disabled for ${actionType.name}',
            level: LogLevel.info,
          );
          continue;
        }

        notificationsToInsert.add(newNotification);
        notificationsToStream.add(newNotification);
      }
    }

    // 2. Perform bulk operations
    if (notificationsToUpdate.isNotEmpty) {
      await Notification.db.update(session, notificationsToUpdate);
    }
    if (notificationsToInsert.isNotEmpty) {
      await Notification.db.insert(session, notificationsToInsert);
    }

    // 3. Send all real-time stream messages (after DB is updated)
    for (final n in notificationsToStream) {
      // Helper will respect user settings before streaming (pass pre-fetched settings)
      await _sendInAppNotification(
        session,
        n,
        settings: settingsMap[n.receiverId],
      );

      await _sendPushNotification(
        session,
        n,
        settings: settingsMap[n.receiverId],
      );
    }
  }

  @doNotGenerate
  Future<void> notifyPostSubscribers(
    Session session, {
    required int senderId,
    required String senderName,
    required NotificationActionType actionType,
    required NotificationTargetType targetType,
    required int targetId,
    required String actionRoute,
    required String senderAvatarUrl,
    required int postId,
    required String? body,
  }) async {
    final subscribers = await PostSubscription.db.find(
      session,
      where: (t) => t.postId.equals(postId),
    );

    if (subscribers.isEmpty) return;

    final subscriberIds =
        subscribers.map((s) => s.userId).where((id) => id != senderId).toSet();

    if (subscriberIds.isEmpty) return;

    final settingsMap = await _getNotificationSettings(session, subscriberIds);

    final groupKey = '${actionType.name}_${targetType.name}_$targetId';

    // 1. Find all existing notifications for this groupKey and these users
    final existingNotifications = await Notification.db.find(
      session,
      where: (t) =>
          t.groupKey.equals(
            groupKey,
          ) &
          t.receiverId.inSet(
            subscriberIds,
          ),
    );

    // Map them by receiverId for easy lookup
    final existingMap = {for (var n in existingNotifications) n.receiverId: n};

    final notificationsToUpdate = <Notification>[];
    final notificationsToInsert = <Notification>[];
    final notificationsToStream = <Notification>[];

    for (final receiverId in subscriberIds) {
      final existing = existingMap[receiverId];

      if (existing != null) {
        // This user already has a notification for this group, UPDATE it.
        if (existing.groupedSenderNames!.contains(senderName)) {
          continue; // Already notified by this sender
        }

        final updatedGroupedNames = {
          ...?existing.groupedSenderNames,
          senderName,
        }.toList();

        final title = _generateNotificationTitle(
          usernames: [senderName],
          actionType: actionType,
          targetType: targetType,
        );

        final updatedNotification = existing.copyWith(
          senderId: senderId,
          groupedSenderNames: updatedGroupedNames,
          isRead: false,
          createdAt: DateTime.now(),
          title: title,
        );
        // Skip creating/updating notifications if the user has disabled both
        // in-app and push notifications for this action type.
        final recvSettings = settingsMap[receiverId] ??
            UserNotificationSettings(userId: receiverId);
        if (!_shouldCreateNotification(actionType, recvSettings)) {
          continue;
        }

        notificationsToUpdate.add(updatedNotification);
        notificationsToStream.add(updatedNotification);
      } else {
        final title = _generateNotificationTitle(
          usernames: [senderName],
          actionType: actionType,
          targetType: targetType,
        );

        final newNotification = Notification(
          receiverId: receiverId,
          senderId: senderId,
          groupedSenderNames: [senderName],
          groupKey: groupKey,
          actionType: actionType,
          targetType: targetType,
          senderAvatarUrl: senderAvatarUrl,
          targetId: targetId,
          actionRoute: actionRoute,
          body: body,
          title: title,
          isRead: false,
          createdAt: DateTime.now(),
        );
        // Skip creating notifications if user disabled both in-app and push
        final recvSettings = settingsMap[receiverId] ??
            UserNotificationSettings(userId: receiverId);
        if (!_shouldCreateNotification(actionType, recvSettings)) {
          continue;
        }

        notificationsToInsert.add(newNotification);
        notificationsToStream.add(newNotification);
      }
    }

    // 2. Perform bulk operations
    if (notificationsToUpdate.isNotEmpty) {
      await Notification.db.update(
        session,
        notificationsToUpdate,
      );
    }
    if (notificationsToInsert.isNotEmpty) {
      await Notification.db.insert(
        session,
        notificationsToInsert,
      );
    }

    // 3. Send all real-time stream messages (after DB is updated)
    for (final n in notificationsToStream) {
      // Helper will respect user settings before streaming
      await _sendInAppNotification(
        session,
        n,
        settings: settingsMap[n.receiverId],
      );

      await _sendPushNotification(
        session,
        n,
        settings: settingsMap[n.receiverId],
      );
    }
  }

  Future<void> markAllNotificationsAsRead(Session session) async {
    final user = await authUser(session);

    final unread = await Notification.db.find(
      session,
      where: (t) =>
          t.receiverId.equals(
            user.id,
          ) &
          t.isRead.equals(
            false,
          ),
    );

    if (unread.isEmpty) return;

    // Create a list of updated objects
    final updatedNotifications = unread
        .map(
          (notification) => notification.copyWith(
            isRead: true,
          ),
        )
        .toList();

    // Call a single bulk update
    await Notification.db.update(
      session,
      updatedNotifications,
    );
  }

  Future<void> markNotificationAsRead(
    Session session,
    int notificationId,
  ) async {
    final user = await authUser(session);

    final notification = await validateNotificationOwnership(
      session,
      notificationId,
      user,
    );

    await Notification.db.updateRow(
      session,
      notification.copyWith(
        isRead: true,
      ),
    );
  }

  Future<void> deleteNotification(
    Session session,
    int notificationId,
  ) async {
    final user = await authUser(session);

    final notification = await validateNotificationOwnership(
      session,
      notificationId,
      user,
    );

    await Notification.db.deleteRow(
      session,
      notification,
    );
  }

  Future<void> deleteAllNotifications(Session session) async {
    final user = await authUser(session);

    await Notification.db.deleteWhere(
      session,
      where: (t) => t.receiverId.equals(user.id),
    );
  }

  Future<int> getUnreadNotificationCount(Session session) async {
    final user = await authUser(session);

    return await Notification.db.count(
      session,
      where: (t) => t.receiverId.equals(user.id) & t.isRead.equals(false),
    );
  }

  Future<NotificationList> getNotifications(
    Session session, {
    int limit = 50,
    int page = 1,
    NotificationTargetType? targetType,
    bool? isRead,
  }) async {
    final user = await authUser(session);
    whereClause(NotificationTable t) {
      var clause = t.receiverId.equals(
        user.id,
      );

      if (targetType != null) {
        clause = clause & t.targetType.equals(targetType);
      }

      if (isRead == null) return clause;

      if (isRead == true) {
        clause = clause & t.isRead.equals(true);
      } else if (isRead == false) {
        clause = clause & t.isRead.equals(false);
      }
      return clause;
    }

    final count = await Notification.db.count(
      session,
      where: (t) => whereClause(t),
    );

    final results = await Notification.db.find(
      session,
      where: (t) => whereClause(t),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      include: Notification.include(
        post: Post.include(
          article: Article.include(),
          poll: Poll.include(
            options: PollOption.includeList(
              orderBy: (p0) => p0.id,
              orderDescending: false,
            ),
          ),
        ),
        project: Project.include(),
      ),
    );

    return NotificationList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<UserNotificationSettings> getNotificationSettings(
    Session session,
  ) async {
    final user = await authUser(session);

    var settings = await UserNotificationSettings.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(user.id),
    );

    if (settings == null) {
      settings = UserNotificationSettings(
        userId: user.id!,
      );
      await UserNotificationSettings.db.insertRow(
        session,
        settings,
      );
    }

    return settings;
  }

  Future<UserNotificationSettings> updateNotificationSettings(
    Session session,
    UserNotificationSettings settings,
  ) async {
    final user = await authUser(session);

    if (settings.userId != user.id) {
      throw ServerSideException(
        message:
            'Unauthorized operation. You can only update your own settings.',
      );
    }

    final savedSetting = await UserNotificationSettings.db.findFirstRow(
      session,
      where: (s) => s.userId.equals(user.id),
    );

    final updatedSettings = await UserNotificationSettings.db.updateRow(
      session,
      settings.copyWith(
        id: savedSetting!.id!,
      ),
    );

    return updatedSettings;
  }

  @doNotGenerate
  Future<UserNotificationSettings?> _getSettings(
    Session session,
    int userId,
  ) async {
    var settings = await UserNotificationSettings.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    settings ??= UserNotificationSettings(userId: userId);
    return settings;
  }

  @doNotGenerate
  bool _shouldSendPushNotification(
    NotificationActionType actionType,
    UserNotificationSettings settings,
  ) {
    if (settings.pauseAllPush) return false;

    switch (actionType) {
      case NotificationActionType.comment:
        return settings.pushComments;
      case NotificationActionType.like:
        return settings.pushLikes;
      case NotificationActionType.reply:
        return settings.pushComments; // Assuming replies are a form of comment
      case NotificationActionType.follow:
        return settings.pushNewFollowers;
      case NotificationActionType.mention:
        return settings.pushMentions;
      case NotificationActionType.tag:
        return settings.pushTags;
      case NotificationActionType.vet:
        return settings.pushNewVettings;
      case NotificationActionType.review:
        return settings.pushNewReviews;
      case NotificationActionType.quote:
        return settings.pushRepostsAndQuotes;
      case NotificationActionType.react:
        return settings.pushReactions;
      case NotificationActionType.vote:
        return true;
      case NotificationActionType.system:
        return settings.pushPlatformUpdates;
    }
  }

  @doNotGenerate
  bool _shouldSendInAppNotification(
    NotificationActionType actionType,
    UserNotificationSettings settings,
  ) {
    // If the user has effectively disabled all in-app notifications by
    // disabling the corresponding allow flag for the action type, we
    // should not stream real-time notifications to their client.
    switch (actionType) {
      case NotificationActionType.comment:
      case NotificationActionType.reply:
        return settings.allowComments;
      case NotificationActionType.like:
        return settings.allowLikes;
      case NotificationActionType.follow:
        return settings.allowNewFollowers;
      case NotificationActionType.mention:
        return settings.allowMentions;
      case NotificationActionType.tag:
        return settings.allowTags;
      case NotificationActionType.vet:
        return settings.allowNewVettings;
      case NotificationActionType.review:
        return settings.allowNewReviews;
      case NotificationActionType.quote:
        return settings.allowRepostsAndQuotes;
      case NotificationActionType.react:
        return settings.allowReactions;
      case NotificationActionType.vote:
        return true;
      case NotificationActionType.system:
        return settings.allowPlatformUpdates;
    }
  }

  @doNotGenerate
  bool _shouldCreateNotification(
    NotificationActionType actionType,
    UserNotificationSettings settings,
  ) {
    // A notification should be created if either the user allows in-app
    // notifications for this action type, or they allow push notifications
    // for it (and haven't paused all push notifications).
    return _shouldSendInAppNotification(actionType, settings) ||
        _shouldSendPushNotification(actionType, settings);
  }

  @doNotGenerate
  Future<void> _sendPushNotification(
    Session session,
    Notification notification, {
    UserNotificationSettings? settings,
  }) async {
    // Use provided settings when available to avoid extra DB reads.
    final effectiveSettings =
        settings ?? await _getSettings(session, notification.receiverId);
    if (effectiveSettings == null) return;

    if (!_shouldSendPushNotification(
        notification.actionType, effectiveSettings)) {
      return;
    }

    // 1. Find all tokens for the receiver
    final tokens = await UserDevice.db.find(
      session,
      where: (t) => t.userInfoId.equals(notification.receiverId),
    );
    if (tokens.isEmpty) return;

    // 2. Get pre-configured Dio instance (may throw)
    Dio? dio;
    try {
      dio = await _getDioClient(session);
    } catch (e, st) {
      _safeLog(session, 'Failed to obtain FCM client: $e\n$st',
          level: LogLevel.error);
      return;
    }

    // We asserted dio is not null above (we returned on failure), create a
    // non-null local reference to satisfy the analyzer and avoid repeated
    // `!` usages.
    final client = dio;

    final url = Uri.parse(
      'https://fcm.googleapis.com/v1/projects/civic-flutter/messages:send',
    );

    // 3. Get title and strip <b> tags
    final title = notification.title.replaceAll(RegExp(r'<b>|</b>'), '');

    // 4. Send messages in bounded concurrent batches to avoid large spikes
    //    of simultaneous outbound connections. We create small batches of
    //    requests (maxConcurrency) and await each batch before continuing.
    const int maxConcurrency = 8; // adjust if needed
    for (var i = 0; i < tokens.length; i += maxConcurrency) {
      final end = (i + maxConcurrency) < tokens.length
          ? (i + maxConcurrency)
          : tokens.length;
      final batch = tokens.sublist(i, end);

      final futures = batch.map((device) async {
        final fcmPayload = {
          'message': {
            'token': device.token,
            'notification': {
              'title': title,
              if (notification.body != null) 'body': notification.body,
            },
            'data': {
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'route': notification.actionRoute,
              'targetId': notification.targetId.toString(),
            },
          },
        };

        try {
          // The interceptor will add the 'Authorization' header automatically.
          await client.post(
            url.toString(),
            data: jsonEncode(fcmPayload),
          );
        } catch (e) {
          if (e is DioException) {
            _safeLog(
              session,
              'Failed to send FCM to token ${device.token} (Dio): ${e.response?.data}',
              level: LogLevel.error,
            );
          } else {
            _safeLog(
              session,
              'Failed to send FCM to token ${device.token}: $e',
              level: LogLevel.error,
            );
          }
        }
      }).toList();

      // Await the current batch before starting the next one.
      await Future.wait(futures);
    }
  }

  @doNotGenerate
  Future<void> _sendInAppNotification(
    Session session,
    Notification notification, {
    UserNotificationSettings? settings,
  }) async {
    // Use provided settings when available to avoid extra DB reads.
    final effectiveSettings = settings ??
        await _getSettings(session, notification.receiverId) ??
        UserNotificationSettings(userId: notification.receiverId);

    if (!_shouldSendInAppNotification(
        notification.actionType, effectiveSettings)) {
      return;
    }

    try {
      await session.messages.postMessage(
        'new_notification_${notification.receiverId}',
        notification,
      );
    } catch (e, st) {
      _safeLog(
        session,
        'Failed to post in-app notification for user ${notification.receiverId}: $e\n$st',
        level: LogLevel.error,
      );
    }
  }

  @doNotGenerate
  Future<Map<int, UserNotificationSettings>> _getNotificationSettings(
    Session session,
    Set<int> userIds,
  ) async {
    if (userIds.isEmpty) return {};

    final settings = await UserNotificationSettings.db.find(
      session,
      where: (t) => t.userId.inSet(userIds),
    );

    final settingsMap = {for (var s in settings) s.userId: s};

    // Ensure every user has a settings object, creating a default one if not found
    for (final userId in userIds) {
      if (!settingsMap.containsKey(userId)) {
        settingsMap[userId] = UserNotificationSettings(userId: userId);
      }
    }

    return settingsMap;
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
      throw ServerSideException(
        message: 'User not found',
      );
    }

    return user;
  }

  Stream<Notification> newNotificationUpdates(
    Session session,
    int userId,
  ) async* {
    yield* session.messages.createStream<Notification>(
      'new_notification_$userId',
    );
  }

  @doNotGenerate
  Future<Notification> validateNotificationOwnership(
    Session session,
    int notificationId,
    UserRecord user,
  ) async {
    final notification = await Notification.db.findById(
      session,
      notificationId,
    );
    if (notification == null) {
      throw ServerSideException(
        message: 'Notification not found',
      );
    }
    if (notification.receiverId != user.userInfoId) {
      throw ServerSideException(
        message: 'Unauthorised operation',
      );
    }
    return notification;
  }

  @doNotGenerate
  String _generateNotificationTitle({
    required List<String> usernames,
    required NotificationActionType actionType,
    required NotificationTargetType targetType,
  }) {
    final count = usernames.length;
    if (count == 0) return 'New notification';

    String userText;
    if (count == 1) {
      userText = '<b>${usernames.first}</b>';
    } else if (count == 2) {
      userText = '<b>${usernames[0]}</b> and <b>${usernames[1]}</b>';
    } else {
      final others = count - 2;
      userText =
          '<b>${usernames[0]}</b>, <b>${usernames[1]}</b> and $others other${others > 1 ? 's' : ''}';
    }

    final actionText = _getActionText(actionType);
    final targetText = targetType.name;

    if (actionType == NotificationActionType.follow) {
      return '$userText $actionText you';
    }

    return '$userText $actionText your $targetText';
  }

  @doNotGenerate
  String _getActionText(NotificationActionType type) {
    switch (type) {
      case NotificationActionType.like:
        return 'liked';
      case NotificationActionType.comment:
        return 'commented on';
      case NotificationActionType.follow:
        return 'followed';
      case NotificationActionType.react:
        return 'reacted to';
      case NotificationActionType.tag:
        return 'tagged you in a';
      case NotificationActionType.mention:
        return 'mentioned you in a';
      case NotificationActionType.quote:
        return 'quoted';
      case NotificationActionType.review:
        return 'reviewed';
      case NotificationActionType.vet:
        return 'vetted';
      case NotificationActionType.vote:
        return 'voted in';
      case NotificationActionType.reply:
        return 'replied to';
      case NotificationActionType.system:
        return 'sent you a';
    }
  }
}
