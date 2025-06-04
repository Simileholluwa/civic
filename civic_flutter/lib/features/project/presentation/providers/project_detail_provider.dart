// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'project_detail_provider.g.dart';

@riverpod
Future<Project> projectDetail(
  Ref ref,
  int id,
) async {
  final completer = Completer<Project>();
  if (id == 0) {
    final getProjectDraft = ref.read(getProjectDraftProvider);
    final result = await getProjectDraft(NoParams());
    result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
        });
      },
      (project) async {
        completer.complete(project);
      },
    );
    return completer.future;
  } else {
    final retrieveProject = ref.read(getProjectProvider);
    final result = await retrieveProject(
      GetProjectParams(
        id,
      ),
    );

    result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
        });
      },
      (project) async {
        completer.complete(project);
      },
    );

    return completer.future;
  }
}
