// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/usecases/delete_draft_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_draft_post_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_send_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
part 'post_draft_provider.g.dart';

@riverpod
class PostDrafts extends _$PostDrafts {
  @override
  List<DraftPost> build() {
    final retrieveDraftPost = ref.read(retrieveDraftPostProvider);
    final result = retrieveDraftPost(
      NoParams(),
    );

    return result.fold(
      (error) => <DraftPost>[],
      (draftPost) {
        if (draftPost == null) {
          return state = <DraftPost>[];
        } else {
          return state = draftPost;
        }
      },
    );
  }

  Future<bool> deleteAllDrafts() async {
    final deleteAll = ref.read(deleteAllDraftPostProvider);
    final result = await deleteAll(
      NoParams(),
    );
    final appDir = await getApplicationDocumentsDirectory();
    final directory = Directory('${appDir.path}/drafts');
    if (!await directory.exists()) {
      await directory.delete(recursive: true);
    }
    return result.fold(
      (error) {
        TToastMessages.errorToast(
          error.message,
        );
        return false;
      },
      (r) {
        state = <DraftPost>[];
        return true;
      },
    );
  }

  Future<bool> saveDraftPost(DraftPost draftPost) async {
    var savedImages = <String>[];
    var savedVideo = '';
    final appDir = await getApplicationDocumentsDirectory();
    final directory = Directory('${appDir.path}/drafts');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    if (draftPost.imageUrls.isNotEmpty) {
      for (var i = 0; i < draftPost.imageUrls.length; i++) {
        final ext = path.extension(draftPost.imageUrls[i]);
        final fileName = '${draftPost.draftId}$i$ext';
        final savedFile = File(
          path.join(directory.path, fileName),
        );
        final copy = await File(draftPost.imageUrls[i]).copy(savedFile.path);
        savedImages.add(copy.path);
      }
    }
    if (draftPost.videoUrl.isNotEmpty) {
      final ext = path.extension(draftPost.videoUrl);
      final fileName = '${draftPost.draftId}$ext';
      final savedFile = File(
        path.join(directory.path, fileName),
      );
      final copy = await File(draftPost.videoUrl).copy(savedFile.path);
      savedVideo = copy.path;
    }
    final saveDraft = ref.read(saveDraftPostProvider);
    final result = await saveDraft(
      SaveDraftPostParams(
        draftPost.copyWith(
          imageUrls: savedImages,
          videoUrl: savedVideo,
        ),
      ),
    );

    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return false;
    }, (r) {
      return true;
    });
  }

  Future<bool> deleteDraftById(
    DraftPost draftPost,
    int index,
  ) async {
    final deleteDraft = ref.read(deleteDraftPostProvider);
    final result = await deleteDraft(
      DeleteDraftPostParams(
        draftPost.draftId,
      ),
    );

    if (draftPost.videoUrl.isNotEmpty) {
      final videoFile = File(draftPost.videoUrl);
      if (videoFile.existsSync()) {
        videoFile.deleteSync();
      }
    }

    if (draftPost.imageUrls.isNotEmpty) {
      for (final imgPath in draftPost.imageUrls) {
        final imageFile = File(imgPath);
        if (imageFile.existsSync()) {
          imageFile.deleteSync();
        }
      }
    }

    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return false;
    }, (r) {
      var drafts = state;
      drafts.removeAt(index);

      state = [...drafts];
      return true;
    });
  }

  Future<void> sendDraftPost(
    DraftPost draftPost,
    int index,
  ) async {
    final result = await ref.read(sendPostProvider.notifier).sendPost(
          text: draftPost.text,
          imagePath: draftPost.imageUrls,
          videoPath: draftPost.videoUrl,
          postType: draftPost.postType,
          latitude: draftPost.latitude,
          longitude: draftPost.longitude,
          taggedUsers: draftPost.taggedUsers,
        );

    if (result) {
      await deleteDraftById(
        draftPost,
        index,
      );
    }
  }
}
