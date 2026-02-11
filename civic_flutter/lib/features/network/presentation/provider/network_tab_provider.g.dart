// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_tab_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkVsync)
final networkVsyncProvider = NetworkVsyncProvider._();

final class NetworkVsyncProvider
    extends $FunctionalProvider<TickerProvider, TickerProvider, TickerProvider>
    with $Provider<TickerProvider> {
  NetworkVsyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkVsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkVsyncHash();

  @$internal
  @override
  $ProviderElement<TickerProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TickerProvider create(Ref ref) {
    return networkVsync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TickerProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TickerProvider>(value),
    );
  }
}

String _$networkVsyncHash() => r'52b67dc0242240b30e7cf1939ef9fdfb8fdbab95';

@ProviderFor(NetworkTabController)
final networkTabControllerProvider = NetworkTabControllerProvider._();

final class NetworkTabControllerProvider
    extends $NotifierProvider<NetworkTabController, Raw<TabController>> {
  NetworkTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkTabControllerHash();

  @$internal
  @override
  NetworkTabController create() => NetworkTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<TabController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<TabController>>(value),
    );
  }
}

String _$networkTabControllerHash() =>
    r'dc1a6b92063679b01762a138cf28b664e812928d';

abstract class _$NetworkTabController extends $Notifier<Raw<TabController>> {
  Raw<TabController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Raw<TabController>, Raw<TabController>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Raw<TabController>, Raw<TabController>>,
              Raw<TabController>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(NetworkCurrentPage)
final networkCurrentPageProvider = NetworkCurrentPageProvider._();

final class NetworkCurrentPageProvider
    extends $NotifierProvider<NetworkCurrentPage, int> {
  NetworkCurrentPageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkCurrentPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkCurrentPageHash();

  @$internal
  @override
  NetworkCurrentPage create() => NetworkCurrentPage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$networkCurrentPageHash() =>
    r'549088da327cf4fad21dc6346a1a614765d44e8c';

abstract class _$NetworkCurrentPage extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
