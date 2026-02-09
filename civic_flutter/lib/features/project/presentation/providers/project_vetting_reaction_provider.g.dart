// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_vetting_reaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VettingReaction)
const vettingReactionProvider = VettingReactionFamily._();

final class VettingReactionProvider
    extends $NotifierProvider<VettingReaction, ProjectVettingReactionState> {
  const VettingReactionProvider._({
    required VettingReactionFamily super.from,
    required ProjectVettingWithUserStateKey? super.argument,
  }) : super(
         retry: null,
         name: r'vettingReactionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vettingReactionHash();

  @override
  String toString() {
    return r'vettingReactionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  VettingReaction create() => VettingReaction();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectVettingReactionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectVettingReactionState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VettingReactionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vettingReactionHash() => r'2958935057bfc4df6052f5ecdb9bad58bf8c0ce3';

final class VettingReactionFamily extends $Family
    with
        $ClassFamilyOverride<
          VettingReaction,
          ProjectVettingReactionState,
          ProjectVettingReactionState,
          ProjectVettingReactionState,
          ProjectVettingWithUserStateKey?
        > {
  const VettingReactionFamily._()
    : super(
        retry: null,
        name: r'vettingReactionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VettingReactionProvider call(ProjectVettingWithUserStateKey? key) =>
      VettingReactionProvider._(argument: key, from: this);

  @override
  String toString() => r'vettingReactionProvider';
}

abstract class _$VettingReaction
    extends $Notifier<ProjectVettingReactionState> {
  late final _$args = ref.$arg as ProjectVettingWithUserStateKey?;
  ProjectVettingWithUserStateKey? get key => _$args;

  ProjectVettingReactionState build(ProjectVettingWithUserStateKey? key);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<ProjectVettingReactionState, ProjectVettingReactionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ProjectVettingReactionState,
                ProjectVettingReactionState
              >,
              ProjectVettingReactionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
