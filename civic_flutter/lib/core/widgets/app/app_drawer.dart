import 'dart:async';
import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedRecordString = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded = jsonDecode(savedRecordString.toString());
    final userRecord = UserRecord.fromJson(decoded);
    final authNotifier = ref.watch(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.light_mode_rounded,
              size: 26,
            ),
          ),
          const SizedBox(width: 5),
        ],
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Iconsax.arrow_left_2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 15,
          children: [
            Column(
              children: [
                AppUserProfileImage(
                  imageUrl: userRecord.userInfo!.imageUrl!,
                  radius: 45,
                  iconSize: 67,
                ),
                const SizedBox(height: 10),
                Text(
                  THelperFunctions.getFullName(
                    userRecord.firstName!,
                    userRecord.middleName,
                    userRecord.lastName!,
                  ),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 25,
                      ),
                ),
                Text(
                  userRecord.bio!,
                  style: Theme.of(context).textTheme.labelMedium!,
                ),
                const SizedBox(height: 5),
                UserQuickDetails(
                  creator: userRecord,
                  alignment: MainAxisAlignment.center,
                ),
              ],
            ),
            const SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    AppDrawerListTile(
                      title: 'Profile',
                      leadingIcon: Icons.person_outline,
                      onTap: () {
                        context.push(
                          '/profile/${userRecord.id}',
                        );
                      },
                    ),
                    const Divider(
                      thickness: .5,
                    ),
                    AppDrawerListTile(
                      title: 'Settings',
                      leadingIcon: Iconsax.setting_2,
                      onTap: () {},
                    ),
                    const Divider(
                      thickness: .5,
                    ),
                    AppDrawerListTile(
                      title: 'Support',
                      leadingIcon: FontAwesomeIcons.headphonesSimple,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    AppDrawerListTile(
                      title: 'Bookmarks',
                      leadingIcon: Icons.bookmark_outline,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    AppDrawerListTile(
                      title: 'Invite Friends',
                      leadingIcon: Iconsax.user_add,
                      onTap: () {},
                    ),
                    const Divider(
                      thickness: .5,
                    ),
                    AppDrawerListTile(
                      title: 'Rate CIVIC',
                      leadingIcon: Iconsax.magic_star,
                      onTap: () {},
                    ),
                    const Divider(
                      thickness: .5,
                    ),
                    AppDrawerListTile(
                      title: 'About CIVIC',
                      leadingIcon: Iconsax.info_circle,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: AppDrawerListTile(
                  title: 'Logout',
                  leadingIcon: Iconsax.logout,
                  color: Colors.red,
                  onTap: () {
                    unawaited(
                      authNotifier.logout(),
                    );
                    context.go('/');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
