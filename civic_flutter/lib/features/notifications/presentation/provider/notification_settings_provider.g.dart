// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationSettingsNotifier)
const notificationSettingsProvider = NotificationSettingsNotifierFamily._();

final class NotificationSettingsNotifierProvider extends $NotifierProvider<
    NotificationSettingsNotifier, AppNotificationSettings> {
  const NotificationSettingsNotifierProvider._(
      {required NotificationSettingsNotifierFamily super.from,
      required UserNotificationSettings? super.argument})
      : super(
          retry: null,
          name: r'notificationSettingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationSettingsNotifierHash();

  @override
  String toString() {
    return r'notificationSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NotificationSettingsNotifier create() => NotificationSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppNotificationSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppNotificationSettings>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationSettingsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$notificationSettingsNotifierHash() =>
    r'fcaaee93f7b5201addc81d89e597659c843b5d7b';

final class NotificationSettingsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
            NotificationSettingsNotifier,
            AppNotificationSettings,
            AppNotificationSettings,
            AppNotificationSettings,
            UserNotificationSettings?> {
  const NotificationSettingsNotifierFamily._()
      : super(
          retry: null,
          name: r'notificationSettingsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NotificationSettingsNotifierProvider call(
    UserNotificationSettings? settings,
  ) =>
      NotificationSettingsNotifierProvider._(argument: settings, from: this);

  @override
  String toString() => r'notificationSettingsProvider';
}

abstract class _$NotificationSettingsNotifier
    extends $Notifier<AppNotificationSettings> {
  late final _$args = ref.$arg as UserNotificationSettings?;
  UserNotificationSettings? get settings => _$args;

  AppNotificationSettings build(
    UserNotificationSettings? settings,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref =
        this.ref as $Ref<AppNotificationSettings, AppNotificationSettings>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AppNotificationSettings, AppNotificationSettings>,
        AppNotificationSettings,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
