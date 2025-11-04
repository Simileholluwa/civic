import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_user_notifications_settings_provider.g.dart';

@riverpod
Future<UserNotificationSettings> getUserNotifSettings(
  Ref ref,
) async {
  final useCase = ref.read(
    getUserNotificationSettingsProvider,
  );
  final result = await useCase(
    NoParams(),
  );
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
