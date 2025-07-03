// ignore_for_file: use_build_context_synchronously

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({
    super.key,
    required this.id,
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
      postDetailProvider(id, 'postDraft', post),
    );
    final postState = ref.watch(
      feedProvider(
        data.value,
      ),
    );
    final postNotifier = ref.watch(
      feedProvider(
        data.value,
      ).notifier,
    );
    final canSendPost = postState.imageUrls.isNotEmpty ||
        postState.text.isNotEmpty ||
        postState.videoUrl.isNotEmpty;
    final isRepost = project != null;
    bool isReplyOrComment = false;
    bool isComment = false;
    bool isReply = false;
    String username = '';
    if (data.hasValue && !data.hasError) {
      isReplyOrComment = parent != null;
      if (isReplyOrComment) {
        isComment = (parent!.postType == PostType.regular ||
            parent!.postType == PostType.projectRepost ||
            parent!.postType == PostType.poll ||
            parent!.postType == PostType.article);

        isReply = parent!.postType == PostType.comment;
        username = parent!.owner!.userInfo!.userName!;
      }
    }
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
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
                PostType.regular,
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
                        data.value?.id,
                        project?.id,
                      )
                    : isReplyOrComment
                        ? isComment
                            ? await postNotifier.sendComment(
                                parent!.id!,
                                data.value?.id,
                              )
                            : await postNotifier.sendReply(
                                parent!.id!,
                                data.value?.id,
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
                        PostType.regular,
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
              if (scheduledDateTimeState != null) {
                return const CreateContentSchedule();
              } else if (parent != null) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: ContentExpandableText(
                    text: isComment
                        ? "Commenting on @$username's post"
                        : isReply
                            ? "Replying to @$username's comment"
                            : "Replying to @$username's reply",
                    onToggleTextTap: null,
                  ),
                );
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
              final err = error as Map<String, dynamic>;
              return LoadingError(
                retry: null,
                imageString: TImageTexts.error,
                mainAxisAlignment: MainAxisAlignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                errorMessage: err['message'],
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
