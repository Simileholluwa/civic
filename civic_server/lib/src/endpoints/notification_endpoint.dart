import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class NotificationEndpoint extends Endpoint {
  @doNotGenerate
  Future<void> sendNotification(
    Session session, {
    required int receiverId,
    required int senderId,
    required String senderName,
    required String actionType,
    required String targetType,
    required int targetId,
    required String actionRoute,
    required String mediaThumbnailUrl,
    String? triggerUser,
    String? content,
  }) async {
    final groupKey = '${actionType}_${targetType}_$targetId';

    final existing = await Notification.db.findFirstRow(
      session,
      where: (t) =>
          t.receiverId.equals(receiverId) & t.groupKey.equals(groupKey),
    );

    if (existing != null) {
      if (existing.groupedSenderNames!.contains(senderName)) return;

      final updatedGroupedNames = {
        ...?existing.groupedSenderNames,
        senderName,
      }.toList();

      final updatedNotification = existing.copyWith(
        senderId: senderId,
        groupedSenderNames: updatedGroupedNames,
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
        groupedSenderNames: [senderName],
        groupKey: groupKey,
        actionType: actionType,
        targetType: targetType,
        mediaThumbnailUrl: mediaThumbnailUrl,
        targetId: targetId,
        actionRoute: actionRoute,
        content: content,
        triggerUser: triggerUser,
        isRead: false,
        createdAt: DateTime.now(),
      );

      final notif = await Notification.db.insertRow(
        session,
        notification,
      );

      await updateNotification(
        session,
        notif,
      );
    }
  }

  @doNotGenerate
  Future<void> notifyProjectSubscribers(
    Session session, {
    required int senderId,
    required String senderName,
    required String actionType,
    required String targetType,
    required int targetId,
    required String actionRoute,
    required String mediaThumbnailUrl,
    required int projectId,
    required String triggerUser,
    String? content,
  }) async {
    final subscribers = await ProjectSubscription.db.find(
      session,
      where: (t) => t.projectId.equals(projectId),
    );

    if (subscribers.isEmpty) return;  

    for (final sub in subscribers) {
      // Don't notify the sender themselves
      if (sub.userId == senderId) continue;

      await sendNotification(
        session,
        receiverId: sub.userId,
        senderId: senderId,
        senderName: senderName,
        actionType: actionType,
        targetType: targetType,
        targetId: targetId,
        actionRoute: actionRoute,
        mediaThumbnailUrl: mediaThumbnailUrl,
        triggerUser: triggerUser,
        content: content,
      );
    }
  }

  @doNotGenerate
  Future<void> notifyPostSubscribers(
    Session session, {
    required int senderId,
    required String senderName,
    required String actionType,
    required String targetType,
    required int targetId,
    required String actionRoute,
    required String mediaThumbnailUrl,
    required int postId,
    required String triggerUser,
    String? content,
  }) async {
    final subscribers = await PostSubscription.db.find(
      session,
      where: (t) => t.postId.equals(postId),
    );

    if (subscribers.isEmpty) return;  

    for (final sub in subscribers) {
      // Don't notify the sender themselves
      if (sub.userId == senderId) continue;

      await sendNotification(
        session,
        receiverId: sub.userId,
        senderId: senderId,
        senderName: senderName,
        actionType: actionType,
        targetType: targetType,
        targetId: targetId,
        actionRoute: actionRoute,
        mediaThumbnailUrl: mediaThumbnailUrl,
        triggerUser: triggerUser,
        content: content,
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
    String targetType = '',
    bool isRead = true,
  }) async {
    final user = await authUser(session);
    whereClause(t) {
      var clause = t.receiverId.equals(user.id);
      if (isRead == true) {
        clause = clause & t.targetType.ilike('%$targetType%');
      }
      if (isRead == false) {
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

  Stream<Notification> notificationUpdates(
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
      yield notification;
    }

    // Send updates when changes occur
    await for (var notificationUpdate in updateStream) {
      yield notificationUpdate;
    }
  }
}
