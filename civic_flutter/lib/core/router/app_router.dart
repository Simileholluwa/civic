
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/choose_username_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/email_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/email_verification_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/login_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/new_password_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/political_status_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/reset_password_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/signup_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/verify_identity_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/verify_password_reset_code_screen.dart';
import 'package:civic_flutter/features/civic/presentation/pages/civic_wrapper.dart';
import 'package:civic_flutter/features/onboarding/presentation/pages/initial_on_boarding.dart';
import 'package:civic_flutter/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: AppRoutes.initial,
    routes: [
      // Initial
      GoRoute(
        path: AppRoutes.initial,
        builder: (context, state) => const InitialOnBoardingScreen(),  
      ),

      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => OnBoardingScreen(
          isPolitical: state.pathParameters['isPolitical'] ?? '',
        ),  
      ),

      // Authentication

      GoRoute(
        path: AppRoutes.checkIfNewUser,
        builder: (context, state) => const EmailScreen(),
      ),

      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(
          email: state.pathParameters['email'] ?? '',
          username: state.pathParameters['username'] ?? '',
        ),
      ),

      GoRoute(
        path: AppRoutes.politicalStatus,
        builder: (context, state) => PoliticalStatusScreen(
          email: state.pathParameters['email'] ?? '',
        ),
      ),

      GoRoute(
        path: AppRoutes.chooseUsername,
        builder: (context, state) => UsernameScreen(
          email: state.pathParameters['email'] ?? '',
          politicalStatus: int.tryParse(
                state.pathParameters['politicalStatus'] ?? '0',
              ) ??
              0,
        ),
      ),

      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => SignUpScreen(
          email: state.pathParameters['email'] ?? '',
          politicalStatus: int.tryParse(
                state.pathParameters['politicalStatus'] ?? '0',
              ) ??
              0,
          username: state.pathParameters['username'] ?? '',
        ),
      ),

      GoRoute(
        path: AppRoutes.verifyEmail,
        builder: (context, state) => EmailVerificationScreen(
          email: state.pathParameters['email'] ?? '',
          politicalStatus: int.tryParse(
                state.pathParameters['politicalStatus'] ?? '0',
              ) ??
              0,
          username: state.pathParameters['username'] ?? '',
          password: state.pathParameters['password'] ?? '',
        ),
      ),

      GoRoute(
        path: AppRoutes.verifyAccount,
        builder: (context, state) => const VerifyIdentityScreen(),
      ),

      GoRoute(
        path: AppRoutes.civic,
        builder: (context, state) => const CivicWrapper(),
      ),

      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => ResetPasswordScreen(
          email: state.pathParameters['email'] ?? '',
        ),
      ),

      GoRoute(
        path: AppRoutes.verifyResetPasswordCode,
        builder: (context, state) => VerifyPasswordResetCodeScreen(
          email: state.pathParameters['email'] ?? '',
        ),
      ),

      GoRoute(
        path: AppRoutes.createNewPassword,
        builder: (context, state) => NewPasswordScreen(
          code: state.pathParameters['code'] ?? '',
          email: state.pathParameters['email'] ?? '',
        ),
      ),
    ],
  );
}
