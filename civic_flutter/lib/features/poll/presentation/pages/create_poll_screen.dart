// ignore_for_file: use_build_context_synchronously
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_appbar.dart';
import 'package:civic_flutter/features/poll/presentation/helper/poll_helper_functions.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/edit_poll_dialog.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/save_poll_draft_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_detail_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/create_poll_widget.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/poll_bottom_navigation.dart';
import 'package:civic_flutter/features/post/presentation/widgets/hastags_suggestions_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/mentions_suggestions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreatePollScreen extends ConsumerWidget {
  const CreatePollScreen({
    super.key,
    required this.id,
    required this.draft,
  });

  final DraftPoll? draft;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = THelperFunctions.isDarkMode(context);
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final data = ref.watch(pollDetailProvider(draft, id));
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final pollState = ref.watch(pollsOptionsProvider(data.value));
    final draftsData = id == 0 ? ref.watch(pollDraftsProvider) : [];
    final canSendPoll = pollState.question.isNotEmpty &&
        pollState.optionText.every((text) => text.isNotEmpty);
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSendPoll
            ? id == 0
                ? await savePollDraftDialog(ref, context, data.value!)
                : await editPollDialog(
                    ref,
                    context,
                  )
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
              draftData: draftsData,
              sendPressed: () {
                context.go(
                  FeedRoutes.namespace,
                  extra: () => PollHelperFunctions.sendPoll(
                    ref,
                    data.value!,
                    id,
                  ),
                );
              },
              onCanSendPost: () async {
                final shouldPop = id == 0
                    ? await savePollDraftDialog(ref, context, data.value!)
                    : await editPollDialog(
                        ref,
                        context,
                      );
                if (shouldPop ?? false) {
                  if (context.mounted) context.pop();
                }
              },
              draftPressed: () =>
                  PollHelperFunctions.showPollDraftsScreen(context),
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
          bottomNavigationBar:
              (data.isLoading || data.hasError || data.value == null)
                  ? const SizedBox()
                  : PollBottomNavigation(
                      poll: data.value!,
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
              return AppLoadingWidget(
                backgroundColor: isDark ? TColors.dark : TColors.light,
              );
            },
          ),
        ),
      ),
    );
  }
}
