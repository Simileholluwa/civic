import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_settings_provider.g.dart';

@riverpod
class NotificationSettingsNotifier extends _$NotificationSettingsNotifier {
  @override
  AppNotificationSettings build(UserNotificationSettings? settings) {
    final initialSettings =
        settings == null ? AppNotificationSettings() : _mapToState(settings);

    final allowedNotification =
        ref.read(localStorageProvider).getBool('allowedNotification') ?? false;
    if (!allowedNotification) {
      return initialSettings.copyWith(pushNotifications: false);
    }

    final hasUpdatedOnce =
        ref.read(localStorageProvider).getBool('hasUpdatedOnce') ?? false;
    if (!hasUpdatedOnce) {
      unawaited(
        updateSetting(
          NotificationSettingsUpdate(
            settingType: NotificationSettingType.push,
            enabled: true,
          ),
        ),
      );
      unawaited(
        ref.read(localStorageProvider).setBool('hasUpdatedOnce', true),
      );
      return initialSettings.copyWith(pushNotifications: true);
    }

    return initialSettings;
  }

  Future<void> updateSetting(
    NotificationSettingsUpdate update,
  ) async {
    final newState = _updateState(state, update);
    final userId = ref
        .read(
          localStorageProvider,
        )
        .getInt('userId')!;
    final settingsToUpdate = _mapToEntity(
      newState,
      settings ?? UserNotificationSettings(userId: userId),
    );

    final result = await ref
        .read(
          updateUserNotificationSettingsProvider,
        )
        .call(
          UpdateUserNotificationSettingsParams(
            settingsToUpdate,
          ),
        );

    result.fold((l) {
      TToastMessages.errorToast(l.message);
      state = _mapToState(
        settings ??
            UserNotificationSettings(
              userId: userId,
            ),
      );
    }, (r) {
      state = _mapToState(r);
      TToastMessages.infoToast(
        'Your settings have been updated.',
      );
    });
  }

  Future<void> togglePushNotifications() async {
    final allowedNotification = ref
            .read(
              localStorageProvider,
            )
            .getBool('allowedNotification') ??
        false;
    if (!allowedNotification) {
      final fcm = ref.read(fcmServiceImplProvider);
      final res = await fcm.directPermissionRequest();
      if (res ?? false) {
        await updateSetting(
          NotificationSettingsUpdate(
            settingType: NotificationSettingType.push,
            enabled: true,
          ),
        );
      }
    } else {
      await updateSetting(
        NotificationSettingsUpdate(
          settingType: NotificationSettingType.push,
          enabled: !state.pushNotifications,
        ),
      );
    }
  }

  AppNotificationSettings _updateState(
    AppNotificationSettings current,
    NotificationSettingsUpdate update,
  ) {
    switch (update.settingType) {
      case NotificationSettingType.push:
        return current.copyWith(pushNotifications: update.enabled);
      case NotificationSettingType.follows:
        return current.copyWith(follows: update.preference);
      case NotificationSettingType.likes:
        return current.copyWith(likes: update.preference);
      case NotificationSettingType.comments:
        return current.copyWith(comments: update.preference);
      case NotificationSettingType.mentions:
        return current.copyWith(mentions: update.preference);
      case NotificationSettingType.tags:
        return current.copyWith(tags: update.preference);
      case NotificationSettingType.projectReviewReactions:
        return current.copyWith(projectReviewReactions: update.preference);
      case NotificationSettingType.helpfulProjectReviews:
        return current.copyWith(helpfulProjectReviews: update.preference);
      case NotificationSettingType.projectVettingReactions:
        return current.copyWith(projectVettingReactions: update.preference);
      case NotificationSettingType.projectReviews:
        return current.copyWith(projectReviews: update.preference);
      case NotificationSettingType.projectVetting:
        return current.copyWith(projectVetting: update.preference);
      case NotificationSettingType.projectQuotes:
        return current.copyWith(projectQuotes: update.preference);
    }
  }

  static AppNotificationSettings _mapToState(UserNotificationSettings entity) {
    return AppNotificationSettings(
      pushNotifications: !entity.pauseAllPush,
      follows: NotificationPreference(
        inApp: entity.allowNewFollowers,
        push: entity.pushNewFollowers,
      ),
      likes: NotificationPreference(
        inApp: entity.allowLikes,
        push: entity.pushLikes,
      ),
      comments: NotificationPreference(
        inApp: entity.allowComments,
        push: entity.pushComments,
      ),
      mentions: NotificationPreference(
        inApp: entity.allowMentions,
        push: entity.pushMentions,
      ),
      tags: NotificationPreference(
        inApp: entity.allowTags,
        push: entity.pushTags,
      ),
      projectReviewReactions: NotificationPreference(
        inApp: entity.allowReactions,
        push: entity.pushReactions,
      ),
      helpfulProjectReviews: NotificationPreference(
        inApp: entity.allowHelpfulReviews,
        push: entity.pushHelpfulReviews,
      ),
      projectVettingReactions: NotificationPreference(
        inApp: entity.allowNewVettings,
        push: entity.pushNewVettings,
      ),
      projectReviews: NotificationPreference(
        inApp: entity.allowNewReviews,
        push: entity.pushNewReviews,
      ),
      projectVetting: NotificationPreference(
        inApp: entity.allowNewVettings,
        push: entity.pushNewVettings,
      ),
      projectQuotes: NotificationPreference(
        inApp: entity.allowRepostsAndQuotes,
        push: entity.pushRepostsAndQuotes,
      ),
    );
  }

  static UserNotificationSettings _mapToEntity(
    AppNotificationSettings appSettings,
    UserNotificationSettings previousSetting,
  ) {
    return previousSetting.copyWith(
      pauseAllPush: !appSettings.pushNotifications,
      pushNewFollowers: appSettings.follows.push,
      allowNewFollowers: appSettings.follows.inApp,
      pushLikes: appSettings.likes.push,
      allowLikes: appSettings.likes.inApp,
      pushComments: appSettings.comments.push,
      allowComments: appSettings.comments.inApp,
      pushMentions: appSettings.mentions.push,
      allowMentions: appSettings.mentions.inApp,
      pushTags: appSettings.tags.push,
      allowTags: appSettings.tags.inApp,
      pushReactions: appSettings.projectReviewReactions.push,
      allowReactions: appSettings.projectReviewReactions.inApp,
      pushHelpfulReviews: appSettings.helpfulProjectReviews.push,
      allowHelpfulReviews: appSettings.helpfulProjectReviews.inApp,
      pushNewVettings: appSettings.projectVettingReactions.push,
      allowNewVettings: appSettings.projectVettingReactions.inApp,
      pushNewReviews: appSettings.projectReviews.push,
      allowNewReviews: appSettings.projectReviews.inApp,
      pushRepostsAndQuotes: appSettings.projectQuotes.push,
      allowRepostsAndQuotes: appSettings.projectQuotes.inApp,
    );
  }
}
