// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_selections_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TagSelections)
const tagSelectionsProvider = TagSelectionsProvider._();

final class TagSelectionsProvider
    extends $NotifierProvider<TagSelections, List<UserRecord>> {
  const TagSelectionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tagSelectionsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tagSelectionsHash();

  @$internal
  @override
  TagSelections create() => TagSelections();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserRecord> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserRecord>>(value),
    );
  }
}

String _$tagSelectionsHash() => r'3cac578f4076f237cab2c930ac28644b8772fc51';

abstract class _$TagSelections extends $Notifier<List<UserRecord>> {
  List<UserRecord> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<UserRecord>, List<UserRecord>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<UserRecord>, List<UserRecord>>,
        List<UserRecord>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
