// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
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
  final result = await retrieveProject(
    GetProjectReviewParams(
      id,
    ),
  );

  return result.fold(
    (error) {
      log(error);
      return null;
    },
    (projectReview) async {
      if (projectReview == null) {
        return null;
      }
      return projectReview;
    },
  );
}
