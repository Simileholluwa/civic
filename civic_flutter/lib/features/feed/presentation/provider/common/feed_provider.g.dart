// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Feed)
const feedProvider = FeedFamily._();

final class FeedProvider extends $NotifierProvider<Feed, FeedState> {
  const FeedProvider._(
      {required FeedFamily super.from, required Post? super.argument})
      : super(
          retry: null,
          name: r'feedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$feedHash();

  @override
  String toString() {
    return r'feedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Feed create() => Feed();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FeedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$feedHash() => r'9ddffa5f3934d44f4eaa640615130983da65e35b';

final class FeedFamily extends $Family
    with $ClassFamilyOverride<Feed, FeedState, FeedState, FeedState, Post?> {
  const FeedFamily._()
      : super(
          retry: null,
          name: r'feedProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FeedProvider call(
    Post? post,
  ) =>
      FeedProvider._(argument: post, from: this);

  @override
  String toString() => r'feedProvider';
}

abstract class _$Feed extends $Notifier<FeedState> {
  late final _$args = ref.$arg as Post?;
  Post? get post => _$args;

  FeedState build(
    Post? post,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<FeedState, FeedState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FeedState, FeedState>, FeedState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
