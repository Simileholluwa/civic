// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/create/presentation/routes/create_route.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/notifications/presentation/routes/notifications_routes.dart';
import 'package:civic_flutter/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  ref.read(bootStrapProvider);
  return GoRouter(
    initialLocation: AppRoutes.initial,
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
        name: AppRoutes.onboarding,
        builder: (context, state) {
          final data = state.extra as Map<String, bool>;
          return OnBoardingScreen(
            isPolitical: data['isPolitical'] ?? true,
          );
        },
      ),

      // Login, Sign up, password reset and account verification routes
      GoRoute(
        path: AppRoutes.auth,
        name: AppRoutes.auth,
        builder: (context, state) => const AuthLandingScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.checkIfNewUser,
            name: AppRoutes.checkIfNewUser,
            builder: (context, state) => const EmailScreen(),
          ),

          // Login
          GoRoute(
            path: AppRoutes.login,
            name: AppRoutes.login,
            builder: (context, state) {
              return LoginScreen();
            },
            routes: [
              // Password reset
              GoRoute(
                path: AppRoutes.resetPassword,
                name: AppRoutes.resetPassword,
                builder: (context, state) {
                  return ResetPasswordScreen();
                },
                routes: [
                  GoRoute(
                      path: AppRoutes.verifyResetPasswordCode,
                      name: AppRoutes.verifyResetPasswordCode,
                      builder: (context, state) {
                        return VerifyPasswordResetCodeScreen();
                      }),
                  GoRoute(
                      path: AppRoutes.createNewPassword,
                      name: AppRoutes.createNewPassword,
                      builder: (context, state) {
                        return NewPasswordScreen();
                      }),
                ],
              ),
            ],
          ),

          // Sign up
          GoRoute(
            path: AppRoutes.politicalStatus,
            name: AppRoutes.politicalStatus,
            builder: (context, state) {
              return const PoliticalStatusScreen();
            },
          ),
          GoRoute(
              path: AppRoutes.chooseUsername,
              name: AppRoutes.chooseUsername,
              builder: (context, state) {
                return UsernameScreen();
              }),
          GoRoute(
              path: AppRoutes.createAccountRequest,
              name: AppRoutes.createAccountRequest,
              builder: (context, state) {
                return CreateAccountRequestScreen();
              }),
          GoRoute(
              path: AppRoutes.validateCreateAccount,
              name: AppRoutes.validateCreateAccount,
              builder: (context, state) {
                return ValidateCreateAccountScreen();
              }),

          // Account verification
          GoRoute(
            path: AppRoutes.verifyAccount,
            name: AppRoutes.verifyAccount,
            builder: (context, state) => const VerifyIdentityScreen(),
            routes: [
              GoRoute(
                path: AppRoutes.confirmNinDetails,
                name: AppRoutes.confirmNinDetails,
                builder: (context, state) => const ConfirmNinDetails(
                  ninRecord: '',
                ),
              ),
              GoRoute(
                path: AppRoutes.verifyNinPhoneOTP,
                name: AppRoutes.verifyNinPhoneOTP,
                builder: (context, state) => const VerifyNinPhoneOTPScreen(
                  verificationId: '',
                ),
              ),
              GoRoute(
                path: AppRoutes.verifyNinEmailOTP,
                name: AppRoutes.verifyNinEmailOTP,
                builder: (context, state) => const VerifyNinEmailOTPScreen(),
              ),
            ],
          ),
        ],
      ),

      StatefulShellRoute.indexedStack(
        branches: [
          ProjectRoutes.branch,
          FeedRoutes.branch,
          CreateRoutes.branch,
          NotificationsRoutes.branch,
        ],
        builder: (context, state, navigationShell) {
          return AppWrapper(
            navigatorShell: navigationShell,
          );
        },
      ),

      GoRoute(
        path: AppRoutes.createArticle,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return CreateArticleScreen(
            id: data['id'],
            draft: data['draft'],
          );
        },
      ),
    ],
  );
}
