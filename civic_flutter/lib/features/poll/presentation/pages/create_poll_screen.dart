import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_appbar.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_save_poll_draft_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_detail_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/create_poll_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/hastags_suggestions_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/mentions_suggestions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreatePollScreen extends ConsumerWidget {
  const CreatePollScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = THelperFunctions.isDarkMode(context);
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final pollState = ref.watch(pollsOptionsProvider);
    final draftsData = ref.watch(pollDraftsProvider);
    final canSendPoll = pollState.question.isNotEmpty &&
        pollState.optionText.every((text) => text.isNotEmpty);
    final data = ref.watch(pollDetailProvider(id));

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSendPoll ? await createContentSavePollDraftDialog(ref, context) : true;
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
                  extra: () => THelperFunctions.sendPoll(
                    ref,
                  ),
                );
              },
              onCanSendPost: () async {
                  final shouldPop = await createContentSavePollDraftDialog(ref, context);
                  if (shouldPop ?? false) {
                    if (context.mounted) context.pop();
                  }
                },
              draftPressed: () =>
                  THelperFunctions.showPollDraftsScreen(context),
            ),
          ),
          bottomSheet: suggestions.isNotEmpty
              ? MentionsSuggestionsWidget(
                  onSuggestionSelected: (suggestion) =>
                      THelperFunctions.onSuggestionSelected(
                    ref,
                    suggestion,
                  ),
                )
              : hashtagsSuggestions.isNotEmpty
                  ? HashtagSuggestionsWidget(
                      onSuggestionSelected: (suggestion) =>
                          THelperFunctions.onSuggestionSelected(
                        ref,
                        suggestion,
                      ),
                    )
                  : null,
          // bottomNavigationBar:
          //     (data.isLoading || data.hasError || data.value == null)
          //         ? const SizedBox()
          //         : const PostBottomNavigation(
          //             showSelectMedia: false,
          //             maxLength: 300,
          //           ),
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
