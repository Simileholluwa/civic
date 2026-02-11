// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectVet)
final projectVetProvider = ProjectVetFamily._();

final class ProjectVetProvider
    extends $NotifierProvider<ProjectVet, VetProjectState> {
  ProjectVetProvider._({
    required ProjectVetFamily super.from,
    required ProjectVetting? super.argument,
  }) : super(
         retry: null,
         name: r'projectVetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectVetHash();

  @override
  String toString() {
    return r'projectVetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectVet create() => ProjectVet();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VetProjectState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VetProjectState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectVetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectVetHash() => r'6bd0ee1b5a32cfbb43fbe85bac13381466848a33';

final class ProjectVetFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectVet,
          VetProjectState,
          VetProjectState,
          VetProjectState,
          ProjectVetting?
        > {
  ProjectVetFamily._()
    : super(
        retry: null,
        name: r'projectVetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectVetProvider call(ProjectVetting? projectVetting) =>
      ProjectVetProvider._(argument: projectVetting, from: this);

  @override
  String toString() => r'projectVetProvider';
}

abstract class _$ProjectVet extends $Notifier<VetProjectState> {
  late final _$args = ref.$arg as ProjectVetting?;
  ProjectVetting? get projectVetting => _$args;

  VetProjectState build(ProjectVetting? projectVetting);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<VetProjectState, VetProjectState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VetProjectState, VetProjectState>,
              VetProjectState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
