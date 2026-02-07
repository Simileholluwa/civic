import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NetworkScreen extends ConsumerWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(
      networkTabControllerProvider,
    );
    final authUser = ref.watch(currentActiveUserProvider).currentUser;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    await context.push(
                      '/network/${authUser.userInfo!.id}',
                    );
                  },
                  icon: AppUserProfileImage(
                    imageUrl: authUser.userInfo!.imageUrl!,
                    radius: 18,
                    iconSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              title: Text(
                'NETWORK',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 25,
                    ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTabBarDesign(
                      tabController: tabController,
                      showTopBorder: true,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: 'ALL'),
                        Tab(text: 'SUGGESTED'),
                        Tab(text: 'CURRENT LEADERS'),
                        Tab(text: 'ASPIRING LEADERS'),
                        Tab(text: 'FORMER LEADERS'),
                        Tab(text: 'TOP LEADERS'),
                        Tab(text: 'TOP VOICES'),
                        Tab(text: 'POPULAR'),
                        Tab(text: 'MUTUALS'),
                      ],
                    ),
                    const Divider(
                      height: 0,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: TextButton(
            onPressed: () async {
              final res = await ref.read(sessionProvider).signOutDevice();
              if (res && context.mounted) {
                context.go(AppRoutes.auth);
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    ref
                      ..invalidate(paginatedProjectListProvider)
                      ..invalidate(paginatedPostListProvider)
                      ..invalidate(paginatedNotificationsListProvider);
                  },
                );
              }
            },
            child: const Text('Logout'),
          ),
        ),
      ),
    );
  }
}
