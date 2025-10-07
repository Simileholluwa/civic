import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vet_project_detail_provider.g.dart';

@riverpod
Future<ProjectVetting?> getVettedProjectDetail(
  Ref ref,
  int id,
) async {
  final vettedProject = ref.read(getVettedProjectProvider);
  final completer = Completer<ProjectVetting?>();
  final result = await vettedProject(
    GetVettedProjectParams(
      id,
    ),
  );

  result.fold(
    (error) {
      completer.completeError(error.message);
    },
    completer.complete,
  );

  return completer.future;
}
