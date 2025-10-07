// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Notif)
const notifProvider = NotifProvider._();

final class NotifProvider extends $NotifierProvider<Notif, void> {
  const NotifProvider._()
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
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$notifHash() => r'8736b17e8f81c75e884636042b39b09160390b48';

abstract class _$Notif extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<void, void>, void, Object?, Object?>;
    element.handleValue(ref, null);
  }
}
