import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class PostHelperFunctions {
  PostHelperFunctions._();

  static double getBottomNavigationBarHeight(
    DateTime? scheduledDateTimeState,
    List<AWSPlaces> selectedLocations,
  ) {
    return scheduledDateTimeState == null && selectedLocations.isEmpty
        ? 55
        : scheduledDateTimeState == null && selectedLocations.isNotEmpty
            ? 105
            : scheduledDateTimeState != null && selectedLocations.isNotEmpty
                ? 155
                : 105;
  }

  static Future<bool?> selectLocationBottomSheet({
    required BuildContext context,
    required Post post,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .7,
        minHeight: MediaQuery.sizeOf(context).height * .5,
      ),
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      builder: (context) {
        return PostLocationsScreen(
          post: post,
        );
      },
    );
  }

  static Future<bool?> showPostDraftsScreen(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return const PostDraftsScreen();
      },
    );
  }

  static void sendPost(
    WidgetRef ref,
    PostState postState,
    int id,
    Post post,
    int? projectId,
  ) async {
    await ref.read(regularPostProvider(
      post,
    ).notifier).send(
          post: id != 0
              ? postToSend(
                  id,
                  post.owner!.id!,
                  postState,
                  ref,
                  projectId,
                )
              : postToSend(
                  null,
                  post.owner!.id!,
                  postState,
                  ref,
                  projectId,
                ),
          isProjectRepost: projectId != null,
          projectId: projectId,
        );
  }

  static Future<bool?> deletePostDraftsDialog(
      BuildContext context, WidgetRef ref) {
    return postDialog(
      context: context,
      title: 'Delete all drafts?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result =
            await ref.read(postDraftsProvider.notifier).deleteAllDrafts();
        if (result) {
          if (context.mounted) context.pop();
        }
        TToastMessages.successToast('All drafts was deleted');
      },
    );
  }

  static PostType determinePostType({
    required String text,
    required List<String> pickedImages,
    required String pickedVideo,
  }) {
    if (pickedVideo.isNotEmpty && text.isNotEmpty) {
      return PostType.textWithVideo;
    } else if (pickedVideo.isNotEmpty) {
      return PostType.video;
    } else if (pickedImages.isNotEmpty &&
        pickedImages.length > 1 &&
        text.isNotEmpty) {
      return PostType.textWithImages;
    } else if (pickedImages.isNotEmpty && pickedImages.length > 1) {
      return PostType.images;
    } else if (pickedImages.isNotEmpty &&
        pickedImages.length == 1 &&
        text.isNotEmpty) {
      return PostType.textWithImage;
    } else if (pickedImages.isNotEmpty && pickedImages.length == 1) {
      return PostType.image;
    } else if (text.isNotEmpty) {
      return PostType.text;
    } else {
      return PostType.none;
    }
  }

  static Future<bool?> tagUsersBottomSheet(
    BuildContext context,
    Post post,
  ) {
    return showModalBottomSheet<bool>(
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .7,
        minHeight: MediaQuery.sizeOf(context).height * .5,
      ),
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      builder: (context) {
        return PostTagUsersScreen(
          post: post,
        );
      },
    );
  }

  static Future<void> selectLocation(
    BuildContext context,
    Post post,
  ) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      TToastMessages.infoToast('Location services are disabled on your device');
    }
    await Geolocator.requestPermission();
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (context.mounted) {
        await appRequestLocationPremissionDialog(context: context);
      }
    } else if (permission == LocationPermission.deniedForever) {
      Geolocator.openLocationSettings();
    } else {
      if (context.mounted) {
        selectLocationBottomSheet(context: context, post: post);
      }
    }
  }

  static Post createPostFromDraftPost(
    DraftPost draftPost,
    Ref ref,
  ) {
    final userId = ref.watch(localStorageProvider).getInt('userId');
    return Post(
      ownerId: userId!,
      postType: PostType.none,
      text: draftPost.text,
      imageUrls: draftPost.imagesPath,
      videoUrl: draftPost.videoPath,
      taggedUsers: draftPost.taggedUsers,
      locations: draftPost.locations,
      mentions: draftPost.mentions,
      tags: draftPost.tags,
    );
  }

  static Post sendPostFromDraft(DraftPost draftPost) {
    return Post(
      ownerId: 0,
      postType: determinePostType(
        text: draftPost.text,
        pickedImages: draftPost.imagesPath,
        pickedVideo: draftPost.videoPath,
      ),
      text: draftPost.text,
      imageUrls: draftPost.imagesPath,
      videoUrl: draftPost.videoPath,
      taggedUsers: draftPost.taggedUsers,
      locations: draftPost.locations,
      mentions: draftPost.mentions,
      tags: draftPost.tags,
    );
  }

  static DraftPost createDraftPostFromPost(Post post) {
    return DraftPost(
      postType: determinePostType(
        text: post.text ?? '',
        pickedImages: post.imageUrls ?? [],
        pickedVideo: post.videoUrl ?? '',
      ),
      text: post.text ?? '',
      imagesPath: post.imageUrls ?? [],
      videoPath: post.videoUrl ?? '',
      taggedUsers: post.taggedUsers ?? [],
      locations: post.locations ?? [],
      mentions: post.mentions ?? [],
      tags: post.tags ?? [],
    );
  }

  static DraftPost createDraftPostFromPoststate(
    PostState postState,
    WidgetRef ref,
  ) {
    return DraftPost(
      draftId: DateTime.now().millisecondsSinceEpoch,
      postType: determinePostType(
        text: postState.text,
        pickedImages: postState.imageUrls,
        pickedVideo: postState.videoUrl,
      ),
      text: postState.text,
      imagesPath: postState.imageUrls,
      videoPath: postState.videoUrl,
      taggedUsers: postState.taggedUsers,
      locations: postState.locations,
      createdAt: DateTime.now(),
      mentions: ref.watch(selectedMentionsProvider),
      tags: ref.watch(hashtagsProvider(postState.text)),
    );
  }

  static Post postToSend(
    int? id,
    int ownerId,
    PostState postState,
    WidgetRef ref,
    int? projectId,
  ) {
    return Post(
      id: id,
      ownerId: ownerId,
      postType: PostType.none,
      text: postState.text,
      imageUrls: postState.imageUrls,
      videoUrl: postState.videoUrl,
      taggedUsers: postState.taggedUsers,
      locations: postState.locations,
      mentions: ref.watch(selectedMentionsProvider),
      tags: ref.watch(hashtagsProvider(postState.text)),
      isProjectRepost: projectId != null,
      projectId: projectId,
    );
  }
}
