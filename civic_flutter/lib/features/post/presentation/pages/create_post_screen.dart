import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/save_post_draft_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_detail_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/hastags_suggestions_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/mentions_suggestions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_bottom_navigation.dart';

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({
    super.key,
    required this.id,
    required this.isDraft,
    this.draftPost,
  });

  final DraftPost? draftPost;
  final int id;
  final bool isDraft;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = THelperFunctions.isDarkMode(context);
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final data = ref.watch(
      postDetailProvider(
        id,
        isDraft,
        draftPost,
      ),
    );

    final draftsData = ref.watch(postDraftsProvider);
    final canSendPost = ref.watch(mediaProvider).isNotEmpty ||
        ref.watch(postTextProvider).text.isNotEmpty;
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = canSendPost
            ? await savePostDraftDialog(
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
      child: AndroidBottomNav(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: canSendPost
                      ? () async {
                          final shouldPop = await savePostDraftDialog(
                            ref,
                            context,
                          );
                          if (shouldPop ?? false) {
                            if (context.mounted) context.pop();
                          }
                        }
                      : () => context.pop(),
                  icon: const Icon(
                    Iconsax.arrow_left_2,
                  ),
                ),
                titleSpacing: 0,
                actions: [
                  Visibility(
                    visible: draftsData.isNotEmpty,
                    child: TextButton(
                      onPressed: () {
                        THelperFunctions.showPostDraftsScreen(context);
                      },
                      child: Text(
                        'DRAFTS',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: TColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: draftsData.isNotEmpty,
                    child: const SizedBox(
                      height: 20,
                      child: VerticalDivider(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: TSizes.sm,
                    ),
                    child: TextButton(
                      onPressed: !canSendPost
                          ? null
                          : () {
                              context.go(
                                FeedRoutes.namespace,
                                extra: () => THelperFunctions.sendPost(
                                  ref,
                                ),
                              );
                              ref
                                  .read(
                                    mediaVideoPlayerProvider.notifier,
                                  )
                                  .dispose();
                            },
                      child: Text(
                        'POST',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: !canSendPost ? Theme.of(context).disabledColor : TColors.primary,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
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
                  : const CreatePostBottomNavigation(),
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
