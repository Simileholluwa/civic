// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_detail_provider.g.dart';

@riverpod
Future<Project?> projectDetail(
  ProjectDetailRef ref,
  int id,
) async {
  if (id == 0) {
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return Project(
        ownerId: currentUser.userInfo!.id!,
      );
    });
  } else {
    final retrieveProject = ref.read(getProjectProvider);
    final result = await retrieveProject(
      GetProjectParams(
        id,
      ),
    );

    return result.fold(
      (error) => null,
      (project) async {
        if (project == null) {
          return null;
        }
        final me = ref.read(meUseCaseProvider);
        final userRecord = await me(NoParams());
        final owner = userRecord.fold((error) => null, (user) => user);
        if (owner == null) return null;
        return project.copyWith(
          owner: owner,
        );
      },
    );
  }
}
