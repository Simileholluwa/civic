// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectProvider)
const projectProviderProvider = ProjectProviderFamily._();

final class ProjectProviderProvider
    extends $NotifierProvider<ProjectProvider, ProjectCreationState> {
  const ProjectProviderProvider._(
      {required ProjectProviderFamily super.from,
      required Project? super.argument})
      : super(
          retry: null,
          name: r'projectProviderProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectProviderHash();

  @override
  String toString() {
    return r'projectProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectProvider create() => ProjectProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectCreationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectCreationState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectProviderHash() => r'f3fa335a3981c8d20a35421bab69bcd9647a264e';

final class ProjectProviderFamily extends $Family
    with
        $ClassFamilyOverride<ProjectProvider, ProjectCreationState,
            ProjectCreationState, ProjectCreationState, Project?> {
  const ProjectProviderFamily._()
      : super(
          retry: null,
          name: r'projectProviderProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ProjectProviderProvider call(
    Project? project,
  ) =>
      ProjectProviderProvider._(argument: project, from: this);

  @override
  String toString() => r'projectProviderProvider';
}

abstract class _$ProjectProvider extends $Notifier<ProjectCreationState> {
  late final _$args = ref.$arg as Project?;
  Project? get project => _$args;

  ProjectCreationState build(
    Project? project,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<ProjectCreationState, ProjectCreationState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ProjectCreationState, ProjectCreationState>,
        ProjectCreationState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
