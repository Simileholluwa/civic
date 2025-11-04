import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/domain/repository/notification_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUserNotificationSettingsUseCase
    implements UseCase<UserNotificationSettings, NoParams> {
  GetUserNotificationSettingsUseCase({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, UserNotificationSettings>> call(
    NoParams params,
  ) async {
    return _notificationRepository.getUserNotificationSettings();
  }
}
