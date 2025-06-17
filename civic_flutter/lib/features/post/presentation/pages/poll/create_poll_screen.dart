// ignore_for_file: use_build_context_synchronously
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreatePollScreen extends ConsumerWidget {
  const CreatePollScreen({
    super.key,
    required this.id,
    required this.post,
  });

  final Post? post;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final data = post == null
        ? ref.watch(
            postDetailProvider(id, 'pollDraft', PostType.poll),
          )
        : AsyncValue.data(
            post,
          );
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final postState = ref.watch(
      regularPostProvider(
        data.value,
      ),
    );
    final postNotifier = ref.watch(
      regularPostProvider(
        data.value,
      ).notifier,
    );
    final canSendPoll = postState.text.isNotEmpty &&
        postState.optionText.every((text) => text.isNotEmpty);
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final isVisibleNotifier = ref.watch(
      appBottomNavigationVisibilityProvider(
        false,
      ).notifier,
    );
    Future.delayed(
      Duration.zero,
      () => isVisibleNotifier.hide(),
    );
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSendPoll
            ? await savePostDraftDialog(ref, context, data.value!)
            : true;
        if (shouldPop ?? false) {
          if (context.mounted) {
            context.pop();
          }
        }
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: canSendPoll,
              sendPressed: () async {
                context.pop();
                await postNotifier.sendAPoll(
                  data.value?.id, data.value?.pollId
                );
              },
              title: CreateContentPrivacy(),
              onCanSendPost: () async {
                final bool? shouldPop = canSendPoll
                    ? await savePostDraftDialog(ref, context, data.value!)
                    : true;
                if (shouldPop ?? false) {
                  if (context.mounted) context.pop();
                }
              },
            ),
          ),
          bottomSheet: suggestions.isNotEmpty
              ? MentionsSuggestionsWidget(
                  onSuggestionSelected: (suggestion) =>
                      THelperFunctions.onSuggestionSelected(
                    ref,
                    suggestion,
                    postState.controller,
                  ),
                )
              : hashtagsSuggestions.isNotEmpty
                  ? HashtagSuggestionsWidget(
                      onSuggestionSelected: (suggestion) =>
                          THelperFunctions.onSuggestionSelected(
                        ref,
                        suggestion,
                        postState.controller,
                      ),
                    )
                  : null,
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
              if (value == null) {
                return const Center(
                  child: Text('Poll not found'),
                );
              }
              return CreatePollWidget(
                post: value,
                isEditing: data.value?.id != null,
              );
            },
            error: (error, st) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
            loading: () {
              return AppLoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
