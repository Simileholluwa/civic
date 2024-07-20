
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    this.icon = CupertinoIcons.clear,
    this.onPressed = THelperFunctions.goBack,
    this.canGoBack = true,
    this.showLeading = true,
    this.goBack,
    super.key,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback? goBack;
  final bool canGoBack;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showLeading ? IconButton(
        onPressed: canGoBack ? onPressed : goBack,
        icon: Icon(
                icon,
              )
      ) : null,
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
