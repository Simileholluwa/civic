import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.search_normal,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await context.push(
                      '/network/${authUser.userInfo!.id}',
                    );
                  },
                  icon: AppUserProfileImage(
                    imageUrl: authUser.userInfo!.imageUrl!,
                    radius: 15,
                    iconSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'NETWORK',
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
        body: Container(),
      ),
    );
  }
}
