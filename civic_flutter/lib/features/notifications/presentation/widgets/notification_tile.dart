import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.title,
    required this.subtitle,
    this.showTrailing = false,
    super.key,
    this.value,
    this.onChanged,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final bool showTrailing;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: showTrailing
          ? Switch(
              value: value ?? false,
              onChanged: onChanged,
              thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Icon(
                      Iconsax.notification5,
                      size: 18,
                      color: TColors.primary,
                    );
                  } else {
                    return const Icon(
                      Icons.clear,
                      size: 18,
                    );
                  }
                },
              ),
            )
          : const Icon(
              Iconsax.arrow_right_3,
            ),
    );
  }
}
