import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class NotificationEndpoint extends Endpoint {
  @doNotGenerate
  Future<void> sendNotification(
    Session session, {
    required int receiverId,
    required int senderId,
    required String actionType,
    required String targetType,
    required int targetId,
    required String actionRoute,
    String? content,
  }) async {
    final groupKey = '${actionType}_${targetType}_$targetId';

    final existing = await Notification.db.findFirstRow(
      session,
      where: (t) =>
          t.receiverId.equals(receiverId) & t.groupKey.equals(groupKey),
    );

    if (existing != null) {
      if (existing.groupedSenderIds!.contains(senderId)) return;

      final updatedGroupedIds = {
        ...?existing.groupedSenderIds,
        existing.senderId,
        senderId,
      }.toList();

      final updatedNotification = existing.copyWith(
        senderId: senderId,
        groupedSenderIds: updatedGroupedIds,
        createdAt: DateTime.now(),
      );

      await Notification.db.updateRow(
        session,
        updatedNotification,
      );
    } else {
      final notification = Notification(
        receiverId: receiverId,
        senderId: senderId,
        groupedSenderIds: [senderId],
        groupKey: groupKey,
        actionType: actionType,
        targetType: targetType,
        targetId: targetId,
        actionRoute: actionRoute,
        content: content,
        isRead: false,
        createdAt: DateTime.now(),
      );

      await Notification.db.insertRow(
        session,
        notification,
      );
    }
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

    await updateNotification(
      session,
      notification.copyWith(
        isRead: true,
      ),
    );
  }

  Future<void> markAllNotificationsAsRead(Session session) async {
    final user = await authUser(session);

    final unread = await Notification.db.find(
      session,
      where: (t) => t.receiverId.equals(user.id) & t.isRead.equals(false),
    );

    for (final notification in unread) {
      await updateNotification(
        session,
        notification.copyWith(
          isRead: true,
        ),
      );
    }
  }

  Future<void> deleteNotification(Session session, int notificationId) async {
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
  }) async {
    final user = await authUser(session);
    final count = await Notification.db.count(
      session,
      where: (t) => t.receiverId.equals(user.id),
    );
    final notifications = await Notification.db.find(
      session,
      where: (t) => t.receiverId.equals(user.id),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    final List<UserNotification> results = [];

    for (final notif in notifications) {
      final notifParams = await userNotificationParams(
        session,
        notif,
      );
      results.add(
        UserNotification(
          notification: notif,
          mediaThumbnailUrl: notifParams['mediaThumbnailUrl'],
          senderUsernames: notifParams['usernames'],
        ),
      );
    }

    return NotificationList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
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
  Future<void> updateNotification(Session session, Notification n) async {
    // Update the project in the database
    await Notification.db.updateRow(session, n);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'notification_${n.id}',
      n,
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
      throw PostException(
        message: 'Notification not found',
      );
    }
    if (notification.receiverId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
    return notification;
  }

  @doNotGenerate
  Future<Map<String, dynamic>> userNotificationParams(
    Session session,
    Notification notification,
  ) async {
    final senderIds = notification.groupedSenderIds ?? [notification.senderId];

    final senders = await UserRecord.db.find(
      session,
      where: (t) => t.id.inSet(senderIds.toSet()),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    senders.sort((a, b) => b.id!.compareTo(a.id!));

    final usernames = senders
        .map((u) => u.userInfo!.fullName ?? u.userInfo!.userName!)
        .toList();
    final profileImage = senders.first.userInfo?.imageUrl;
    return {
      'usernames': usernames,
      'mediaThumbnailUrl': profileImage,
    };
  }

  Stream<UserNotification> notificationUpdates(
    Session session,
    int notificationId,
  ) async* {
    // Create a message stream for this post
    var updateStream = session.messages
        .createStream<Notification>('notification_$notificationId');

    // Yield the latest post details when the client subscribes
    var notification = await Notification.db.findById(
      session,
      notificationId,
    );
    if (notification != null) {
      final notifParams = await userNotificationParams(
        session,
        notification,
      );

      yield UserNotification(
        notification: notification,
        mediaThumbnailUrl: notifParams['mediaThumbnailUrl'],
        senderUsernames: notifParams['usernames'],
      );
    }

    // Send updates when changes occur
    await for (var notificationUpdate in updateStream) {
      final notifParams = await userNotificationParams(
        session,
        notificationUpdate,
      );
      yield UserNotification(
        notification: notificationUpdate,
        mediaThumbnailUrl: notifParams['mediaThumbnailUrl'],
        senderUsernames: notifParams['usernames'],
      );
    }
  }
}
