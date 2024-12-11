// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/discover/presentation/routes/discover_routes.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/notifications/presentation/routes/notifications_routes.dart';
import 'package:civic_flutter/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/profile/presentation/routes/profile_routes.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
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
          final firstTimer =
              ref.read(localStorageProvider).getBool('first_timer') ?? true;
          try {
            if (firstTimer) {
              FlutterNativeSplash.remove();
              return AppRoutes.initial;
            } else {
              final currentUser =
                  await ref.read(clientProvider).userRecord.getUser();
              if (currentUser == null) {
                FlutterNativeSplash.remove();
                return AppRoutes.auth;
              } else {
                ref.read(localStorageProvider).setInt(
                      'userId',
                      currentUser.userInfo!.id!,
                    );
                FlutterNativeSplash.remove();
                return ProjectRoutes.namespace;
              }
            }
          } catch (_) {
            if (firstTimer) {
              FlutterNativeSplash.remove();
              return AppRoutes.initial;
            } else {
              FlutterNativeSplash.remove();
              return AppRoutes.auth;
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
              final data = state.extra as Map<String, String>;
              return LoginScreen(
                email: data['email'] ?? '',
                username: data['username'] ?? '',
              );
            },
            routes: [
              // Password reset
              GoRoute(
                path: AppRoutes.resetPassword,
                name: AppRoutes.resetPassword,
                builder: (context, state) {
                  final data = state.extra as Map<String, String>;
                  return ResetPasswordScreen(
                    email: data['email'] ?? '',
                  );
                },
                routes: [
                  GoRoute(
                      path: AppRoutes.verifyResetPasswordCode,
                      name: AppRoutes.verifyResetPasswordCode,
                      builder: (context, state) {
                        final data = state.extra as Map<String, String>;
                        return VerifyPasswordResetCodeScreen(
                          email: data['email'] ?? '',
                        );
                      }),
                  GoRoute(
                      path: AppRoutes.createNewPassword,
                      name: AppRoutes.createNewPassword,
                      builder: (context, state) {
                        final data = state.extra as Map<String, String>;
                        return NewPasswordScreen(
                          code: data['code'] ?? '',
                          email: data['email'] ?? '',
                        );
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
                final data = state.extra as Map<String, String>;
                return PoliticalStatusScreen(
                  email: data['email'] ?? '',
                );
              }),
          GoRoute(
              path: AppRoutes.chooseUsername,
              name: AppRoutes.chooseUsername,
              builder: (context, state) {
                final data = state.extra as Map<String, dynamic>;
                return UsernameScreen(
                  email: data['email'] ?? '',
                  politicalStatus: data['politicalStatus'] ?? 3,
                );
              }),
          GoRoute(
              path: AppRoutes.createAccountRequest,
              name: AppRoutes.createAccountRequest,
              builder: (context, state) {
                final data = state.extra as Map<String, dynamic>;
                return CreateAccountRequestScreen(
                  email: data['email'] ?? '',
                  politicalStatus: data['politicalStatus'] ?? 3,
                  username: data['username'] ?? '',
                );
              }),
          GoRoute(
              path: AppRoutes.validateCreateAccount,
              name: AppRoutes.validateCreateAccount,
              builder: (context, state) {
                final data = state.extra as Map<String, dynamic>;
                return ValidateCreateAccountScreen(
                  email: data['email'] ?? '',
                  politicalStatus: data['politicalStatus'] ?? 3,
                  username: data['username'] ?? '',
                  password: data['password'] ?? '',
                );
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
          DiscoverRoutes.branch,
          NotificationsRoutes.branch,
          ProfileRoutes.branch,
        ],
        builder: (context, state, navigationShell) {
          return AppWrapper(
            navigatorShell: navigationShell,
          );
        },
      ),

      GoRoute(
        path: AppRoutes.createPost,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return CreatePostScreen(
            id: data['id'],
            draft: data['draft'],
          );
        },
      ),

      GoRoute(
        path: AppRoutes.createPoll,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return CreatePollScreen(
            id: data['id'],
            draft: data['draft'],
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

      GoRoute(
        path: AppRoutes.createProject,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return CreateProjectScreen(
            id: data['id'],
          );
        },
      ),

      GoRoute(
        path: AppRoutes.pickMedia,
        name: AppRoutes.pickMedia,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return MediaPicker(
            pickedAssets: data['pickedAssets'] ?? <XFile>[],
            requestType: data['requestType'] ?? RequestType.common,
            maxCount: data['maxCount'] ?? 1,
            isAddMedia: data['isAddMedia'] ?? true,
          );
        },
      ),
    ],
  );
}
