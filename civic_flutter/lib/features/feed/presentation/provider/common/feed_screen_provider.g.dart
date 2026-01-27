// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_screen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(feedVsync)
const feedVsyncProvider = FeedVsyncProvider._();

final class FeedVsyncProvider
    extends $FunctionalProvider<TickerProvider, TickerProvider, TickerProvider>
    with $Provider<TickerProvider> {
  const FeedVsyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedVsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedVsyncHash();

  @$internal
  @override
  $ProviderElement<TickerProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TickerProvider create(Ref ref) {
    return feedVsync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TickerProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TickerProvider>(value),
    );
  }
}

String _$feedVsyncHash() => r'44ce38303dc4f53d025de1dac046e269c8fcde60';

@ProviderFor(feedFilterVsync)
const feedFilterVsyncProvider = FeedFilterVsyncProvider._();

final class FeedFilterVsyncProvider
    extends $FunctionalProvider<TickerProvider, TickerProvider, TickerProvider>
    with $Provider<TickerProvider> {
  const FeedFilterVsyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedFilterVsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedFilterVsyncHash();

  @$internal
  @override
  $ProviderElement<TickerProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TickerProvider create(Ref ref) {
    return feedFilterVsync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TickerProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TickerProvider>(value),
    );
  }
}

String _$feedFilterVsyncHash() => r'03738f6fe4b1d20000391334f2b68fee877ed5e2';

@ProviderFor(FeedScreenTabController)
const feedScreenTabControllerProvider = FeedScreenTabControllerProvider._();

final class FeedScreenTabControllerProvider
    extends $NotifierProvider<FeedScreenTabController, Raw<TabController>> {
  const FeedScreenTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedScreenTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedScreenTabControllerHash();

  @$internal
  @override
  FeedScreenTabController create() => FeedScreenTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<TabController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<TabController>>(value),
    );
  }
}

String _$feedScreenTabControllerHash() =>
    r'e034e0f48b0d3f716dfe17b6093ad55300932c5a';

abstract class _$FeedScreenTabController extends $Notifier<Raw<TabController>> {
  Raw<TabController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Raw<TabController>, Raw<TabController>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Raw<TabController>, Raw<TabController>>,
              Raw<TabController>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FeedCurrentPage)
const feedCurrentPageProvider = FeedCurrentPageProvider._();

final class FeedCurrentPageProvider
    extends $NotifierProvider<FeedCurrentPage, int> {
  const FeedCurrentPageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedCurrentPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedCurrentPageHash();

  @$internal
  @override
  FeedCurrentPage create() => FeedCurrentPage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$feedCurrentPageHash() => r'a345ceafc67a35e8fdd600cf5cf026f51eb25c2e';

abstract class _$FeedCurrentPage extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
