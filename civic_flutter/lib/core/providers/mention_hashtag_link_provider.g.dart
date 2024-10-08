// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention_hashtag_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mentionServicesHash() => r'ed5736f89487e1c314312d43ae2a0ba74e9d0285';

/// See also [mentionServices].
@ProviderFor(mentionServices)
final mentionServicesProvider =
    AutoDisposeProvider<MentionHashTagLinkServices>.internal(
  mentionServices,
  name: r'mentionServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mentionServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MentionServicesRef = AutoDisposeProviderRef<MentionHashTagLinkServices>;
String _$fetchUsersToMentionHash() =>
    r'0e8eaceba0e81c51cea1a1b116cf1f70b2e81ddb';

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

/// See also [fetchUsersToMention].
@ProviderFor(fetchUsersToMention)
const fetchUsersToMentionProvider = FetchUsersToMentionFamily();

/// See also [fetchUsersToMention].
class FetchUsersToMentionFamily extends Family<AsyncValue<List<UserRecord>>> {
  /// See also [fetchUsersToMention].
  const FetchUsersToMentionFamily();

  /// See also [fetchUsersToMention].
  FetchUsersToMentionProvider call(
    String query,
  ) {
    return FetchUsersToMentionProvider(
      query,
    );
  }

  @override
  FetchUsersToMentionProvider getProviderOverride(
    covariant FetchUsersToMentionProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'fetchUsersToMentionProvider';
}

/// See also [fetchUsersToMention].
class FetchUsersToMentionProvider
    extends AutoDisposeFutureProvider<List<UserRecord>> {
  /// See also [fetchUsersToMention].
  FetchUsersToMentionProvider(
    String query,
  ) : this._internal(
          (ref) => fetchUsersToMention(
            ref as FetchUsersToMentionRef,
            query,
          ),
          from: fetchUsersToMentionProvider,
          name: r'fetchUsersToMentionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUsersToMentionHash,
          dependencies: FetchUsersToMentionFamily._dependencies,
          allTransitiveDependencies:
              FetchUsersToMentionFamily._allTransitiveDependencies,
          query: query,
        );

  FetchUsersToMentionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<UserRecord>> Function(FetchUsersToMentionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUsersToMentionProvider._internal(
        (ref) => create(ref as FetchUsersToMentionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserRecord>> createElement() {
    return _FetchUsersToMentionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUsersToMentionProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUsersToMentionRef on AutoDisposeFutureProviderRef<List<UserRecord>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FetchUsersToMentionProviderElement
    extends AutoDisposeFutureProviderElement<List<UserRecord>>
    with FetchUsersToMentionRef {
  _FetchUsersToMentionProviderElement(super.provider);

  @override
  String get query => (origin as FetchUsersToMentionProvider).query;
}

String _$fetchHashtagsHash() => r'a62cb3a5aecba99984c3df450d38c7cb361ced36';

/// See also [fetchHashtags].
@ProviderFor(fetchHashtags)
const fetchHashtagsProvider = FetchHashtagsFamily();

/// See also [fetchHashtags].
class FetchHashtagsFamily extends Family<AsyncValue<List<String>>> {
  /// See also [fetchHashtags].
  const FetchHashtagsFamily();

  /// See also [fetchHashtags].
  FetchHashtagsProvider call(
    String query,
  ) {
    return FetchHashtagsProvider(
      query,
    );
  }

  @override
  FetchHashtagsProvider getProviderOverride(
    covariant FetchHashtagsProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'fetchHashtagsProvider';
}

/// See also [fetchHashtags].
class FetchHashtagsProvider extends AutoDisposeFutureProvider<List<String>> {
  /// See also [fetchHashtags].
  FetchHashtagsProvider(
    String query,
  ) : this._internal(
          (ref) => fetchHashtags(
            ref as FetchHashtagsRef,
            query,
          ),
          from: fetchHashtagsProvider,
          name: r'fetchHashtagsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchHashtagsHash,
          dependencies: FetchHashtagsFamily._dependencies,
          allTransitiveDependencies:
              FetchHashtagsFamily._allTransitiveDependencies,
          query: query,
        );

  FetchHashtagsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(FetchHashtagsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchHashtagsProvider._internal(
        (ref) => create(ref as FetchHashtagsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _FetchHashtagsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchHashtagsProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchHashtagsRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FetchHashtagsProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with FetchHashtagsRef {
  _FetchHashtagsProviderElement(super.provider);

  @override
  String get query => (origin as FetchHashtagsProvider).query;
}

String _$fetchLinkMetadataHash() => r'6fb888b36332b7af540992b0dbd74c2cabd22935';

/// See also [fetchLinkMetadata].
@ProviderFor(fetchLinkMetadata)
final fetchLinkMetadataProvider =
    AutoDisposeFutureProvider<LinkMetadata?>.internal(
  fetchLinkMetadata,
  name: r'fetchLinkMetadataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchLinkMetadataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchLinkMetadataRef = AutoDisposeFutureProviderRef<LinkMetadata?>;
String _$mentionSuggestionsHash() =>
    r'b067b344d82516a0f9358cca3431d2604def08f7';

/// See also [MentionSuggestions].
@ProviderFor(MentionSuggestions)
final mentionSuggestionsProvider =
    AutoDisposeNotifierProvider<MentionSuggestions, List<UserRecord>>.internal(
  MentionSuggestions.new,
  name: r'mentionSuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mentionSuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MentionSuggestions = AutoDisposeNotifier<List<UserRecord>>;
String _$selectedMentionsHash() => r'3862850f3df7aa0e347bae699b89e2e9ecbf0f43';

/// See also [SelectedMentions].
@ProviderFor(SelectedMentions)
final selectedMentionsProvider =
    NotifierProvider<SelectedMentions, List<UserRecord>>.internal(
  SelectedMentions.new,
  name: r'selectedMentionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedMentionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedMentions = Notifier<List<UserRecord>>;
String _$extractedMentionsHash() => r'26a13e0bb6c500dbe1d306aeab8cfd2ac5cab6bb';

/// See also [ExtractedMentions].
@ProviderFor(ExtractedMentions)
final extractedMentionsProvider =
    AutoDisposeNotifierProvider<ExtractedMentions, List<String>>.internal(
  ExtractedMentions.new,
  name: r'extractedMentionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$extractedMentionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExtractedMentions = AutoDisposeNotifier<List<String>>;
String _$validMentionsHash() => r'd2b39d1bad0f53689c685354b70b7a9cf9d539ba';

abstract class _$ValidMentions extends BuildlessAutoDisposeNotifier<bool> {
  late final String username;

  bool build(
    String username,
  );
}

/// See also [ValidMentions].
@ProviderFor(ValidMentions)
const validMentionsProvider = ValidMentionsFamily();

/// See also [ValidMentions].
class ValidMentionsFamily extends Family<bool> {
  /// See also [ValidMentions].
  const ValidMentionsFamily();

  /// See also [ValidMentions].
  ValidMentionsProvider call(
    String username,
  ) {
    return ValidMentionsProvider(
      username,
    );
  }

  @override
  ValidMentionsProvider getProviderOverride(
    covariant ValidMentionsProvider provider,
  ) {
    return call(
      provider.username,
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
  String? get name => r'validMentionsProvider';
}

/// See also [ValidMentions].
class ValidMentionsProvider
    extends AutoDisposeNotifierProviderImpl<ValidMentions, bool> {
  /// See also [ValidMentions].
  ValidMentionsProvider(
    String username,
  ) : this._internal(
          () => ValidMentions()..username = username,
          from: validMentionsProvider,
          name: r'validMentionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validMentionsHash,
          dependencies: ValidMentionsFamily._dependencies,
          allTransitiveDependencies:
              ValidMentionsFamily._allTransitiveDependencies,
          username: username,
        );

  ValidMentionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
  }) : super.internal();

  final String username;

  @override
  bool runNotifierBuild(
    covariant ValidMentions notifier,
  ) {
    return notifier.build(
      username,
    );
  }

  @override
  Override overrideWith(ValidMentions Function() create) {
    return ProviderOverride(
      origin: this,
      override: ValidMentionsProvider._internal(
        () => create()..username = username,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ValidMentions, bool> createElement() {
    return _ValidMentionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidMentionsProvider && other.username == username;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ValidMentionsRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `username` of this provider.
  String get username;
}

class _ValidMentionsProviderElement
    extends AutoDisposeNotifierProviderElement<ValidMentions, bool>
    with ValidMentionsRef {
  _ValidMentionsProviderElement(super.provider);

  @override
  String get username => (origin as ValidMentionsProvider).username;
}

String _$hashtagsHash() => r'4b65aab5513135bf17368493212a0e1b72e761b0';

/// See also [Hashtags].
@ProviderFor(Hashtags)
final hashtagsProvider = NotifierProvider<Hashtags, List<String>>.internal(
  Hashtags.new,
  name: r'hashtagsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hashtagsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Hashtags = Notifier<List<String>>;
String _$hashtagsSuggestionsHash() =>
    r'82a5c4e5c8f4565966d667a5e90788abb856ecf8';

/// See also [HashtagsSuggestions].
@ProviderFor(HashtagsSuggestions)
final hashtagsSuggestionsProvider =
    AutoDisposeNotifierProvider<HashtagsSuggestions, List<String>>.internal(
  HashtagsSuggestions.new,
  name: r'hashtagsSuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagsSuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagsSuggestions = AutoDisposeNotifier<List<String>>;
String _$extractLinkHash() => r'd4cb0cd40e0822d4b9d73c116b33c9f7f4fe151a';

/// See also [ExtractLink].
@ProviderFor(ExtractLink)
final extractLinkProvider =
    AutoDisposeNotifierProvider<ExtractLink, String>.internal(
  ExtractLink.new,
  name: r'extractLinkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$extractLinkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExtractLink = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
