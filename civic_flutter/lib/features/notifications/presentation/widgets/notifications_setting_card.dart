import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsSettingCard extends ConsumerWidget {
  const NotificationsSettingCard({
    required this.title,
    required this.subtitle,
    super.key,
    this.value,
    this.onChanged,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: .51,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: NotificationTile(
        title: title,
        subtitle: subtitle,
        showTrailing: true,
        value: value,
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}
