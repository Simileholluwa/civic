import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({
    required this.userId,
    super.key,
  });

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      getUserDetailsProvider(
        userId,
      ),
    );
    final currentUser = ref.read(currentActiveUserProvider).currentUser;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 65,
            pinned: true,
            expandedHeight: 200,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Iconsax.arrow_left_2),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.fromLTRB(18, 65, 18, 15),
                padding: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    AppUserProfileImage(
                      imageUrl: currentUser.userInfo!.imageUrl!,
                      radius: 30,
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Text(
                            THelperFunctions.getFullName(
                              currentUser.firstName!,
                              currentUser.middleName,
                              currentUser.lastName!,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: TColors.white,
                                  fontSize: 30,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                data.when(
                  data: (user) {
                    return Text(
                      user.toString(),
                    );
                  },
                  error: (_, __) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
                const ListTile(
                  title: Text('Name'),
                  subtitle: Text('John Doe'),
                ),
                const ListTile(
                  title: Text('Email'),
                  subtitle: Text('john.doe@example.com'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
