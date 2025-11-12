// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectDetail)
const projectDetailProvider = ProjectDetailFamily._();

final class ProjectDetailProvider
    extends $FunctionalProvider<AsyncValue<Project>, Project, FutureOr<Project>>
    with $FutureModifier<Project>, $FutureProvider<Project> {
  const ProjectDetailProvider._(
      {required ProjectDetailFamily super.from,
      required (
        int,
        Project?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'projectDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectDetailHash();

  @override
  String toString() {
    return r'projectDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Project> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Project> create(Ref ref) {
    final argument = this.argument as (
      int,
      Project?,
    );
    return projectDetail(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectDetailHash() => r'11d7193cd829f5d13cc33a85e6098c465752114f';

final class ProjectDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<Project>,
            (
              int,
              Project?,
            )> {
  const ProjectDetailFamily._()
      : super(
          retry: null,
          name: r'projectDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ProjectDetailProvider call(
    int id,
    Project? project,
  ) =>
      ProjectDetailProvider._(argument: (
        id,
        project,
      ), from: this);

  @override
  String toString() => r'projectDetailProvider';
}
