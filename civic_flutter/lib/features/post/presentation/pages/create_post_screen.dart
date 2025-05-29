// ignore_for_file: use_build_context_synchronously

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({
    super.key,
    required this.id,
    required this.project,
    required this.parent,
  });

  final int id;
  final Project? project;
  final Post? parent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final data = ref.watch(
      postDetailProvider(id),
    );
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
    final canSendPost = postState.imageUrls.isNotEmpty ||
        postState.text.isNotEmpty ||
        postState.videoUrl.isNotEmpty;
    final isRepost = project != null || parent != null;
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final isVisibleNotifier = ref.watch(
      appBottomNavigationVisibilityProvider(
        null,
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
        final bool? shouldPop = canSendPost
            ? await savePostDraftDialog(
                ref,
                context,
                data.value!,
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
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: canSendPost,
              sendPressed: () async {
                context.pop();
                isRepost
                    ? await postNotifier.repostOrQuote(
                        parent?.id,
                        project?.id,
                      )
                    : await postNotifier.send(
                        id,
                      );
              },
              title: CreateContentPrivacy(),
              sendText: isRepost ? 'REPOST' : null,
              onCanSendPost: () async {
                final shouldPop = canSendPost
                    ? await savePostDraftDialog(
                        ref,
                        context,
                        data.value!,
                      )
                    : true;
                if (shouldPop ?? false) {
                  if (context.mounted) {
                    context.pop();
                  }
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
              return scheduledDateTimeState == null
                  ? null
                  : SizedBox(
                      height: 55,
                      child: const CreateContentSchedule(),
                    );
            },
            error: (err, st) {
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
            },
            loading: () {
              return null;
            },
          ),
          body: data.when(
            data: (post) {
              return CreatePostWidget(
                post: post,
                project: project,
                parent: parent,
              );
            },
            error: (error, st) {
              return LoadingError(
                retry: null,
                imageString: TImageTexts.error,
                mainAxisAlignment: MainAxisAlignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                errorMessage: error.toString(),
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
