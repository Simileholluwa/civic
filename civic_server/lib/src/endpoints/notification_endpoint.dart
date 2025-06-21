import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class NotificationEndpoint extends Endpoint {
  Future<void> sendNotification(
    Session session,
    NotificationRequest request,
  ) async {
    final receiver = await UserRecord.db.findById(session, request.receiverId);
    if (receiver == null) throw Exception('Receiver not found');

    final sender = request.senderId != null
        ? await UserRecord.db.findById(
            session,
            request.senderId!,
            include: UserRecord.include(
              userInfo: UserInfo.include(),
            ),
          )
        : null;

    final now = DateTime.now();

    final baseNotification = Notification(
      receiverId: receiver.id!,
      senderId: sender?.id,
      type: request.type,
      title: request.title,
      body: request.body,
      postId: request.postId,
      projectId: request.projectId,
      pollId: request.pollId,
      actionRoute: request.actionRoute,
      groupKey: request.groupKey,
      groupCount: 1,
      latestSenderName:
          sender?.userInfo?.fullName ?? sender?.userInfo?.userName ?? 'Someone',
      isRead: false,
      isSeen: false,
      deliveryStatus: NotificationDeliveryStatus.pending,
      createdAt: now,
      lastUpdatedAt: now,
    );

    // Grouping logic
    if (request.groupKey != null) {
      final existing = await Notification.db.findFirstRow(
        session,
        where: (t) =>
            t.receiverId.equals(receiver.id!) &
            t.groupKey.equals(request.groupKey!),
      );

      // Define time window for grouping (e.g., 5 minutes)
      const groupWindow = Duration(minutes: 5);

      if (existing != null &&
          now
                  .difference(existing.lastUpdatedAt ?? existing.createdAt)
                  .inMinutes <=
              groupWindow.inMinutes) {
        final newCount = (existing.groupCount ?? 1) + 1;

        final updated = existing.copyWith(
          groupCount: newCount,
          title: _generateGroupedTitle(
            senderName: sender?.userInfo?.fullName ??
                sender?.userInfo?.userName ??
                'Someone',
            baseTitle: request.title,
            count: newCount,
          ),
          body: request.body,
          latestSenderName: sender?.userInfo?.fullName ??
              sender?.userInfo?.userName ??
              'Someone',
          lastUpdatedAt: now,
          isSeen: false,
        );

        await Notification.db.updateRow(session, updated);
        session.messages.postMessage('user-${receiver.id}', updated);
        return;
      }
    }

    final inserted = await Notification.db.insertRow(session, baseNotification);
    session.messages.postMessage('user-${receiver.id}', inserted);
  }

  String _generateGroupedTitle({
    required String senderName,
    required String baseTitle,
    required int count,
  }) {
    if (count <= 1) return '$senderName $baseTitle';
    if (count == 2) return '$senderName and 1 other $baseTitle';
    return '$senderName and ${count - 1} others $baseTitle';
  }
}
