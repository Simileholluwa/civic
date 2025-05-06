// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  result.fold(
    (error) {
      log(error, name: 'Project Review Detail Provider');
      completer.completeError(error);
    },
    (projectReview) async {
      completer.complete(projectReview);
    },
  );

  return completer.future;
}
