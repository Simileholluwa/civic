// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_has_draft_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hasProjectDraft)
const hasProjectDraftProvider = HasProjectDraftProvider._();

final class HasProjectDraftProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const HasProjectDraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hasProjectDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hasProjectDraftHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return hasProjectDraft(ref);
  }
}

String _$hasProjectDraftHash() => r'99c9e8ef7500a152583c1d3986a0148e6c9bb711';
