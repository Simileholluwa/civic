// ignore_for_file: use_build_context_synchronously
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreatePollScreen extends ConsumerWidget {
  const CreatePollScreen({
    super.key,
    required this.id,
    required this.poll,
  });

  final Poll? poll;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final data = poll == null
        ? ref.watch(
            pollDetailProvider(
              id,
            ),
          )
        : AsyncValue.data(
            poll,
          );
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final pollState = ref.watch(
      pollsOptionsProvider(
        data.value,
      ),
    );
    final pollNotifier = ref.watch(
      pollsOptionsProvider(
        data.value,
      ).notifier,
    );
    final canSendPoll = pollState.question.isNotEmpty &&
        pollState.optionText.every((text) => text.isNotEmpty);
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
            ? await savePollDraftDialog(ref, context, data.value!)
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
                await pollNotifier.send(
                  id,
                );
              },
              title: CreateContentPrivacy(),
              onCanSendPost: () async {
                final bool? shouldPop = canSendPoll
                    ? await savePollDraftDialog(ref, context, data.value!)
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
                    pollState.questionController,
                  ),
                )
              : hashtagsSuggestions.isNotEmpty
                  ? HashtagSuggestionsWidget(
                      onSuggestionSelected: (suggestion) =>
                          THelperFunctions.onSuggestionSelected(
                        ref,
                        suggestion,
                        pollState.questionController,
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
                      ref.invalidate(pollDetailProvider);
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
            data: (poll) {
              if (poll == null) {
                return const Center(
                  child: Text('Poll not found'),
                );
              }
              return CreatePollWidget(
                poll: poll,
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
