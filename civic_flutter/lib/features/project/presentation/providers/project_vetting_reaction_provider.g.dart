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
  const VettingReactionProvider._(
      {required VettingReactionFamily super.from,
      required ProjectVetting super.argument})
      : super(
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

String _$vettingReactionHash() => r'b4904fb694ade746378256021bfcded3497a668c';

final class VettingReactionFamily extends $Family
    with
        $ClassFamilyOverride<
            VettingReaction,
            ProjectVettingReactionState,
            ProjectVettingReactionState,
            ProjectVettingReactionState,
            ProjectVetting> {
  const VettingReactionFamily._()
      : super(
          retry: null,
          name: r'vettingReactionProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  VettingReactionProvider call(
    ProjectVetting projectVetting,
  ) =>
      VettingReactionProvider._(argument: projectVetting, from: this);

  @override
  String toString() => r'vettingReactionProvider';
}

abstract class _$VettingReaction
    extends $Notifier<ProjectVettingReactionState> {
  late final _$args = ref.$arg as ProjectVetting;
  ProjectVetting get projectVetting => _$args;

  ProjectVettingReactionState build(
    ProjectVetting projectVetting,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref
        as $Ref<ProjectVettingReactionState, ProjectVettingReactionState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ProjectVettingReactionState, ProjectVettingReactionState>,
        ProjectVettingReactionState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
