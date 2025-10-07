import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_review_detail_provider.g.dart';

@riverpod
Future<ProjectReview?> projectReviewDetail(
  Ref ref,
  int id,
) async {
  final retrieveProject = ref.read(getProjectReviewProvider);
  final completer = Completer<ProjectReview?>();
  final result = await retrieveProject(
    GetProjectReviewParams(
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
    (projectReview) async {
      completer.complete(projectReview);
    },
  );

  return completer.future;
}
