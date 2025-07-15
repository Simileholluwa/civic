// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention_hashtag_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mentionServicesHash() => r'bd3b5edaf82eee204df7723d0b3bc049d1fcc6e5';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MentionServicesRef = AutoDisposeProviderRef<MentionHashTagLinkServices>;
String _$fetchUsersToMentionHash() =>
    r'dd07560788a583979f3345feb854149cc164b104';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$fetchHashtagsHash() => r'868cde6b8cb4f568a8c7d4d96e9220d758e55899';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$fetchLinkMetadataHash() => r'5d7175a6b91f0db953156ab6393a776b91c81b4c';

/// See also [fetchLinkMetadata].
@ProviderFor(fetchLinkMetadata)
const fetchLinkMetadataProvider = FetchLinkMetadataFamily();

/// See also [fetchLinkMetadata].
class FetchLinkMetadataFamily extends Family<AsyncValue<LinkMetadata?>> {
  /// See also [fetchLinkMetadata].
  const FetchLinkMetadataFamily();

  /// See also [fetchLinkMetadata].
  FetchLinkMetadataProvider call(
    String text,
  ) {
    return FetchLinkMetadataProvider(
      text,
    );
  }

  @override
  FetchLinkMetadataProvider getProviderOverride(
    covariant FetchLinkMetadataProvider provider,
  ) {
    return call(
      provider.text,
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
  String? get name => r'fetchLinkMetadataProvider';
}

/// See also [fetchLinkMetadata].
class FetchLinkMetadataProvider
    extends AutoDisposeFutureProvider<LinkMetadata?> {
  /// See also [fetchLinkMetadata].
  FetchLinkMetadataProvider(
    String text,
  ) : this._internal(
          (ref) => fetchLinkMetadata(
            ref as FetchLinkMetadataRef,
            text,
          ),
          from: fetchLinkMetadataProvider,
          name: r'fetchLinkMetadataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchLinkMetadataHash,
          dependencies: FetchLinkMetadataFamily._dependencies,
          allTransitiveDependencies:
              FetchLinkMetadataFamily._allTransitiveDependencies,
          text: text,
        );

  FetchLinkMetadataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  Override overrideWith(
    FutureOr<LinkMetadata?> Function(FetchLinkMetadataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchLinkMetadataProvider._internal(
        (ref) => create(ref as FetchLinkMetadataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LinkMetadata?> createElement() {
    return _FetchLinkMetadataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchLinkMetadataProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchLinkMetadataRef on AutoDisposeFutureProviderRef<LinkMetadata?> {
  /// The parameter `text` of this provider.
  String get text;
}

class _FetchLinkMetadataProviderElement
    extends AutoDisposeFutureProviderElement<LinkMetadata?>
    with FetchLinkMetadataRef {
  _FetchLinkMetadataProviderElement(super.provider);

  @override
  String get text => (origin as FetchLinkMetadataProvider).text;
}

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
String _$selectedMentionsHash() => r'c7376ce7e9fe19772764285658b28558b557ac5d';

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
String _$extractedMentionsHash() => r'8947c65dd6f562e0c3599ebe1ccc9e989ea118a3';

abstract class _$ExtractedMentions
    extends BuildlessAutoDisposeNotifier<List<String>> {
  late final String text;

  List<String> build(
    String text,
  );
}

/// See also [ExtractedMentions].
@ProviderFor(ExtractedMentions)
const extractedMentionsProvider = ExtractedMentionsFamily();

/// See also [ExtractedMentions].
class ExtractedMentionsFamily extends Family<List<String>> {
  /// See also [ExtractedMentions].
  const ExtractedMentionsFamily();

  /// See also [ExtractedMentions].
  ExtractedMentionsProvider call(
    String text,
  ) {
    return ExtractedMentionsProvider(
      text,
    );
  }

  @override
  ExtractedMentionsProvider getProviderOverride(
    covariant ExtractedMentionsProvider provider,
  ) {
    return call(
      provider.text,
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
  String? get name => r'extractedMentionsProvider';
}

/// See also [ExtractedMentions].
class ExtractedMentionsProvider
    extends AutoDisposeNotifierProviderImpl<ExtractedMentions, List<String>> {
  /// See also [ExtractedMentions].
  ExtractedMentionsProvider(
    String text,
  ) : this._internal(
          () => ExtractedMentions()..text = text,
          from: extractedMentionsProvider,
          name: r'extractedMentionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$extractedMentionsHash,
          dependencies: ExtractedMentionsFamily._dependencies,
          allTransitiveDependencies:
              ExtractedMentionsFamily._allTransitiveDependencies,
          text: text,
        );

  ExtractedMentionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  List<String> runNotifierBuild(
    covariant ExtractedMentions notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(ExtractedMentions Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExtractedMentionsProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ExtractedMentions, List<String>>
      createElement() {
    return _ExtractedMentionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExtractedMentionsProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExtractedMentionsRef on AutoDisposeNotifierProviderRef<List<String>> {
  /// The parameter `text` of this provider.
  String get text;
}

class _ExtractedMentionsProviderElement
    extends AutoDisposeNotifierProviderElement<ExtractedMentions, List<String>>
    with ExtractedMentionsRef {
  _ExtractedMentionsProviderElement(super.provider);

  @override
  String get text => (origin as ExtractedMentionsProvider).text;
}

String _$validMentionsHash() => r'ac9e9b6d7a41c1d5cd184953bf925c931881d5c7';

abstract class _$ValidMentions extends BuildlessAutoDisposeNotifier<bool> {
  late final String username;
  late final String text;

  bool build(
    String username,
    String text,
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
    String text,
  ) {
    return ValidMentionsProvider(
      username,
      text,
    );
  }

  @override
  ValidMentionsProvider getProviderOverride(
    covariant ValidMentionsProvider provider,
  ) {
    return call(
      provider.username,
      provider.text,
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
    String text,
  ) : this._internal(
          () => ValidMentions()
            ..username = username
            ..text = text,
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
          text: text,
        );

  ValidMentionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.text,
  }) : super.internal();

  final String username;
  final String text;

  @override
  bool runNotifierBuild(
    covariant ValidMentions notifier,
  ) {
    return notifier.build(
      username,
      text,
    );
  }

  @override
  Override overrideWith(ValidMentions Function() create) {
    return ProviderOverride(
      origin: this,
      override: ValidMentionsProvider._internal(
        () => create()
          ..username = username
          ..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ValidMentions, bool> createElement() {
    return _ValidMentionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidMentionsProvider &&
        other.username == username &&
        other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ValidMentionsRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `text` of this provider.
  String get text;
}

class _ValidMentionsProviderElement
    extends AutoDisposeNotifierProviderElement<ValidMentions, bool>
    with ValidMentionsRef {
  _ValidMentionsProviderElement(super.provider);

  @override
  String get username => (origin as ValidMentionsProvider).username;
  @override
  String get text => (origin as ValidMentionsProvider).text;
}

String _$hashtagsHash() => r'c25b066f71c1b9fe384e2ee2f6771510d2aeac0d';

abstract class _$Hashtags extends BuildlessNotifier<List<String>> {
  late final String text;

  List<String> build(
    String text,
  );
}

/// See also [Hashtags].
@ProviderFor(Hashtags)
const hashtagsProvider = HashtagsFamily();

/// See also [Hashtags].
class HashtagsFamily extends Family<List<String>> {
  /// See also [Hashtags].
  const HashtagsFamily();

  /// See also [Hashtags].
  HashtagsProvider call(
    String text,
  ) {
    return HashtagsProvider(
      text,
    );
  }

  @override
  HashtagsProvider getProviderOverride(
    covariant HashtagsProvider provider,
  ) {
    return call(
      provider.text,
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
  String? get name => r'hashtagsProvider';
}

/// See also [Hashtags].
class HashtagsProvider extends NotifierProviderImpl<Hashtags, List<String>> {
  /// See also [Hashtags].
  HashtagsProvider(
    String text,
  ) : this._internal(
          () => Hashtags()..text = text,
          from: hashtagsProvider,
          name: r'hashtagsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hashtagsHash,
          dependencies: HashtagsFamily._dependencies,
          allTransitiveDependencies: HashtagsFamily._allTransitiveDependencies,
          text: text,
        );

  HashtagsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  List<String> runNotifierBuild(
    covariant Hashtags notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(Hashtags Function() create) {
    return ProviderOverride(
      origin: this,
      override: HashtagsProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  NotifierProviderElement<Hashtags, List<String>> createElement() {
    return _HashtagsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HashtagsProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HashtagsRef on NotifierProviderRef<List<String>> {
  /// The parameter `text` of this provider.
  String get text;
}

class _HashtagsProviderElement
    extends NotifierProviderElement<Hashtags, List<String>> with HashtagsRef {
  _HashtagsProviderElement(super.provider);

  @override
  String get text => (origin as HashtagsProvider).text;
}

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
String _$extractLinkHash() => r'664de337998e9978c3e1051d849ff29f084e94c1';

abstract class _$ExtractLink extends BuildlessAutoDisposeNotifier<String> {
  late final String text;

  String build(
    String text,
  );
}

/// See also [ExtractLink].
@ProviderFor(ExtractLink)
const extractLinkProvider = ExtractLinkFamily();

/// See also [ExtractLink].
class ExtractLinkFamily extends Family<String> {
  /// See also [ExtractLink].
  const ExtractLinkFamily();

  /// See also [ExtractLink].
  ExtractLinkProvider call(
    String text,
  ) {
    return ExtractLinkProvider(
      text,
    );
  }

  @override
  ExtractLinkProvider getProviderOverride(
    covariant ExtractLinkProvider provider,
  ) {
    return call(
      provider.text,
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
  String? get name => r'extractLinkProvider';
}

/// See also [ExtractLink].
class ExtractLinkProvider
    extends AutoDisposeNotifierProviderImpl<ExtractLink, String> {
  /// See also [ExtractLink].
  ExtractLinkProvider(
    String text,
  ) : this._internal(
          () => ExtractLink()..text = text,
          from: extractLinkProvider,
          name: r'extractLinkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$extractLinkHash,
          dependencies: ExtractLinkFamily._dependencies,
          allTransitiveDependencies:
              ExtractLinkFamily._allTransitiveDependencies,
          text: text,
        );

  ExtractLinkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  String runNotifierBuild(
    covariant ExtractLink notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(ExtractLink Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExtractLinkProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ExtractLink, String> createElement() {
    return _ExtractLinkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExtractLinkProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExtractLinkRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `text` of this provider.
  String get text;
}

class _ExtractLinkProviderElement
    extends AutoDisposeNotifierProviderElement<ExtractLink, String>
    with ExtractLinkRef {
  _ExtractLinkProviderElement(super.provider);

  @override
  String get text => (origin as ExtractLinkProvider).text;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
