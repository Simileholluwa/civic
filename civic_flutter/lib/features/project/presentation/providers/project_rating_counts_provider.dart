import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_rating_counts_provider.g.dart';

@riverpod
class ProjectOverallRatingCounts extends _$ProjectOverallRatingCounts {
  @override
  ProjectOverallRatingState build(Project? project) {
    final projectId = project?.id;
    if (projectId == null) {
      return ProjectOverallRatingState();
    }
    _subscribeToProjectRatingCounts(projectId);
    return ProjectOverallRatingState.populate(project!);
  }

  StreamSubscription<ProjectRatingCounts>? _countsSub;

  void _subscribeToProjectRatingCounts(int projectId) {
    unawaited(_countsSub?.cancel());
    _countsSub = ref
        .read(clientProvider)
        .project
        .projectRatingCountUpdates(projectId)
        .listen((counts) {
          state = state.applyCounts(counts);
        });
    ref.onDispose(() => _countsSub?.cancel());
  }
}
