import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/content_dialog.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_detail_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_send_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/hastags_suggestions_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/mentions_suggestions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_bottom_navigation.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
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
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  void sendPost() async {
    final media = ref.watch(mediaProvider);
    final videoUrl = media.isEmpty
        ? ''
        : THelperFunctions.isVideo(media.first)
            ? media.first
            : '';
    final imageUrls = media.isEmpty
        ? <String>[]
        : THelperFunctions.isImage(media.first)
            ? media
            : <String>[];
    final taggedUsers = ref.watch(tagSelectionsProvider);
    await ref.read(sendPostProvider.notifier).sendPost(
          text: ref.watch(postTextProvider).text,
          imagePath: imageUrls,
          videoPath: videoUrl,
          taggedUsers: taggedUsers,
          locations: ref.watch(selectLocationsProvider),
          postType: THelperFunctions.determinePostType(
            text: ref.watch(postTextProvider).text,
            pickedImages: imageUrls,
            pickedVideo: videoUrl,
          ),
          mentions: ref.watch(selectedMentionsProvider),
          tags: ref.watch(hashtagsProvider),
        );
  }

  Future<bool?> saveDraftDialog(
    BuildContext context,
  ) =>
      postDialog(
        context: context,
        title: 'Save post as draft?',
        description: 'Draft post will be saved in drafts for '
            'a maximum of 10 days.',
        onTapSkipButton: () {
          context.go(
            FeedRoutes.namespace,
            extra: null,
          );
          ref.read(mediaVideoPlayerProvider.notifier).dispose();
        },
        activeButtonText: 'Save as draft',
        activeButtonLoading: false,
        skipButtonLoading: false,
        skipText: "Don't save",
        onTapActiveButton: () async {
          if (context.mounted) {
            context.go(
              FeedRoutes.namespace,
              extra: null,
            );
          }
          final taggedUsers = ref.watch(tagSelectionsProvider);
          ref.read(mediaVideoPlayerProvider.notifier).dispose();
          final media = ref.watch(mediaProvider);
          final videoUrl = media.isEmpty
              ? ''
              : THelperFunctions.isVideo(media.first)
                  ? media.first
                  : '';
          final imageUrls = media.isEmpty
              ? <String>[]
              : THelperFunctions.isImage(media.first)
                  ? media
                  : <String>[];
          final result =
              await ref.read(postDraftsProvider.notifier).saveDraftPost(
                    DraftPost(
                      draftId: DateTime.now().millisecondsSinceEpoch,
                      postType: THelperFunctions.determinePostType(
                        text: ref.watch(postTextProvider).text,
                        pickedImages: imageUrls,
                        pickedVideo: videoUrl,
                      ),
                      text: ref.watch(postTextProvider).text,
                      imagesPath: imageUrls,
                      videoPath: videoUrl,
                      taggedUsers: taggedUsers,
                      locations: ref.watch(selectLocationsProvider),
                      createdAt: DateTime.now(),
                      mentions: ref.watch(selectedMentionsProvider),
                      tags: ref.watch(hashtagsProvider),
                    ),
                  );
          if (result) {
            TToastMessages.successToast(
              'Your post has been saved as draft.',
            );
          }
        },
      );

  void _onSuggestionSelected(
    String suggestion,
  ) {
    final text = ref.watch(postTextProvider).text;
    final textController = ref.watch(postTextProvider);
    final cursorIndex = textController.selection.baseOffset;

    // Find the word to replace, ensuring it's the last mention/hashtag typed
    final textBeforeCursor = text.substring(0, cursorIndex);
    final textAfterCursor = text.substring(cursorIndex);

    final lastWordMatch = RegExp(r'[@#][\w]*$').firstMatch(textBeforeCursor);
    if (lastWordMatch != null) {
      final start = lastWordMatch.start;
      final end = lastWordMatch.end;

      // Replace the mention/hashtag in the text
      final newText = textBeforeCursor.replaceRange(start, end, suggestion) +
          textAfterCursor;
      textController.text = newText;

      // Move the cursor to the end of the inserted suggestion
      textController.selection = TextSelection.fromPosition(
          TextPosition(offset: start + suggestion.length));

      ref.read(postTextProvider).text = newText;
      ref
          .read(mentionSuggestionsProvider.notifier)
          .setSuggestions(<UserRecord>[]);
      ref
          .read(
        hashtagsSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <String>[],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final suggestions = ref.watch(mentionSuggestionsProvider);
    final hashtagsSuggestions = ref.watch(hashtagsSuggestionsProvider);
    final data = ref.watch(
      postDetailProvider(
        widget.id,
        widget.isDraft,
        widget.draftPost,
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
        final bool? shouldPop =
            canSendPost ? await saveDraftDialog(context) : true;
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
                          final shouldPop = await saveDraftDialog(context);
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
                                extra: sendPost,
                              );
                              ref
                                  .read(mediaVideoPlayerProvider.notifier)
                                  .dispose();
                            },
                      child: Text(
                        'POST',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: !canSendPost ? null : TColors.primary,
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
                  onSuggestionSelected: _onSuggestionSelected,
                )
              : hashtagsSuggestions.isNotEmpty
                  ? HashtagSuggestionsWidget(
                      onSuggestionSelected: _onSuggestionSelected,
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
