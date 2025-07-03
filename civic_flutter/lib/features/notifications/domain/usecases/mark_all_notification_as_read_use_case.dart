import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:fpdart/fpdart.dart';

class MarkAllNotificationsAsReadUseCase implements UseCase<void, NoParams> {
  MarkAllNotificationsAsReadUseCase({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _notificationRepository.markAllNotificationAsRead();
    return result;
  }
}

