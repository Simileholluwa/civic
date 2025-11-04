import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<NotificationPreference?> notificationBottomSheet(
  BuildContext context,
  String title,
  NotificationPreference preference,
) {
  return showModalBottomSheet<NotificationPreference>(
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) {
      return _NotificationSettingsSheet(
        title: title,
        preference: preference,
      );
    },
  );
}

class _NotificationSettingsSheet extends StatefulWidget {
  const _NotificationSettingsSheet({
    required this.title,
    required this.preference,
  });

  final String title;
  final NotificationPreference preference;

  @override
  State<_NotificationSettingsSheet> createState() =>
      _NotificationSettingsSheetState();
}

class _NotificationSettingsSheetState
    extends State<_NotificationSettingsSheet> {
  late bool inApp;
  late bool push;

  @override
  void initState() {
    super.initState();
    inApp = widget.preference.inApp;
    push = widget.preference.push;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.left,
              ),
              GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(
                  Icons.clear,
                  color: TColors.secondary,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              NotificationsSettingCard(
                title: 'In-App',
                subtitle: 'Receive ${widget.title.toLowerCase().substring(7)} '
                    'notifications within the app.',
                value: inApp,
                onChanged: (_) {},
                onTap: () => setState(() => inApp = !inApp),
              ),
              NotificationsSettingCard(
                title: 'Push',
                subtitle: 'Receive ${widget.title.toLowerCase().substring(7)} '
                    'notifications while the app is not actively running.',
                value: push,
                onChanged: (_) {},
                onTap: () => setState(() => push = !push),
              ),
              const SizedBox(height: 10),
              AppDualButton(
                onTapActiveButton: () => context.pop(
                  NotificationPreference(inApp: inApp, push: push),
                ),
                activeButtonText: 'Confirm',
                activeButtonLoading: false,
                onTapSkipButton: () => context.pop(),
                skipButtonLoading: false,
                skipText: 'Cancel',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
