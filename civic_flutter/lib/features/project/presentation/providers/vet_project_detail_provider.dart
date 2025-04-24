// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'vet_project_detail_provider.g.dart';

@riverpod
Future<ProjectVetting?> getVettedProjectDetail(
  Ref ref,
  int id,
) async {
  final vettedProject = ref.read(getVettedProjectProvider);
  final result = await vettedProject(
    GetVettedProjectParams(
      id,
    ),
  );

  return result.fold(
    (error) {
      log(error.message);
      return null;
    },
    (projectReview) async {
      return projectReview;
    },
  );
}
