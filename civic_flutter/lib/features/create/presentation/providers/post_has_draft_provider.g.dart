// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_has_draft_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hasPostDraft)
const hasPostDraftProvider = HasPostDraftFamily._();

final class HasPostDraftProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const HasPostDraftProvider._(
      {required HasPostDraftFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'hasPostDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hasPostDraftHash();

  @override
  String toString() {
    return r'hasPostDraftProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return hasPostDraft(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HasPostDraftProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hasPostDraftHash() => r'2f74d98484e0c5299edcae202ea87d24fe386b23';

final class HasPostDraftFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  const HasPostDraftFamily._()
      : super(
          retry: null,
          name: r'hasPostDraftProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  HasPostDraftProvider call(
    String draftType,
  ) =>
      HasPostDraftProvider._(argument: draftType, from: this);

  @override
  String toString() => r'hasPostDraftProvider';
}
