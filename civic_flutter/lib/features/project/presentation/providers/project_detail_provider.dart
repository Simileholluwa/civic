// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
import 'package:civic_flutter/features/project/domain/usecases/get_project_use_case.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_services_provider.dart';
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
        ownerId: currentUser.userInfoId,
        owner: currentUser,
        title: '',
        description: '',
        images: [],
        category: [],
        status: ProjectStatus.pending,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(
          const Duration(
            days: 5,
          ),
        ),
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
      (poll) async {
        if (poll == null) {
          return null;
        }
        final me = ref.read(meUseCaseProvider);
        final userRecord = await me(NoParams());
        final owner = userRecord.fold((error) => null, (user) => user);
        if (owner == null) return null;
        return poll.copyWith(
          owner: owner,
        );
      },
    );
  }
}
