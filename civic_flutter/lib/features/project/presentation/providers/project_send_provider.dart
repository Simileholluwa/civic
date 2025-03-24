// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_send_provider.g.dart';

@riverpod
class SendProject extends _$SendProject {
  @override
  void build() {}

  Future<List<String>> sendImageAttachments(Project project) async {
    var existingUpload = <String>[];
    var newUpload = <String>[];
    if (project.projectImageAttachments == null) return <String>[];
    if (project.projectImageAttachments!.isNotEmpty) {
      for (final image in project.projectImageAttachments!) {
        final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
        if (regex.hasMatch(image)) {
          existingUpload.add(image);
        } else {
          newUpload.add(image);
        }
      }
      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
            newUpload,
            'projects',
            'images',
          );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        return [];
      }, (imageUrls) {
        return imageUrls + existingUpload;
      });
    }
    return [];
  }

  Future<List<String>> sendPDFAttachments(Project project) async {
    var existingUpload = <String>[];
    var newUpload = <String>[];
    if (project.projectPDFAttachments == null) return <String>[];
    if (project.projectPDFAttachments!.isNotEmpty) {
      for (final pdf in project.projectPDFAttachments!) {
        final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
        if (regex.hasMatch(pdf)) {
          existingUpload.add(pdf);
        } else {
          newUpload.add(pdf);
        }
      }
      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
            newUpload,
            'projects',
            'pdfs',
          );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        return [];
      }, (pdfUrls) {
        return pdfUrls + existingUpload;
      });
    }
    return [];
  }

  Future<String> sendVideoAttachment(Project project) async {
    if (project.projectVideoUrl == null) return '';
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    if (regex.hasMatch(project.projectVideoUrl!)) {
      return project.projectVideoUrl!;
    } else {
      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
        [project.projectVideoUrl!],
        'projects',
        'videos',
      );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        return '';
      }, (videoUrl) {
        return videoUrl.first;
      });
    }
  }

  Future<void> undoProjectRepost(int projectId,) async {
    final undoRepost = ref.read(undoRepostProvider);
    final result = await undoRepost(
      UndoRepostParams(
        projectId,
      ),
    );
    return result.fold((error) async {
      log('Undo error: ${error.message}');
      return;
    }, (_) {
      ref
          .watch(
            paginatedPostListProvider.notifier,
          )
          .removeProjectRepostById(
            projectId,
          );
      return;
    });
  }

  Future<void> sendProject(Project project) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final imageUrls = await sendImageAttachments(project);
    final pdfUrls = await sendPDFAttachments(project);
    final videoUrl = await sendVideoAttachment(project);

    final updatedProject = project.copyWith(
      projectImageAttachments: imageUrls,
      projectPDFAttachments: pdfUrls,
      projectVideoUrl: videoUrl,
    );
    final saveProject = ref.read(saveProjectProvider);

    final result = await saveProject(
      SaveProjectParams(
        updatedProject,
      ),
    );

    return result.fold((error) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      log(error.message);

      TToastMessages.errorToast(error.message);
      return;
    }, (response) {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      if (response == null) {
        //TODO: save failed project to draft
        return null;
      }
      TToastMessages.successToast(
        'Your project was sent.',
      );
      ref
          .watch(
            paginatedProjectListProvider.notifier,
          )
          .addProject(
            response,
          );
      return;
    });
  }
}
