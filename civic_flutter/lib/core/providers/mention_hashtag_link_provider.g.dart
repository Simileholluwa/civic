// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention_hashtag_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mentionServices)
final mentionServicesProvider = MentionServicesProvider._();

final class MentionServicesProvider
    extends
        $FunctionalProvider<
          MentionHashTagLinkServices,
          MentionHashTagLinkServices,
          MentionHashTagLinkServices
        >
    with $Provider<MentionHashTagLinkServices> {
  MentionServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mentionServicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mentionServicesHash();

  @$internal
  @override
  $ProviderElement<MentionHashTagLinkServices> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MentionHashTagLinkServices create(Ref ref) {
    return mentionServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MentionHashTagLinkServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MentionHashTagLinkServices>(value),
    );
  }
}

String _$mentionServicesHash() => r'bd3b5edaf82eee204df7723d0b3bc049d1fcc6e5';

@ProviderFor(recentMentionSuggestions)
final recentMentionSuggestionsProvider = RecentMentionSuggestionsProvider._();

final class RecentMentionSuggestionsProvider
    extends
        $FunctionalProvider<
          List<UserRecord>,
          List<UserRecord>,
          List<UserRecord>
        >
    with $Provider<List<UserRecord>> {
  RecentMentionSuggestionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentMentionSuggestionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentMentionSuggestionsHash();

  @$internal
  @override
  $ProviderElement<List<UserRecord>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<UserRecord> create(Ref ref) {
    return recentMentionSuggestions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserRecord> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserRecord>>(value),
    );
  }
}

String _$recentMentionSuggestionsHash() =>
    r'0e46389e09644f20c2b482d928e017a5e461add6';

@ProviderFor(fetchUsersToMention)
final fetchUsersToMentionProvider = FetchUsersToMentionFamily._();

final class FetchUsersToMentionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserRecord>>,
          List<UserRecord>,
          FutureOr<List<UserRecord>>
        >
    with $FutureModifier<List<UserRecord>>, $FutureProvider<List<UserRecord>> {
  FetchUsersToMentionProvider._({
    required FetchUsersToMentionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchUsersToMentionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchUsersToMentionHash();

  @override
  String toString() {
    return r'fetchUsersToMentionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<UserRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserRecord>> create(Ref ref) {
    final argument = this.argument as String;
    return fetchUsersToMention(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUsersToMentionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchUsersToMentionHash() =>
    r'2a01eec22ef6394d1508a6fe482ef9433db15f7f';

final class FetchUsersToMentionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<UserRecord>>, String> {
  FetchUsersToMentionFamily._()
    : super(
        retry: null,
        name: r'fetchUsersToMentionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchUsersToMentionProvider call(String query) =>
      FetchUsersToMentionProvider._(argument: query, from: this);

  @override
  String toString() => r'fetchUsersToMentionProvider';
}

@ProviderFor(MentionSuggestions)
final mentionSuggestionsProvider = MentionSuggestionsProvider._();

final class MentionSuggestionsProvider
    extends $NotifierProvider<MentionSuggestions, List<UserRecord>> {
  MentionSuggestionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mentionSuggestionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mentionSuggestionsHash();

  @$internal
  @override
  MentionSuggestions create() => MentionSuggestions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserRecord> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserRecord>>(value),
    );
  }
}

String _$mentionSuggestionsHash() =>
    r'7fc5f8ae0e40b6ecefd2ad48efea7acc38e76374';

abstract class _$MentionSuggestions extends $Notifier<List<UserRecord>> {
  List<UserRecord> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<UserRecord>, List<UserRecord>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<UserRecord>, List<UserRecord>>,
              List<UserRecord>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedMentions)
final selectedMentionsProvider = SelectedMentionsProvider._();

final class SelectedMentionsProvider
    extends $NotifierProvider<SelectedMentions, List<UserRecord>> {
  SelectedMentionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedMentionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedMentionsHash();

  @$internal
  @override
  SelectedMentions create() => SelectedMentions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserRecord> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserRecord>>(value),
    );
  }
}

String _$selectedMentionsHash() => r'd82b7001d840266f35ccdd7261dc63e6c2dd7d20';

abstract class _$SelectedMentions extends $Notifier<List<UserRecord>> {
  List<UserRecord> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<UserRecord>, List<UserRecord>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<UserRecord>, List<UserRecord>>,
              List<UserRecord>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ExtractedMentions)
final extractedMentionsProvider = ExtractedMentionsFamily._();

final class ExtractedMentionsProvider
    extends $NotifierProvider<ExtractedMentions, List<String>> {
  ExtractedMentionsProvider._({
    required ExtractedMentionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'extractedMentionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$extractedMentionsHash();

  @override
  String toString() {
    return r'extractedMentionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ExtractedMentions create() => ExtractedMentions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExtractedMentionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$extractedMentionsHash() => r'44b5d345a943a8f7f2d19047696d21ae7f79f4b1';

final class ExtractedMentionsFamily extends $Family
    with
        $ClassFamilyOverride<
          ExtractedMentions,
          List<String>,
          List<String>,
          List<String>,
          String
        > {
  ExtractedMentionsFamily._()
    : super(
        retry: null,
        name: r'extractedMentionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExtractedMentionsProvider call(String text) =>
      ExtractedMentionsProvider._(argument: text, from: this);

  @override
  String toString() => r'extractedMentionsProvider';
}

abstract class _$ExtractedMentions extends $Notifier<List<String>> {
  late final _$args = ref.$arg as String;
  String get text => _$args;

  List<String> build(String text);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ValidMentions)
final validMentionsProvider = ValidMentionsFamily._();

final class ValidMentionsProvider
    extends $NotifierProvider<ValidMentions, bool> {
  ValidMentionsProvider._({
    required ValidMentionsFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'validMentionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$validMentionsHash();

  @override
  String toString() {
    return r'validMentionsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ValidMentions create() => ValidMentions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ValidMentionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$validMentionsHash() => r'5115e7d306ad573e1d1448f0aec0b47ca62728ed';

final class ValidMentionsFamily extends $Family
    with
        $ClassFamilyOverride<
          ValidMentions,
          bool,
          bool,
          bool,
          (String, String)
        > {
  ValidMentionsFamily._()
    : super(
        retry: null,
        name: r'validMentionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ValidMentionsProvider call(String username, String text) =>
      ValidMentionsProvider._(argument: (username, text), from: this);

  @override
  String toString() => r'validMentionsProvider';
}

abstract class _$ValidMentions extends $Notifier<bool> {
  late final _$args = ref.$arg as (String, String);
  String get username => _$args.$1;
  String get text => _$args.$2;

  bool build(String username, String text);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}

@ProviderFor(Hashtags)
final hashtagsProvider = HashtagsFamily._();

final class HashtagsProvider extends $NotifierProvider<Hashtags, List<String>> {
  HashtagsProvider._({
    required HashtagsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'hashtagsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$hashtagsHash();

  @override
  String toString() {
    return r'hashtagsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Hashtags create() => Hashtags();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HashtagsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hashtagsHash() => r'51eddcb9de8d581aa95991b5baa38960d0ee197f';

final class HashtagsFamily extends $Family
    with
        $ClassFamilyOverride<
          Hashtags,
          List<String>,
          List<String>,
          List<String>,
          String
        > {
  HashtagsFamily._()
    : super(
        retry: null,
        name: r'hashtagsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  HashtagsProvider call(String text) =>
      HashtagsProvider._(argument: text, from: this);

  @override
  String toString() => r'hashtagsProvider';
}

abstract class _$Hashtags extends $Notifier<List<String>> {
  late final _$args = ref.$arg as String;
  String get text => _$args;

  List<String> build(String text);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(fetchHashtags)
final fetchHashtagsProvider = FetchHashtagsFamily._();

final class FetchHashtagsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  FetchHashtagsProvider._({
    required FetchHashtagsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchHashtagsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchHashtagsHash();

  @override
  String toString() {
    return r'fetchHashtagsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    final argument = this.argument as String;
    return fetchHashtags(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchHashtagsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchHashtagsHash() => r'9e8aac021494bcc22b52460cf06e6ff20de64288';

final class FetchHashtagsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<String>>, String> {
  FetchHashtagsFamily._()
    : super(
        retry: null,
        name: r'fetchHashtagsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchHashtagsProvider call(String query) =>
      FetchHashtagsProvider._(argument: query, from: this);

  @override
  String toString() => r'fetchHashtagsProvider';
}

@ProviderFor(HashtagsSuggestions)
final hashtagsSuggestionsProvider = HashtagsSuggestionsProvider._();

final class HashtagsSuggestionsProvider
    extends $NotifierProvider<HashtagsSuggestions, List<String>> {
  HashtagsSuggestionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hashtagsSuggestionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hashtagsSuggestionsHash();

  @$internal
  @override
  HashtagsSuggestions create() => HashtagsSuggestions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$hashtagsSuggestionsHash() =>
    r'4ddd628a4be4c97185d6d6b73d690bee3266ee9d';

abstract class _$HashtagsSuggestions extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(RecentHashtags)
final recentHashtagsProvider = RecentHashtagsProvider._();

final class RecentHashtagsProvider
    extends $NotifierProvider<RecentHashtags, List<String>> {
  RecentHashtagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentHashtagsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentHashtagsHash();

  @$internal
  @override
  RecentHashtags create() => RecentHashtags();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$recentHashtagsHash() => r'45975aa722fbe1f05477180d4b1e3dfa584811a5';

abstract class _$RecentHashtags extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(fetchLinkMetadata)
final fetchLinkMetadataProvider = FetchLinkMetadataFamily._();

final class FetchLinkMetadataProvider
    extends
        $FunctionalProvider<
          AsyncValue<LinkMetadata?>,
          LinkMetadata?,
          FutureOr<LinkMetadata?>
        >
    with $FutureModifier<LinkMetadata?>, $FutureProvider<LinkMetadata?> {
  FetchLinkMetadataProvider._({
    required FetchLinkMetadataFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchLinkMetadataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchLinkMetadataHash();

  @override
  String toString() {
    return r'fetchLinkMetadataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LinkMetadata?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LinkMetadata?> create(Ref ref) {
    final argument = this.argument as String;
    return fetchLinkMetadata(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchLinkMetadataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchLinkMetadataHash() => r'b0290afa80dd1b859732fa2b0a2bcdd26f7f846b';

final class FetchLinkMetadataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LinkMetadata?>, String> {
  FetchLinkMetadataFamily._()
    : super(
        retry: null,
        name: r'fetchLinkMetadataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchLinkMetadataProvider call(String text) =>
      FetchLinkMetadataProvider._(argument: text, from: this);

  @override
  String toString() => r'fetchLinkMetadataProvider';
}

@ProviderFor(ExtractLink)
final extractLinkProvider = ExtractLinkFamily._();

final class ExtractLinkProvider extends $NotifierProvider<ExtractLink, String> {
  ExtractLinkProvider._({
    required ExtractLinkFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'extractLinkProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$extractLinkHash();

  @override
  String toString() {
    return r'extractLinkProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ExtractLink create() => ExtractLink();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExtractLinkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$extractLinkHash() => r'b04ec29c93e1c00eef28891b4cadf028ed19f101';

final class ExtractLinkFamily extends $Family
    with $ClassFamilyOverride<ExtractLink, String, String, String, String> {
  ExtractLinkFamily._()
    : super(
        retry: null,
        name: r'extractLinkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExtractLinkProvider call(String text) =>
      ExtractLinkProvider._(argument: text, from: this);

  @override
  String toString() => r'extractLinkProvider';
}

abstract class _$ExtractLink extends $Notifier<String> {
  late final _$args = ref.$arg as String;
  String get text => _$args;

  String build(String text);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
