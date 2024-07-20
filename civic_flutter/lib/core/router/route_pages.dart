
import 'package:civic_flutter/core/api/api_client.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/features/authentication/presentation/bindings/auth_bindings.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/authentication_landing_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/choose_username_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/confirm_nin_details.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/email_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/email_verification_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/political_status_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/signup_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/verify_identity_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/verify_nin_email_otp_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/verify_nin_otp_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/login_wrapper.dart';
import 'package:civic_flutter/features/civic/presentation/bindings/civic_binding.dart';
import 'package:civic_flutter/features/civic/presentation/widgets/navigation_menu.dart';
import 'package:civic_flutter/features/onboarding/presentation/bindings/on_boarding_binding.dart';
import 'package:civic_flutter/features/onboarding/presentation/middlewares/onboarding_middleware.dart';
import 'package:civic_flutter/features/onboarding/presentation/pages/initial_on_boarding.dart';
import 'package:civic_flutter/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:get/get.dart';

class AppPages {

  static const initial = AppRoutes.initial;
  static final List<GetPage<dynamic>> routes = [

    // Onboarding Routes Pages //
    GetPage(
      name: AppRoutes.initial,
      page: () => const InitialOnBoardingScreen(),
      binding: OnBoardingBinding(),
      transition: Transition.fadeIn,
      middlewares: [
        OnboardingMiddleware(
          client: Get.find<ApiClient>(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.initialOnboarding,
      page: () => const InitialOnBoardingScreen(),
      binding: OnBoardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
      transition: Transition.fadeIn,
    ),

    // Authentication Routes Pages //
    GetPage(
      name: AppRoutes.authLandingScreen,
      page: () => const AuthLandingScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.checkIfNewUser,
      page: () => const EmailScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.politicalStatus,
      page: () => const PoliticalStatusScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.verifyNinOTP,
      page: () => const VerifyNinOTPScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.authLandingScreen,
      page: () => const AuthLandingScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.chooseUsername,
      page: () => const UsernameScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.verifyAccount,
      page: () => const VerifyIdentityScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.confirmNinDetails,
      page: () => const ConfirmNinDetails(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginWrapper(),
    ),
    GetPage(
      name: AppRoutes.verifyEmail,
      page: () => const EmailVerificationScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.verifyNinEmailOTP,
      page: () => const VerifyNinEmailOTPScreen(),
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),

    // Main app routes
    GetPage(
      name: AppRoutes.civic,
      page: () => const CivicNavigationBar(),
      binding: CivicBindings(),
      transition: Transition.fadeIn,
    ),
    
  ];
}
