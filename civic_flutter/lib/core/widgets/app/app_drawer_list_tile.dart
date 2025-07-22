import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppDrawerListTile extends StatelessWidget {
  const AppDrawerListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
    this.hasTrailing = true,
    this.color,
    required this.onTap,
  });

  final String title;
  final IconData? trailingIcon;
  final IconData leadingIcon;
  final bool hasTrailing;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: color,
            ),
      ),
      trailing: hasTrailing
          ? Icon(
              trailingIcon ?? Iconsax.arrow_right_3,
              color: color ?? Theme.of(context).hintColor,
              size: 20,
            )
          : null,
      leading: Icon(
        leadingIcon,
        color: color,
      ),
    );
  }
}
