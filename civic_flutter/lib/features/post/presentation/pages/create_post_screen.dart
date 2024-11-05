// ignore_for_file: use_build_context_synchronously

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_appbar.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_edit_post_draft_dialog.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_save_post_draft_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_detail_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/hastags_suggestions_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/mentions_suggestions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_bottom_navigation.dart';

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({
    super.key,
    required this.id,
    required this.draft,
  });

  final int id;
  final DraftPost? draft;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = THelperFunctions.isDarkMode(context);
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
        postState.videoUrl.isNotEmpty;
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSendPost
            ? id == 0
                ? await createContentSavePostDraftDialog(
                    ref,
                    context,
                    data.value!,
                  )
                : await createContentEditPostDraftDialog(
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
                      .read(
                          mediaVideoPlayerProvider(postState.videoUrl).notifier)
                      .dispose();
                }
                context.go(
                  FeedRoutes.namespace,
                  extra: () => THelperFunctions.sendPost(
                    ref,
                    id != 0
                        ? Post(
                            id: data.value!.id,
                            ownerId: data.value!.ownerId,
                            postType: PostType.none,
                            text: postState.text,
                            imageUrls: postState.imageUrls,
                            videoUrl: postState.videoUrl,
                            taggedUsers: postState.taggedUsers,
                            locations: postState.locations,
                            mentions: ref.watch(selectedMentionsProvider),
                            tags: ref.watch(hashtagsProvider),
                          )
                        : Post(
                            id: null,
                            ownerId: 0,
                            postType: PostType.none,
                            text: postState.text,
                            imageUrls: postState.imageUrls,
                            videoUrl: postState.videoUrl,
                            taggedUsers: postState.taggedUsers,
                            locations: postState.locations,
                            mentions: ref.watch(selectedMentionsProvider),
                            tags: ref.watch(hashtagsProvider),
                          ),
                  ),
                );
              },
              onCanSendPost: () async {
                final shouldPop = id == 0
                    ? await createContentSavePostDraftDialog(
                        ref,
                        context,
                        data.value!,
                      )
                    : await createContentEditPostDraftDialog(
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
              draftPressed: (){ 
                ref.invalidate(postDraftsProvider);
                  THelperFunctions.showPostDraftsScreen(context);
                  }
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
