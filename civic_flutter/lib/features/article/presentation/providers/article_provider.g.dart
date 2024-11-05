// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleWriterHash() => r'fb97fc96ae350810f597fac623e76260b8c0e063';

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

abstract class _$ArticleWriter
    extends BuildlessAutoDisposeNotifier<ArticleState> {
  late final Article? article;

  ArticleState build(
    Article? article,
  );
}

/// See also [ArticleWriter].
@ProviderFor(ArticleWriter)
const articleWriterProvider = ArticleWriterFamily();

/// See also [ArticleWriter].
class ArticleWriterFamily extends Family<ArticleState> {
  /// See also [ArticleWriter].
  const ArticleWriterFamily();

  /// See also [ArticleWriter].
  ArticleWriterProvider call(
    Article? article,
  ) {
    return ArticleWriterProvider(
      article,
    );
  }

  @override
  ArticleWriterProvider getProviderOverride(
    covariant ArticleWriterProvider provider,
  ) {
    return call(
      provider.article,
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
  String? get name => r'articleWriterProvider';
}

/// See also [ArticleWriter].
class ArticleWriterProvider
    extends AutoDisposeNotifierProviderImpl<ArticleWriter, ArticleState> {
  /// See also [ArticleWriter].
  ArticleWriterProvider(
    Article? article,
  ) : this._internal(
          () => ArticleWriter()..article = article,
          from: articleWriterProvider,
          name: r'articleWriterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleWriterHash,
          dependencies: ArticleWriterFamily._dependencies,
          allTransitiveDependencies:
              ArticleWriterFamily._allTransitiveDependencies,
          article: article,
        );

  ArticleWriterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.article,
  }) : super.internal();

  final Article? article;

  @override
  ArticleState runNotifierBuild(
    covariant ArticleWriter notifier,
  ) {
    return notifier.build(
      article,
    );
  }

  @override
  Override overrideWith(ArticleWriter Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArticleWriterProvider._internal(
        () => create()..article = article,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        article: article,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ArticleWriter, ArticleState>
      createElement() {
    return _ArticleWriterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleWriterProvider && other.article == article;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, article.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArticleWriterRef on AutoDisposeNotifierProviderRef<ArticleState> {
  /// The parameter `article` of this provider.
  Article? get article;
}

class _ArticleWriterProviderElement
    extends AutoDisposeNotifierProviderElement<ArticleWriter, ArticleState>
    with ArticleWriterRef {
  _ArticleWriterProviderElement(super.provider);

  @override
  Article? get article => (origin as ArticleWriterProvider).article;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
