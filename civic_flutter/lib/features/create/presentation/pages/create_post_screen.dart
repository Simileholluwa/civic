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
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final data = ref.watch(
      postDetailProvider(id, post, PostType.regular),
    );
    final hasDraft = ref.watch(
      hasPostDraftProvider(TTexts.postDraft),
    );
    final postState = ref.watch(
      postCreationProvider(data.value),
    );
    final postNotifier = ref.read(
      postCreationProvider(data.value).notifier,
    );
    final canSendPost = postState.imageUrls.isNotEmpty ||
        postState.text.isNotEmpty ||
        postState.videoUrl.isNotEmpty;
    final isRepost = project != null;
    final isReplyOrComment = parent != null;
    final isComment = isReplyOrComment &&
        (parent?.postType == PostType.regular ||
            parent?.postType == PostType.projectRepost ||
            parent?.postType == PostType.poll ||
            parent?.postType == PostType.article);
    final scheduledDateTimeState = ref.watch(
      postScheduledDateTimeProvider,
    );

    Future<void> saveDraftAndPop() async {
      await postNotifier.savePostAsDraft(
        data.value?.id,
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
      if (suggestions.isNotEmpty) {
        return MentionsSuggestionsWidget(
          onSuggestionSelected: (s) => THelperFunctions.onSuggestionSelected(
            ref,
            s,
            postState.controller,
          ),
        );
      }
      if (hashtagsSuggestions.isNotEmpty) {
        return HashtagSuggestionsWidget(
          onSuggestionSelected: (s) => THelperFunctions.onSuggestionSelected(
            ref,
            s,
            postState.controller,
          ),
        );
      }
      return null;
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
                    data.value?.id,
                    project?.id,
                  );
                } else if (isReplyOrComment) {
                  if (isComment) {
                    await postNotifier.sendComment(
                      parent!.id!,
                      data.value?.id,
                    );
                  } else {
                    await postNotifier.sendReply(
                      parent!.id!,
                      data.value?.id,
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
            data: (_) {
              if (scheduledDateTimeState != null) {
                return const CreateContentSchedule();
              } else {
                return null;
              }
            },
            error: (error, st) {
              final err = error as Map<String, dynamic>;
              if (err['action'] == 'retry') {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: ContentSingleButton(
                    onPressed: () {
                      ref.invalidate(postDetailProvider);
                    },
                    text: 'Retry',
                    buttonIcon: Iconsax.refresh,
                  ),
                );
              }
              return null;
            },
            loading: () {
              return null;
            },
          ),
          body: data.when(
            data: (value) {
              return CreatePostWidget(
                post: value,
                project: project,
                parent: parent,
                isReplyOrComment: parent != null,
              );
            },
            error: (error, st) {
              String? message;
              if (error is Map) {
                message = error['message']?.toString();
              } else {
                message = error.toString();
              }
              return LoadingError(
                retry: null,
                imageString: TImageTexts.error,
                mainAxisAlignment: MainAxisAlignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                errorMessage: message,
              );
            },
            loading: () {
              return const AppLoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
