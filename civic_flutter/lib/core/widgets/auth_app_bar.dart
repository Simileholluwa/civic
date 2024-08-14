import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    this.icon = CupertinoIcons.clear,
    this.showLeading = true,
    super.key,
  });
  final IconData icon;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showLeading
          ? IconButton(
              onPressed: context.pop,
              icon: Icon(
                icon,
              ),
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: TSizes.sm,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.message_question,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        TDeviceUtils.getAppBarHeight(),
      );
}
