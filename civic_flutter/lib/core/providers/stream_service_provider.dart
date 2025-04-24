import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_service_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Project> projectStream(
  Ref ref,
  int projectId,
  Project? project,
) async* {
  if (project != null) {
    yield project;
  }
  final updates = ref.read(clientProvider).project.projectUpdates(projectId);
  await for (final update in updates) {
    yield update;
  }
}

@Riverpod(keepAlive: true)
Stream<ProjectReview> projectReviewStream(
  Ref ref,
  int projectReviewId,
  ProjectReview? projectReview,
) async* {
  if (projectReview != null) {
    yield projectReview;
  }
  final updates =
      ref.read(clientProvider).project.projectReviewUpdates(projectReviewId);
  await for (final update in updates) {
    yield update;
  }
}
