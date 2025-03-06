// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'project_detail_provider.g.dart';

@riverpod
Future<Project?> projectDetail(
  Ref ref,
  int id,
) async {
  if (id == 0) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    return Project(
      ownerId: userId!,
    );
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
        return project;
      },
    );
  }
}
