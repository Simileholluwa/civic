// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency, avoid_build_context_in_providers

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/usecases/delete_draft_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_draft_post_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  Future<void> deleteAllDrafts(BuildContext context) async {
    final deleteAll = ref.read(deleteAllDraftPostProvider);
    final result = await deleteAll(
      NoParams(),
    );
    result.fold(
      (error) {
        context.pop();
        TToastMessages.errorToast(
          error.message,
        );
      },
      (r) {
        context.pop();
        context.pop();
        state = <DraftPost>[];
      },
    );
  }

  Future<void> saveDraftPost(BuildContext context, DraftPost draftPost) async {
    final saveDraft = ref.read(saveDraftPostProvider);
    final result = await saveDraft(
      SaveDraftPostParams(
        draftPost,
      ),
    );

    result.fold((error) {
      context.pop();
      TToastMessages.errorToast(
        error.message,
      );
    }, (r) {
      context.pop();
      TToastMessages.successToast(
        'Your post has been saved as draft.',
      );
      context.pop();
    });
  }

  Future<void> deleteDraftById(
    BuildContext context,
    int draftId,
    int index,
  ) async {
    final saveDraft = ref.read(deleteDraftPostProvider);
    final result = await saveDraft(
      DeleteDraftPostParams(
        draftId,
      ),
    );

    result.fold((error) {
      context.pop();
      TToastMessages.errorToast(
        error.message,
      );
    }, (r) {
      var drafts = state;
      drafts.removeAt(index);

      state = [...drafts];

      context.pop();
      TToastMessages.successToast(
        'Your draft has been deleted.',
      );
      if (state.isEmpty) context.pop();
    });
  }
}
