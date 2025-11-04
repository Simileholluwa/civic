class AppNotificationSettings {
  AppNotificationSettings({
    this.pushNotifications = false,
    this.comments = const NotificationPreference(),
    this.likes = const NotificationPreference(),
    this.mentions = const NotificationPreference(),
    this.tags = const NotificationPreference(),
    this.follows = const NotificationPreference(),
    this.projectReviewReactions = const NotificationPreference(),
    this.helpfulProjectReviews = const NotificationPreference(),
    this.projectVettingReactions = const NotificationPreference(),
    this.projectReviews = const NotificationPreference(),
    this.projectVetting = const NotificationPreference(),
    this.projectQuotes = const NotificationPreference(),
  });

  final bool pushNotifications;
  final NotificationPreference comments;
  final NotificationPreference likes;
  final NotificationPreference mentions;
  final NotificationPreference tags;
  final NotificationPreference follows;
  final NotificationPreference projectReviewReactions;
  final NotificationPreference helpfulProjectReviews;
  final NotificationPreference projectVettingReactions;
  final NotificationPreference projectReviews;
  final NotificationPreference projectVetting;
  final NotificationPreference projectQuotes;

  AppNotificationSettings copyWith({
    bool? pushNotifications,
    NotificationPreference? comments,
    NotificationPreference? likes,
    NotificationPreference? mentions,
    NotificationPreference? tags,
    NotificationPreference? follows,
    NotificationPreference? projectReviewReactions,
    NotificationPreference? helpfulProjectReviews,
    NotificationPreference? projectVettingReactions,
    NotificationPreference? projectReviews,
    NotificationPreference? projectVetting,
    NotificationPreference? projectQuotes,
  }) {
    return AppNotificationSettings(
      pushNotifications: pushNotifications ?? this.pushNotifications,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      follows: follows ?? this.follows,
      projectReviewReactions:
          projectReviewReactions ?? this.projectReviewReactions,
      helpfulProjectReviews:
          helpfulProjectReviews ?? this.helpfulProjectReviews,
      projectVettingReactions:
          projectVettingReactions ?? this.projectVettingReactions,
      projectReviews: projectReviews ?? this.projectReviews,
      projectVetting: projectVetting ?? this.projectVetting,
      projectQuotes: projectQuotes ?? this.projectQuotes,
    );
  }
}

class NotificationPreference {
  const NotificationPreference({
    this.inApp = true,
    this.push = true,
  });

  final bool inApp;
  final bool push;

  NotificationPreference copyWith({
    bool? inApp,
    bool? push,
  }) {
    return NotificationPreference(
      inApp: inApp ?? this.inApp,
      push: push ?? this.push,
    );
  }
}

enum NotificationSettingType {
  push,
  comments,
  likes,
  mentions,
  tags,
  follows,
  projectReviewReactions,
  helpfulProjectReviews,
  projectVettingReactions,
  projectReviews,
  projectVetting,
  projectQuotes,
}

class NotificationSettingsUpdate {
  NotificationSettingsUpdate({
    required this.settingType,
    this.preference,
    this.enabled,
  });

  final NotificationSettingType settingType;
  final NotificationPreference? preference;
  final bool? enabled;
}
