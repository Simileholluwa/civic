// ignore_for_file: use_build_context_synchronously

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final loggedOut = await authNotifier.logout();
            if (loggedOut) {
              context.go(AppRoutes.auth);
            }
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
