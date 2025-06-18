// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_buttons_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedButtonsHash() => r'd624b90a26e01b9307770d4a4a2747ba578dd085';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FeedButtons extends BuildlessNotifier<FeedWidgetsState> {
  late final Post? post;

  FeedWidgetsState build(
    Post? post,
  );
}

/// See also [FeedButtons].
@ProviderFor(FeedButtons)
const feedButtonsProvider = FeedButtonsFamily();

/// See also [FeedButtons].
class FeedButtonsFamily extends Family<FeedWidgetsState> {
  /// See also [FeedButtons].
  const FeedButtonsFamily();

  /// See also [FeedButtons].
  FeedButtonsProvider call(
    Post? post,
  ) {
    return FeedButtonsProvider(
      post,
    );
  }

  @override
  FeedButtonsProvider getProviderOverride(
    covariant FeedButtonsProvider provider,
  ) {
    return call(
      provider.post,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedButtonsProvider';
}

/// See also [FeedButtons].
class FeedButtonsProvider
    extends NotifierProviderImpl<FeedButtons, FeedWidgetsState> {
  /// See also [FeedButtons].
  FeedButtonsProvider(
    Post? post,
  ) : this._internal(
          () => FeedButtons()..post = post,
          from: feedButtonsProvider,
          name: r'feedButtonsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedButtonsHash,
          dependencies: FeedButtonsFamily._dependencies,
          allTransitiveDependencies:
              FeedButtonsFamily._allTransitiveDependencies,
          post: post,
        );

  FeedButtonsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.post,
  }) : super.internal();

  final Post? post;

  @override
  FeedWidgetsState runNotifierBuild(
    covariant FeedButtons notifier,
  ) {
    return notifier.build(
      post,
    );
  }

  @override
  Override overrideWith(FeedButtons Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedButtonsProvider._internal(
        () => create()..post = post,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        post: post,
      ),
    );
  }

  @override
  NotifierProviderElement<FeedButtons, FeedWidgetsState> createElement() {
    return _FeedButtonsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedButtonsProvider && other.post == post;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, post.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedButtonsRef on NotifierProviderRef<FeedWidgetsState> {
  /// The parameter `post` of this provider.
  Post? get post;
}

class _FeedButtonsProviderElement
    extends NotifierProviderElement<FeedButtons, FeedWidgetsState>
    with FeedButtonsRef {
  _FeedButtonsProviderElement(super.provider);

  @override
  Post? get post => (origin as FeedButtonsProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
