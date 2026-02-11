import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreatePollScreen extends ConsumerWidget {
  const CreatePollScreen({
    required this.id,
    required this.post,
    super.key,
  });

  final Post? post;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final data = ref.watch(
      postDetailProvider(id, post, PostType.poll),
    );
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final postState = ref.watch(
      postCreationProvider(
        data.value?.post,
      ),
    );
    final postNotifier = ref.read(
      postCreationProvider(
        data.value?.post,
      ).notifier,
    );
    final hasDraft = ref.watch(
      hasPostDraftProvider(TTexts.pollDraft),
    );
    final canSendPoll = postState.text.isNotEmpty &&
        postState.optionText.every((text) => text.isNotEmpty);
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);

    Future<void> saveDraftAndPop() async {
      await postNotifier.savePollAsDraft(
        data.value?.post.id,
        null,
      );
      if (context.mounted) context.pop();
    }

    Future<void> handlePopAttempt() async {
      if (canSendPoll) {
        final save = await savePostDraftDialog(
          context,
          PostType.poll,
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
          onSuggestionSelected: (suggestion) =>
              THelperFunctions.onSuggestionSelected(
            ref,
            suggestion,
            postState.controller,
          ),
        );
      }
      if (hashtagsSuggestions.isNotEmpty) {
        return HashtagSuggestionsWidget(
          onSuggestionSelected: (suggestion) =>
              THelperFunctions.onSuggestionSelected(
            ref,
            suggestion,
            postState.controller,
          ),
        );
      }
      return null;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        await handlePopAttempt();
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: canSendPoll,
              hasDraft: hasDraft.value ?? false,
              draftPressed: () async {
                final draft = await loadPostDrafts(
                  context,
                  TTexts.pollDraft,
                );
                if (draft is Post) {
                  postNotifier.loadFromDraft(draft);
                }
              },
              sendPressed: () async {
                context.pop();
                await postNotifier.sendAPoll(
                  data.value?.post.id,
                  data.value?.post.pollId,
                );
              },
              title: const CreateContentPrivacy(),
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
              return CreatePollWidget(
                post: value.post,
                isEditing: data.value?.post.id != null,
              );
            },
            error: (error, st) {
              final message = error is Map
                  ? (error['message']?.toString() ?? error.toString())
                  : error.toString();
              return Center(
                child: Text(message),
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
