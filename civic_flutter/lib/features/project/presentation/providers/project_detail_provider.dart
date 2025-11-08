import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail_provider.g.dart';

@riverpod
Future<Project> projectDetail(
  Ref ref,
  int id,
  Project? project,
) async {
  final completer = Completer<Project>();
  if (id == 0) {
    final userId = ref.read(localStorageProvider).getInt('userId')!;
    completer.complete(
      Project(
        ownerId: userId,
      ),
    );
    return completer.future;
  } else if (project != null) {
    completer.complete(project);
    return completer.future;
  } else {
    final retrieveProject = ref.read(getProjectProvider);
    final result = await retrieveProject(
      GetProjectParams(
        id,
      ),
    );

    await result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
        });
      },
      (projectWithUserState) async {
        completer.complete(projectWithUserState.project);
      },
    );

    return completer.future;
  }
}

@riverpod
Future<bool> hasProjectDraft(Ref ref) async {
  final getProjectsDraft = ref.read(getProjectDraftsProvider);
  final result = await getProjectsDraft(NoParams());
  return result.fold(
    (l) => false,
    (r) {
      return r.isNotEmpty;
    },
  );
}
