// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impressions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedImpressions)
const feedImpressionsProvider = FeedImpressionsProvider._();

final class FeedImpressionsProvider
    extends $NotifierProvider<FeedImpressions, int> {
  const FeedImpressionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedImpressionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedImpressionsHash();

  @$internal
  @override
  FeedImpressions create() => FeedImpressions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$feedImpressionsHash() => r'e3651a7b21edc6153f8c45bb668deaeb3d86b562';

abstract class _$FeedImpressions extends $Notifier<int> {
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
