// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/usecases/delete_draft_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_draft_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_send_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_draft_provider.g.dart';

@riverpod
class PostDrafts extends _$PostDrafts {
  @override
  List<DraftPost> build() {
    final retrieveDraftPost = ref.read(getDraftProvider);
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
    final deleteAll = ref.read(deleteDraftsProvider);
    final result = await deleteAll(
      NoParams(),
    );
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
    final saveDraft = ref.read(saveDraftProvider);
    final result = await saveDraft(
      SaveDraftParams(
        draftPost,
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
    final deleteDraft = ref.read(deleteDraftProvider);
    final result = await deleteDraft(
      DeleteDraftPostParams(
        draftPost,
      ),
    );

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
    await ref
        .read(
          sendPostProvider.notifier,
        )
        .sendPost(
          Post(
            ownerId: 0,
            postType: THelperFunctions.determinePostType(
              text: draftPost.text,
              pickedImages: draftPost.imagesPath,
              pickedVideo: draftPost.videoPath,
            ),
            text: draftPost.text,
            imageUrls: draftPost.imagesPath,
            videoUrl: draftPost.videoPath,
            taggedUsers: draftPost.taggedUsers,
            locations: draftPost.locations,
            mentions: draftPost.mentions,
            tags: draftPost.tags,
          ),
        );

    await deleteDraftById(
      draftPost,
      index,
    );
  }
}
