// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationTabController)
const notificationTabControllerProvider = NotificationTabControllerProvider._();

final class NotificationTabControllerProvider
    extends $NotifierProvider<NotificationTabController, Raw<TabController>> {
  const NotificationTabControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationTabControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationTabControllerHash();

  @$internal
  @override
  NotificationTabController create() => NotificationTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<TabController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<TabController>>(value),
    );
  }
}

String _$notificationTabControllerHash() =>
    r'2661106d1652c1a34a08699de7a1bf2d99f1e592';

abstract class _$NotificationTabController
    extends $Notifier<Raw<TabController>> {
  Raw<TabController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Raw<TabController>, Raw<TabController>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Raw<TabController>, Raw<TabController>>,
        Raw<TabController>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(tabVsync)
const tabVsyncProvider = TabVsyncProvider._();

final class TabVsyncProvider
    extends $FunctionalProvider<TickerProvider, TickerProvider, TickerProvider>
    with $Provider<TickerProvider> {
  const TabVsyncProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tabVsyncProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tabVsyncHash();

  @$internal
  @override
  $ProviderElement<TickerProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TickerProvider create(Ref ref) {
    return tabVsync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TickerProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TickerProvider>(value),
    );
  }
}

String _$tabVsyncHash() => r'5f5ddee0db5cdc6af6a3cf661b1c19575c2ff538';

@ProviderFor(NotificationPage)
const notificationPageProvider = NotificationPageProvider._();

final class NotificationPageProvider
    extends $NotifierProvider<NotificationPage, int> {
  const NotificationPageProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationPageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationPageHash();

  @$internal
  @override
  NotificationPage create() => NotificationPage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$notificationPageHash() => r'5e2b09988929404a0feeb6294d47883dfd0f2dce';

abstract class _$NotificationPage extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
