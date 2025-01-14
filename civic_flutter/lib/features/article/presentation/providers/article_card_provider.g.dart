// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleCardWidgetHash() => r'f86ac67bf30b99038411d7ac7512873701bfa389';

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

abstract class _$ArticleCardWidget
    extends BuildlessAutoDisposeNotifier<ArticleCardState> {
  late final Article article;

  ArticleCardState build(
    Article article,
  );
}

/// See also [ArticleCardWidget].
@ProviderFor(ArticleCardWidget)
const articleCardWidgetProvider = ArticleCardWidgetFamily();

/// See also [ArticleCardWidget].
class ArticleCardWidgetFamily extends Family<ArticleCardState> {
  /// See also [ArticleCardWidget].
  const ArticleCardWidgetFamily();

  /// See also [ArticleCardWidget].
  ArticleCardWidgetProvider call(
    Article article,
  ) {
    return ArticleCardWidgetProvider(
      article,
    );
  }

  @override
  ArticleCardWidgetProvider getProviderOverride(
    covariant ArticleCardWidgetProvider provider,
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
  String? get name => r'articleCardWidgetProvider';
}

/// See also [ArticleCardWidget].
class ArticleCardWidgetProvider extends AutoDisposeNotifierProviderImpl<
    ArticleCardWidget, ArticleCardState> {
  /// See also [ArticleCardWidget].
  ArticleCardWidgetProvider(
    Article article,
  ) : this._internal(
          () => ArticleCardWidget()..article = article,
          from: articleCardWidgetProvider,
          name: r'articleCardWidgetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleCardWidgetHash,
          dependencies: ArticleCardWidgetFamily._dependencies,
          allTransitiveDependencies:
              ArticleCardWidgetFamily._allTransitiveDependencies,
          article: article,
        );

  ArticleCardWidgetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.article,
  }) : super.internal();

  final Article article;

  @override
  ArticleCardState runNotifierBuild(
    covariant ArticleCardWidget notifier,
  ) {
    return notifier.build(
      article,
    );
  }

  @override
  Override overrideWith(ArticleCardWidget Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArticleCardWidgetProvider._internal(
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
  AutoDisposeNotifierProviderElement<ArticleCardWidget, ArticleCardState>
      createElement() {
    return _ArticleCardWidgetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleCardWidgetProvider && other.article == article;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, article.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArticleCardWidgetRef on AutoDisposeNotifierProviderRef<ArticleCardState> {
  /// The parameter `article` of this provider.
  Article get article;
}

class _ArticleCardWidgetProviderElement
    extends AutoDisposeNotifierProviderElement<ArticleCardWidget,
        ArticleCardState> with ArticleCardWidgetRef {
  _ArticleCardWidgetProviderElement(super.provider);

  @override
  Article get article => (origin as ArticleCardWidgetProvider).article;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
