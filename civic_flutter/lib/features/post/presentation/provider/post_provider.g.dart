// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$regularPostHash() => r'0d79fe4517edccbd8a344e36813e40a332867560';

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

abstract class _$RegularPost extends BuildlessAutoDisposeNotifier<PostState> {
  late final Post? post;

  PostState build(
    Post? post,
  );
}

/// See also [RegularPost].
@ProviderFor(RegularPost)
const regularPostProvider = RegularPostFamily();

/// See also [RegularPost].
class RegularPostFamily extends Family<PostState> {
  /// See also [RegularPost].
  const RegularPostFamily();

  /// See also [RegularPost].
  RegularPostProvider call(
    Post? post,
  ) {
    return RegularPostProvider(
      post,
    );
  }

  @override
  RegularPostProvider getProviderOverride(
    covariant RegularPostProvider provider,
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
  String? get name => r'regularPostProvider';
}

/// See also [RegularPost].
class RegularPostProvider
    extends AutoDisposeNotifierProviderImpl<RegularPost, PostState> {
  /// See also [RegularPost].
  RegularPostProvider(
    Post? post,
  ) : this._internal(
          () => RegularPost()..post = post,
          from: regularPostProvider,
          name: r'regularPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$regularPostHash,
          dependencies: RegularPostFamily._dependencies,
          allTransitiveDependencies:
              RegularPostFamily._allTransitiveDependencies,
          post: post,
        );

  RegularPostProvider._internal(
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
  PostState runNotifierBuild(
    covariant RegularPost notifier,
  ) {
    return notifier.build(
      post,
    );
  }

  @override
  Override overrideWith(RegularPost Function() create) {
    return ProviderOverride(
      origin: this,
      override: RegularPostProvider._internal(
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
  AutoDisposeNotifierProviderElement<RegularPost, PostState> createElement() {
    return _RegularPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegularPostProvider && other.post == post;
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
mixin RegularPostRef on AutoDisposeNotifierProviderRef<PostState> {
  /// The parameter `post` of this provider.
  Post? get post;
}

class _RegularPostProviderElement
    extends AutoDisposeNotifierProviderElement<RegularPost, PostState>
    with RegularPostRef {
  _RegularPostProviderElement(super.provider);

  @override
  Post? get post => (origin as RegularPostProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
