import 'package:civic_flutter/features/network/network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      getUserDetailsProvider(
        userId,
      ),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('User Profile'),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                data.when(
                  data: (user) {
                    return 
                      Text(
                        user.toString(),
                      
                    );
                  },
                  error: (_, __) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
                ListTile(
                  title: const Text('Name'),
                  subtitle: const Text('John Doe'),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: const Text('john.doe@example.com'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
