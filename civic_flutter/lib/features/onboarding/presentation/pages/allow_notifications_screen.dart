import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AllowNotificationsScreen extends ConsumerWidget {
  const AllowNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            spacing: 10,
            children: [
              const VectorImageContainer(
                imagePath: 'assets/images/notifications.png',
              ),
              Text(
                'ALLOW NOTIFICATIONS',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Enable notifications to receive timely alerts and stay connected with what matters most to you, even when you're offline.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(
            15,
            0,
            15,
            20,
          ),
          child: AppDualButton(
            onTapSkipButton: () async {
              await ref
                  .read(
                    onboardingProvider.notifier,
                  )
                  .cacheFirstTimer();
              if (context.mounted) {
                context.go('/auth');
              }
            },
            activeButtonText: 'Allow Notifications',
            onTapActiveButton: () async {
              await ref
                  .read(
                    fcmServiceImplProvider,
                  )
                  .directPermissionRequest();
              await ref
                  .read(
                    onboardingProvider.notifier,
                  )
                  .cacheFirstTimer();
              if (context.mounted) {
                context.go('/auth');
              }
            },
            activeButtonLoading: false,
            skipButtonLoading: false,
            skipText: 'Maybe later',
          ),
        ),
      ),
    );
  }
}
