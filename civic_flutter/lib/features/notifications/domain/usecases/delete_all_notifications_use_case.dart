import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:fpdart/fpdart.dart';

class DeleteAllNotificationsUseCase implements UseCase<void, NoParams> {
  DeleteAllNotificationsUseCase({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _notificationRepository.deleteAllNotification();
    return result;
  }
}

