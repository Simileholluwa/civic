// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_notifications_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserNotifSettings)
final getUserNotifSettingsProvider = GetUserNotifSettingsProvider._();

final class GetUserNotifSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserNotificationSettings>,
          UserNotificationSettings,
          FutureOr<UserNotificationSettings>
        >
    with
        $FutureModifier<UserNotificationSettings>,
        $FutureProvider<UserNotificationSettings> {
  GetUserNotifSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserNotifSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserNotifSettingsHash();

  @$internal
  @override
  $FutureProviderElement<UserNotificationSettings> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserNotificationSettings> create(Ref ref) {
    return getUserNotifSettings(ref);
  }
}

String _$getUserNotifSettingsHash() =>
    r'66a3297c7fe081086a0de8ed26efd9a869514e3b';
