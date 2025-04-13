// ignore_for_file: use_build_context_synchronously
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({
    super.key,
    required this.id,
    required this.project,
    required this.draft,
  });

  final int id;
  final Project? project;
  final DraftPost? draft;

  static String routePath([int? id]) => '${id ?? ':id'}/create';
  static String routeName() => 'post/create';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final data = ref.watch(
      postDetailProvider(draft, id),
    );
    final postState = ref.watch(
      regularPostProvider(
        data.value,
      ),
    );
    final draftsData = id == 0 ? ref.watch(postDraftsProvider) : [];
    final canSendPost = postState.imageUrls.isNotEmpty ||
        postState.text.isNotEmpty ||
        postState.videoUrl.isNotEmpty ||
        project != null;
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSendPost
            ? id == 0
                ? await savePostDraftDialog(
                    ref,
                    context,
                    postState,
                  )
                : await editPostDialog(
                    ref,
                    context,
                    data.value!,
                  )
            : true;
        if (shouldPop ?? false) {
          if (context.mounted) {
            if (postState.videoUrl.isNotEmpty) {
              ref
                  .read(mediaVideoPlayerProvider(postState.videoUrl).notifier)
                  .dispose();
            }
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
                draftData: draftsData,
                sendPressed: () {
                  if (postState.videoUrl.isNotEmpty) {
                    ref
                        .read(mediaVideoPlayerProvider(postState.videoUrl)
                            .notifier)
                        .dispose();
                  }
                  PostHelperFunctions.sendPost(
                    ref,
                    postState,
                    id,
                    data.value!,
                    project?.id,
                  );
                  context.pop();
                },
                isRepost: project != null,
                onCanSendPost: () async {
                  final shouldPop = id == 0
                      ? await savePostDraftDialog(
                          ref,
                          context,
                          postState,
                        )
                      : await editPostDialog(
                          ref,
                          context,
                          data.value!,
                        );
                  if (shouldPop ?? false) {
                    if (context.mounted) {
                      if (postState.videoUrl.isNotEmpty) {
                        ref
                            .read(mediaVideoPlayerProvider(postState.videoUrl)
                                .notifier)
                            .dispose();
                      }
                      context.pop();
                    }
                  }
                },
                draftPressed: () {
                  ref.invalidate(postDraftsProvider);
                  PostHelperFunctions.showPostDraftsScreen(context);
                }),
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
          bottomNavigationBar:
              (data.isLoading || data.hasError || data.value == null)
                  ? const SizedBox()
                  : PostBottomNavigation(post: data.value!),
          body: data.when(
            data: (post) {
              if (post == null) {
                return const Center(
                  child: Text('Post not found'),
                );
              }
              return CreatePostWidget(
                post: post,
                project: project,
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
