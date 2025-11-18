// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_creation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateProjectNotif)
const createProjectNotifProvider = CreateProjectNotifFamily._();

final class CreateProjectNotifProvider
    extends $NotifierProvider<CreateProjectNotif, ProjectCreationState> {
  const CreateProjectNotifProvider._(
      {required CreateProjectNotifFamily super.from,
      required Project? super.argument})
      : super(
          retry: null,
          name: r'createProjectNotifProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$createProjectNotifHash();

  @override
  String toString() {
    return r'createProjectNotifProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CreateProjectNotif create() => CreateProjectNotif();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectCreationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectCreationState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateProjectNotifProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createProjectNotifHash() =>
    r'ad4e071728a1bf36d30ab4875a6d82ca281b6ad9';

final class CreateProjectNotifFamily extends $Family
    with
        $ClassFamilyOverride<CreateProjectNotif, ProjectCreationState,
            ProjectCreationState, ProjectCreationState, Project?> {
  const CreateProjectNotifFamily._()
      : super(
          retry: null,
          name: r'createProjectNotifProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CreateProjectNotifProvider call(
    Project? project,
  ) =>
      CreateProjectNotifProvider._(argument: project, from: this);

  @override
  String toString() => r'createProjectNotifProvider';
}

abstract class _$CreateProjectNotif extends $Notifier<ProjectCreationState> {
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
