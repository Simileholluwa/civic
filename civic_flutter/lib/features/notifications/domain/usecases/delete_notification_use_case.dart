import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:fpdart/fpdart.dart';

class DeleteNotificationUseCase implements UseCase<void, DeleteNotificationParams> {
  DeleteNotificationUseCase({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, void>> call(DeleteNotificationParams params) async {
    final result = await _notificationRepository.deleteNotification(
      id: params.id,
    );
    return result;
  }
}

class DeleteNotificationParams {
  DeleteNotificationParams(
    this.id,
  );
  final int id;
}
