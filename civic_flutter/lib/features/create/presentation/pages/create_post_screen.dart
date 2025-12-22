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
    this.projectToQuote,
    this.postToQuote,
    this.rootPost,
    this.isReply = false,
    this.isComment = false,
  });

  final int id;
  final Post? rootPost;
  final Post? postToQuote;
  final Project? projectToQuote;
  final bool isComment;
  final bool isReply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(
      mentionSuggestionsProvider.select(
        (s) => s,
      ),
    );
    final hashtagsSuggestions = ref.watch(
      hashtagsSuggestionsProvider.select(
        (s) => s,
      ),
    );
    final data = ref.watch(
      postDetailProvider(
        id,
        rootPost,
        PostType.regular,
      ),
    );
    final hasDraft = ref.watch(
      hasPostDraftProvider(
        TTexts.postDraft,
      ),
    );
    final postState = ref.watch(
      postCreationProvider(
        data.value?.post,
      ),
    );
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
    final isProjectQuote = projectToQuote != null;
    final isPostQuote = postToQuote != null;
    final scheduledDateTimeState = ref.watch(
      postScheduledDateTimeProvider.select((dt) => dt),
    );
    Future<void> saveDraftAndPop() async {
      await postNotifier.savePostAsDraft(
        data.value?.post.id,
        null,
      );
      if (context.mounted) context.pop();
    }

    Future<void> handlePopAttempt() async {
      if (canSendPost &&
          !isProjectQuote &&
          !isPostQuote &&
          !isReply &&
          !isComment) {
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
                if (isProjectQuote) {
                  await postNotifier.repostOrQuote(
                    data.value?.post.id,
                    projectToQuote?.id,
                  );
                } else if (isPostQuote) {
                  await postNotifier.quotePost(
                    postToQuote!.id!,
                  );
                } else if (isComment) {
                  await postNotifier.sendComment(
                    data.value?.post.parentId ?? 0,
                    data.value?.post.id,
                  );
                } else if (isReply) {
                  await postNotifier.sendReply(
                    data.value?.post.parentId ?? 0,
                    data.value?.post.id,
                  );
                } else {
                  await postNotifier.send(id);
                }
              },
              title: const CreateContentPrivacy(),
              sendText: isPostQuote || isProjectQuote ? 'QUOTE' : null,
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
                project: projectToQuote,
                isReplyOrComment: isReply || isComment,
                isQuote: isPostQuote || isProjectQuote,
                postToQuote: postToQuote,
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
