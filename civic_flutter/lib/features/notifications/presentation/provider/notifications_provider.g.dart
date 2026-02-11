// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Notif)
final notifProvider = NotifProvider._();

final class NotifProvider
    extends $NotifierProvider<Notif, NotificationCardState> {
  NotifProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notifProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notifHash();

  @$internal
  @override
  Notif create() => Notif();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationCardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationCardState>(value),
    );
  }
}

String _$notifHash() => r'1466bd4880210b1321c3ae930f4b497e6451e8db';

abstract class _$Notif extends $Notifier<NotificationCardState> {
  NotificationCardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NotificationCardState, NotificationCardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NotificationCardState, NotificationCardState>,
              NotificationCardState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
