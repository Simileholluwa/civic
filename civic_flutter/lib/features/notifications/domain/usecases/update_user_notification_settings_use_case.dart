import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/domain/repository/notification_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateUserNotificationSettingsUseCase
    implements
        UseCase<UserNotificationSettings,
            UpdateUserNotificationSettingsParams> {
  UpdateUserNotificationSettingsUseCase({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, UserNotificationSettings>> call(
    UpdateUserNotificationSettingsParams params,
  ) async {
    return _notificationRepository.updateUserNotificationSettings(
      notificationsSettings: params.settings,
    );
  }
}

class UpdateUserNotificationSettingsParams {
  UpdateUserNotificationSettingsParams(this.settings);
  final UserNotificationSettings settings;
}
