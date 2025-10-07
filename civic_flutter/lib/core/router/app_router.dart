import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/create/presentation/routes/create_route.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:civic_flutter/features/notifications/presentation/routes/notifications_routes.dart';
import 'package:civic_flutter/features/onboarding/onboarding.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  ref.read(bootStrapProvider);
  return GoRouter(
    initialLocation: AppRoutes.initial,
    navigatorKey: _rootNavigatorKey,
    routes: [
      // Onboarding routes
      GoRoute(
        path: AppRoutes.initial,
        builder: (context, state) {
          return const InitialOnBoardingScreen();
        },
        redirect: (context, state) async {
          final localStorage = ref.read(localStorageProvider);
          final firstTimer = localStorage.getBool('first_timer') ?? true;
          if (firstTimer) {
            FlutterNativeSplash.remove();
            return AppRoutes.initial;
          } else {
            final userRecord = localStorage.getString('userRecord');
            if (userRecord == null) {
              FlutterNativeSplash.remove();
              return AppRoutes.auth;
            } else {
              FlutterNativeSplash.remove();
              return ProjectRoutes.namespace;
            }
          }
        },
      ),

      // Onboarding
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) {
          final data = state.extra! as bool?;
          return OnBoardingScreen(
            isPolitical: data ?? true,
          );
        },
      ),

      // Authentication
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const EmailScreen(),
        routes: [
          // Login
          GoRoute(
            path: AppRoutes.login,
            builder: (context, state) {
              return const LoginScreen();
            },
          ),

          // Password reset
          GoRoute(
            path: AppRoutes.resetPassword,
            builder: (context, state) {
              return const ResetPasswordScreen();
            },
            routes: [
              GoRoute(
                path: AppRoutes.verifyResetPasswordCode,
                builder: (context, state) {
                  return const VerifyPasswordResetCodeScreen();
                },
              ),
              GoRoute(
                path: AppRoutes.createNewPassword,
                builder: (context, state) {
                  return const NewPasswordScreen();
                },
              ),
            ],
          ),

          // Sign up
          GoRoute(
            path: AppRoutes.signUp,
            builder: (context, state) {
              return const VerifyIdentityScreen();
            },
            routes: [
              GoRoute(
                path: AppRoutes.confirmDetails,
                builder: (context, state) {
                  return const UsernameScreen();
                },
              ),
              GoRoute(
                path: AppRoutes.selectStatus,
                builder: (context, state) {
                  return const PoliticalStatusScreen();
                },
              ),
              GoRoute(
                path: AppRoutes.createAccountRequest,
                builder: (context, state) {
                  return const CreateAccountRequestScreen();
                },
              ),
              GoRoute(
                path: AppRoutes.validateCreateAccount,
                builder: (context, state) {
                  return const ValidateCreateAccountScreen();
                },
              ),
            ],
          ),
        ],
      ),

      // Main app
      StatefulShellRoute.indexedStack(
        branches: [
          ProjectRoutes.branch,
          FeedRoutes.branch,
          CreateRoutes.branch,
          NetworkRoutes.branch,
          NotificationsRoutes.branch,
        ],
        builder: (context, state, navigationShell) {
          return AppWrapper(
            navigatorShell: navigationShell,
          );
        },
      ),
    ],
  );
}
