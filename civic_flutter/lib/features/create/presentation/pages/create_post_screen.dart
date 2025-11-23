import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({
    required this.id,
    super.key,
    this.project,
    this.parent,
    this.post,
  });

  final int id;
  final Project? project;
  final Post? parent;
  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(mentionSuggestionsProvider.select((s) => s));
    final hashtagsSuggestions =
        ref.watch(hashtagsSuggestionsProvider.select((s) => s));
    final data = ref.watch(postDetailProvider(id, post, PostType.regular));
    final hasDraft = ref.watch(hasPostDraftProvider(TTexts.postDraft));
    final postState = ref.watch(postCreationProvider(data.value?.post));
    final postNotifier = ref.read(
      postCreationProvider(data.value?.post).notifier,
    );
    final canSendPost = ref.watch(
      postCreationProvider(data.value?.post).select(
        (s) =>
            s.imageUrls.isNotEmpty ||
            s.text.isNotEmpty ||
            s.videoUrl.isNotEmpty,
      ),
    );
    final isRepost = project != null;
    final isReplyOrComment =
        parent != null || data.value?.post.parentId != null;
    final isComment = isReplyOrComment &&
        (parent?.postType == PostType.regular ||
            parent?.postType == PostType.projectRepost ||
            parent?.postType == PostType.poll ||
            parent?.postType == PostType.article ||
            data.value?.post.postType == PostType.comment);
    final scheduledDateTimeState = ref.watch(
      postScheduledDateTimeProvider.select((dt) => dt),
    );
    log('isComment: $isComment');
    log('parentId: ${data.value?.post.parentId}');
    log('post id: ${data.value?.post.id}');
    Future<void> saveDraftAndPop() async {
      await postNotifier.savePostAsDraft(
        data.value?.post.id,
        null,
      );
      if (context.mounted) context.pop();
    }

    Future<void> handlePopAttempt() async {
      if (canSendPost && !isRepost && !isReplyOrComment) {
        final save = await savePostDraftDialog(
          context,
          PostType.regular,
        );
        if (save == null) return;
        if (save) {
          await saveDraftAndPop();
        } else {
          if (context.mounted) context.pop();
        }
      } else {
        if (context.mounted) context.pop();
      }
    }

    Widget? buildSuggestionsSheet() {
      if (suggestions.isEmpty && hashtagsSuggestions.isEmpty) return null;
      if (suggestions.isNotEmpty) {
        return RepaintBoundary(
          child: MentionsSuggestionsWidget(
            onSuggestionSelected: (s) => THelperFunctions.onSuggestionSelected(
              ref,
              s,
              postState.controller,
            ),
          ),
        );
      }
      return RepaintBoundary(
        child: HashtagSuggestionsWidget(
          onSuggestionSelected: (s) => THelperFunctions.onSuggestionSelected(
            ref,
            s,
            postState.controller,
          ),
        ),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) async {
        if (didPop) return;
        await handlePopAttempt();
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: canSendPost,
              hasDraft: hasDraft.value ?? false,
              draftPressed: () async {
                final draft = await loadPostDrafts(
                  context,
                  TTexts.postDraft,
                );
                if (draft is Post) {
                  postNotifier.loadFromDraft(draft);
                }
              },
              sendPressed: () async {
                if (context.mounted) {
                  context.pop();
                }
                if (isRepost) {
                  await postNotifier.repostOrQuote(
                    data.value?.post.id,
                    project?.id,
                  );
                } else if (isReplyOrComment) {
                  if (isComment) {
                    await postNotifier.sendComment(
                      parent?.id ?? data.value?.post.parentId ?? 0,
                      data.value?.post.id,
                    );
                  } else {
                    await postNotifier.sendReply(
                      parent?.id ?? data.value?.post.parentId ?? 0,
                      data.value?.post.id,
                    );
                  }
                } else {
                  await postNotifier.send(id);
                }
              },
              title: const CreateContentPrivacy(),
              sendText: isRepost ? 'REPOST' : null,
              onCanSendPost: () async {
                await handlePopAttempt();
              },
            ),
          ),
          bottomSheet: buildSuggestionsSheet(),
          bottomNavigationBar: data.when(
            data: (_) => scheduledDateTimeState != null
                ? const RepaintBoundary(child: CreateContentSchedule())
                : null,
            error: (error, st) {
              final err =
                  error is Map<String, dynamic> ? error : <String, dynamic>{};
              if (err['action'] == 'retry') {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ContentSingleButton(
                    onPressed: () => ref.invalidate(postDetailProvider),
                    text: 'Retry',
                    buttonIcon: Iconsax.refresh,
                  ),
                );
              }
              return null;
            },
            loading: () => null,
          ),
          body: data.when(
            data: (value) => RepaintBoundary(
              child: CreatePostWidget(
                post: value.post,
                project: project,
                isReplyOrComment: parent != null,
              ),
            ),
            error: (error, st) {
              final message = error is Map
                  ? error['message']?.toString()
                  : error.toString();
              return LoadingError(
                retry: null,
                imageString: TImageTexts.error,
                mainAxisAlignment: MainAxisAlignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                errorMessage: message,
              );
            },
            loading: () => const AppLoadingWidget(),
          ),
        ),
      ),
    );
  }
}
