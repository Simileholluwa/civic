import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class FeedHelperFunctions {
  FeedHelperFunctions._();

  static String humanizeNumber(int number) =>
      NumberFormat('#,##0').format(number);

  static double thresholdFor(Post post) {
    // Base by type
    double base;
    switch (post.postType) {
      case PostType.article:
        base = 0.35;
      case PostType.poll:
      case PostType.regular:
        base = 0.50;
      case PostType.projectQuote:
      case PostType.postQuote:
      case PostType.postRepost:
        base = 0.50;
      case PostType.comment:
      case PostType.commentReply:
        base = 0.60;
      case null:
        base = 0.50;
    }
    final textLen = (post.text ?? '').length;
    if (textLen > 800) {
      base = (base - 0.10).clamp(0.30, 0.60);
    } else if (textLen > 400) {
      base = (base - 0.05).clamp(0.30, 0.60);
    }
    return base;
  }

  static Duration dwellFor(Post post) {
    if (post.postType == PostType.poll) {
      return const Duration(seconds: 2);
    }
    final textLen = (post.text ?? '').length;
    if (textLen > 800) return const Duration(seconds: 2);
    return const Duration(seconds: 1);
  }

  static Future<bool?> deletePostDialog(
    BuildContext context,
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

  static Future<bool?> undoRepost(
    BuildContext context,
  ) {
    return postDialog(
      context: context,
      title: 'Undo repost',
      description: 'Are you sure want to undo your repost?',
      onTapSkipButton: () => context.pop(false),
      activeButtonText: 'Undo repost',
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
