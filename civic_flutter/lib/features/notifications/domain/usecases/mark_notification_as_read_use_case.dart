import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:fpdart/fpdart.dart';

class MarkNotificationAsReadUseCase implements UseCase<void, MarkNotificationAsReadParams> {
  MarkNotificationAsReadUseCase({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, void>> call(MarkNotificationAsReadParams params) async {
    final result = await _notificationRepository.markNotificationAsRead(
      id: params.id,
    );
    return result;
  }
}

class MarkNotificationAsReadParams {
  MarkNotificationAsReadParams(
    this.id,
  );
  final int id;
}
