import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsSettingsScreen extends ConsumerWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authUserProvider);
    final settings = ref.watch(getUserNotifSettingsProvider);
    final notificationSettings = ref.watch(
      notificationSettingsProvider(
        settings.value,
      ),
    );
    final notificationSettingsNotifier = ref.read(
      notificationSettingsProvider(
        settings.value,
      ).notifier,
    );
    final isNotLeader = authState is AuthUserStateSuccess &&
        authState.userRecord.politicalStatus == PoliticalStatus.none;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(
            Iconsax.arrow_left_2,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              TTexts.notificationsSettings,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 25,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 21, left: 1),
              child: AppDecorationDot(),
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Divider(
            height: 0,
          ),
        ),
      ),
      body: settings.when(
        data: (data) {
          final notificationItems = <Widget>[
            NotificationsSettingCard(
              title: TTexts.pushNotifications,
              subtitle: TTexts.pushNotificationsSubtitle,
              value: notificationSettings.pushNotifications,
              onChanged: (_) {},
              onTap: notificationSettingsNotifier.togglePushNotifications,
            ),
          ];

          for (final tileData in staticTilesData) {
            final preference = NotificationsHelper.getPreferenceForType(
              notificationSettings,
              tileData.type,
            );
            notificationItems.add(
              NotificationTile(
                title: tileData.title,
                subtitle: tileData.subtitle,
                onChanged: (_) {},
                onTap: () async {
                  final newPreference = await notificationBottomSheet(
                    context,
                    'Manage ${tileData.title}',
                    preference,
                  );
                  if (newPreference != null) {
                    await notificationSettingsNotifier.updateSetting(
                      NotificationSettingsUpdate(
                        settingType: tileData.type,
                        preference: newPreference,
                      ),
                    );
                  }
                },
              ),
            );
          }

          if (!isNotLeader) {
            for (final tileData in leaderTilesData) {
              final preference = NotificationsHelper.getPreferenceForType(
                notificationSettings,
                tileData.type,
              );
              notificationItems.add(
                NotificationTile(
                  title: tileData.title,
                  subtitle: tileData.subtitle,
                  onChanged: (_) {},
                  onTap: () async {
                    final newPreference = await notificationBottomSheet(
                      context,
                      'Manage ${tileData.title}',
                      preference,
                    );
                    if (newPreference != null) {
                      await notificationSettingsNotifier.updateSetting(
                        NotificationSettingsUpdate(
                          settingType: tileData.type,
                          preference: newPreference,
                        ),
                      );
                    }
                  },
                ),
              );
            }
          }

          return ListView.separated(
            padding: const EdgeInsets.all(15),
            itemCount: notificationItems.length,
            separatorBuilder: (context, index) {
              return index != 0
                  ? const Divider(
                      indent: 5,
                      endIndent: 10,
                    )
                  : const SizedBox(
                      height: 10,
                    );
            },
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: notificationItems[index],
            ),
          );
        },
        error: (error, stackTrace) {
          final errMsg = (error as Failure).message;
          return Center(
            child: LoadingError(
              retry: () {
                ref.invalidate(notificationSettingsProvider);
              },
              errorMessage: errMsg,
              showRefresh: true,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          );
        },
        loading: () => const Center(
          child: AppLoadingWidget(),
        ),
      ),
    );
  }
}
