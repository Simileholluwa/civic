import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
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

  static Future<bool?> clearBookmarksDialog(
    BuildContext context,
  ) {
    return postDialog(
      context: context,
      title: TTexts.clearAllBookmarksTitle,
      description: TTexts.clearAllBookmarksSubtitle,
      onTapSkipButton: () {
        context.pop(false);
      },
      activeButtonText: TTexts.deleteAll,
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: TTexts.cancel,
      onTapActiveButton: () async {
        if (context.mounted) {
          context.pop(true);
        }
      },
    );
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

    if (days > 0) {
      return ' • $days${days == 1 ? TTexts.day : TTexts.days}${TTexts.left}';
    }
    if (hours > 0) {
      return ' • $hours${hours == 1 ? TTexts.hour : TTexts.hours} ${minutes}m${TTexts.left}';
    }
    if (minutes > 0) {
      return ' • $minutes${minutes == 1 ? TTexts.minute : TTexts.minutes}${TTexts.left}';
    }
    return TTexts.pollEndsSoon;
  }
}
