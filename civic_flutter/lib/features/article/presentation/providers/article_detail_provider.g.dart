// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleDetailHash() => r'd22eb7f9af082692a742278aa4dcf55ad2c50015';

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

/// See also [articleDetail].
@ProviderFor(articleDetail)
const articleDetailProvider = ArticleDetailFamily();

/// See also [articleDetail].
class ArticleDetailFamily extends Family<AsyncValue<Article?>> {
  /// See also [articleDetail].
  const ArticleDetailFamily();

  /// See also [articleDetail].
  ArticleDetailProvider call(
    int id,
  ) {
    return ArticleDetailProvider(
      id,
    );
  }

  @override
  ArticleDetailProvider getProviderOverride(
    covariant ArticleDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'articleDetailProvider';
}

/// See also [articleDetail].
class ArticleDetailProvider extends AutoDisposeFutureProvider<Article?> {
  /// See also [articleDetail].
  ArticleDetailProvider(
    int id,
  ) : this._internal(
          (ref) => articleDetail(
            ref as ArticleDetailRef,
            id,
          ),
          from: articleDetailProvider,
          name: r'articleDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleDetailHash,
          dependencies: ArticleDetailFamily._dependencies,
          allTransitiveDependencies:
              ArticleDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ArticleDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Article?> Function(ArticleDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArticleDetailProvider._internal(
        (ref) => create(ref as ArticleDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Article?> createElement() {
    return _ArticleDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArticleDetailRef on AutoDisposeFutureProviderRef<Article?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ArticleDetailProviderElement
    extends AutoDisposeFutureProviderElement<Article?> with ArticleDetailRef {
  _ArticleDetailProviderElement(super.provider);

  @override
  int get id => (origin as ArticleDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
