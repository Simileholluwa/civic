import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:fpdart/fpdart.dart';

class GetUnreadNotificationsUseCase implements UseCase<int, NoParams> {
  GetUnreadNotificationsUseCase({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    final result = await _notificationRepository.getUnreadNotifications();
    return result;
  }
}
