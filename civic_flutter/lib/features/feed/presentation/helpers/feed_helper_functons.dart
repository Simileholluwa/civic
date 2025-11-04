import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class FeedHelperFunctions {
  FeedHelperFunctions._();

  static Future<bool?> deletePostDialog(
    BuildContext context,
    int postId,
  ) {
    return postDialog(
      context: context,
      title: TTexts.deletePostTitle,
      description: TTexts.deletePostSubtitle,
      onTapSkipButton: () => context.pop(false),
      activeButtonText: TTexts.delete,
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: TTexts.cancel,
      onTapActiveButton: () => context.pop(true),
    );
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
        return LocationsScreen(
          post: post,
        );
      },
    );
  }

  static Future<bool?> clearBookmarksDialog(
    WidgetRef ref,
    BuildContext context,
  ) {
    return postDialog(
      context: context,
      title: TTexts.clearAllBookmarksTitle,
      description: TTexts.clearAllBookmarksSubtitle,
      onTapSkipButton: () {
        context.pop();
      },
      activeButtonText: TTexts.deleteAll,
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: TTexts.cancel,
      onTapActiveButton: () async {
        if (context.mounted) {
          context.pop();
        }
        await ref
            .read(paginatedPostBookmarkListProvider.notifier)
            .clearBookmarksList();
      },
    );
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
        return TagUsersScreen(
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
      TToastMessages.infoToast(TTexts.locationServicesDisabled);
    }
    await Geolocator.requestPermission();
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (context.mounted) {
        await appRequestLocationPremissionDialog(context: context);
      }
    } else if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    } else {
      if (context.mounted) {
        await selectLocationBottomSheet(
          context: context,
          post: post,
        );
      }
    }
  }

  static Future<bool?> deletePollDialog(
    BuildContext context,
    int pollId,
  ) {
    return postDialog(
      context: context,
      title: TTexts.deletePollTitle,
      description: TTexts.deletePostSubtitle,
      onTapSkipButton: () => context.pop(false),
      activeButtonText: TTexts.delete,
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: TTexts.cancel,
      onTapActiveButton: () => context.pop(true),
    );
  }

  static String formatTimeLeft(DateTime expiresAt) {
    final now = DateTime.now();
    final timeLeft = expiresAt.difference(now);
    if (timeLeft.isNegative) return TTexts.pollEnded;

    final days = timeLeft.inDays;
    final hours = timeLeft.inHours % 24;
    final minutes = timeLeft.inMinutes % 60;

    if (days > 0) return ' • $days${days == 1 ? TTexts.day : TTexts.days}${TTexts.left}';
    if (hours > 0) {
      return ' • $hours${hours == 1 ? TTexts.hour : TTexts.hours} ${minutes}m${TTexts.left}';
    }
    if (minutes > 0) return ' • $minutes${minutes == 1 ? TTexts.minute : TTexts.minutes}${TTexts.left}';

    return TTexts.pollEndsSoon;
  }

  static List<String> getAllImagesFromEditor(String content) {
    final imageUrls = <String>[];
    // Convert the document to JSON

    final jsonDocument = jsonDecode(
      content,
    ) as List<Map<String, Map<String, String>>>;

    // Loop through the document's operations
    for (final operation in jsonDocument) {
      if (operation['insert'] is Map && operation['insert'] != null) {
        if (operation['insert']!.containsKey('image')) {
          // Add the image URL to the list
          final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
          if (!operation['insert']!['image'].toString().startsWith(regex)) {
            imageUrls.add(operation['insert']!['image']!);
          }
        }
      }
    }

    return imageUrls;
  }

  static Map<String, String> mapEmbededImages(
    List<String> oldPath,
    List<String> newPath,
  ) {
    return {for (int i = 0; i < oldPath.length; i++) oldPath[i]: newPath[i]};
  }

  static String modifyArticleContent(
    String content,
    Map<String, String> pathReplacements,
  ) {
    // Convert document to JSON
    final documentJson = jsonDecode(
      content,
    ) as List<Map<String, Map<String, String>>>;

    // Update the JSON with new image paths
    for (final block in documentJson) {
      if (block.containsKey('insert')) {
        final insert = block['insert'];

        // Check if the block is an image
        if (insert is Map && insert != null) {
          if (insert.containsKey('image')) {
            final oldPath = insert['image']!;

            // If the image path has a replacement, update it
            if (pathReplacements.containsKey(oldPath)) {
              insert['image'] = pathReplacements[oldPath]!;
            }
          }
        }
      }
    }

    return jsonEncode(documentJson);
  }
}
