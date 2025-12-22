// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_buttons_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedButtons)
const feedButtonsProvider = FeedButtonsFamily._();

final class FeedButtonsProvider
    extends $NotifierProvider<FeedButtons, FeedWidgetsState> {
  const FeedButtonsProvider._(
      {required FeedButtonsFamily super.from,
      required PostWithUserStateKey? super.argument})
      : super(
          retry: null,
          name: r'feedButtonsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$feedButtonsHash();

  @override
  String toString() {
    return r'feedButtonsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FeedButtons create() => FeedButtons();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedWidgetsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedWidgetsState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FeedButtonsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$feedButtonsHash() => r'2341ecc3cb84f32d0979f70c5d7eaadbf3d303da';

final class FeedButtonsFamily extends $Family
    with
        $ClassFamilyOverride<FeedButtons, FeedWidgetsState, FeedWidgetsState,
            FeedWidgetsState, PostWithUserStateKey?> {
  const FeedButtonsFamily._()
      : super(
          retry: null,
          name: r'feedButtonsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FeedButtonsProvider call(
    PostWithUserStateKey? key,
  ) =>
      FeedButtonsProvider._(argument: key, from: this);

  @override
  String toString() => r'feedButtonsProvider';
}

abstract class _$FeedButtons extends $Notifier<FeedWidgetsState> {
  late final _$args = ref.$arg as PostWithUserStateKey?;
  PostWithUserStateKey? get key => _$args;

  FeedWidgetsState build(
    PostWithUserStateKey? key,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<FeedWidgetsState, FeedWidgetsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FeedWidgetsState, FeedWidgetsState>,
        FeedWidgetsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
