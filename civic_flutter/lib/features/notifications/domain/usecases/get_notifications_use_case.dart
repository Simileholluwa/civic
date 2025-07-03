import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:fpdart/fpdart.dart';

class GetNotificationsUseCase implements UseCase<NotificationList, GetNotificationsParams> {
  GetNotificationsUseCase({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<Failure, NotificationList>> call(GetNotificationsParams params) async {
    final result = await _notificationRepository.getNotifications(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetNotificationsParams {
  GetNotificationsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
