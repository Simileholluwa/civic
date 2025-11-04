import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';

class NotificationTileData {
  NotificationTileData({
    required this.title,
    required this.subtitle,
    required this.type,
  });

  final String title;
  final String subtitle;
  final NotificationSettingType type;
}

final staticTilesData = [
  NotificationTileData(
    title: TTexts.follows,
    subtitle: TTexts.followsSubtitle,
    type: NotificationSettingType.follows,
  ),
  NotificationTileData(
    title: TTexts.likes,
    subtitle: TTexts.likesSubtitle,
    type: NotificationSettingType.likes,
  ),
  NotificationTileData(
    title: TTexts.comments,
    subtitle: TTexts.commentsSubtitle,
    type: NotificationSettingType.comments,
  ),
  NotificationTileData(
    title: TTexts.mentions,
    subtitle: TTexts.mentionsSubtitle,
    type: NotificationSettingType.mentions,
  ),
  NotificationTileData(
    title: TTexts.projectReviewsReactions,
    subtitle: TTexts.projectReviewsReactionsSubtitle,
    type: NotificationSettingType.projectReviewReactions,
  ),
  NotificationTileData(
    title: TTexts.helpfulProjectReviews,
    subtitle: TTexts.helpfulProjectReviewsSubtitle,
    type: NotificationSettingType.helpfulProjectReviews,
  ),
  NotificationTileData(
    title: TTexts.projectVettingReactions,
    subtitle: TTexts.projectVettingReactionsSubtitle,
    type: NotificationSettingType.projectVettingReactions,
  ),
  NotificationTileData(
    title: TTexts.tags,
    subtitle: TTexts.tagsSubtitle,
    type: NotificationSettingType.tags,
  ),
];

final leaderTilesData = [
  NotificationTileData(
    title: TTexts.projectReviews,
    subtitle: TTexts.projectReviewsSubtitle,
    type: NotificationSettingType.projectReviews,
  ),
  NotificationTileData(
    title: TTexts.projectVetting,
    subtitle: TTexts.projectVettingSubtitle,
    type: NotificationSettingType.projectVetting,
  ),
  NotificationTileData(
    title: TTexts.projectQuotesOrReposts,
    subtitle: TTexts.projectQuotesOrRepostsSubtitle,
    type: NotificationSettingType.projectQuotes,
  ),
];
