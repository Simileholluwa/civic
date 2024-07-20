import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/features/authentication/presentation/bindings/auth_bindings.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/login_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/new_password_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/reset_password_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/verify_password_reset_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: AppRoutes.login,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == AppRoutes.login) {
          return GetPageRoute(
            routeName: AppRoutes.login,
            page: () => const LoginScreen(),
            binding: AuthBindings(),
            transition: Transition.leftToRight,
          );
        } else if (routeSettings.name == AppRoutes.resetPassword) {
          return GetPageRoute(
            routeName: AppRoutes.resetPassword,
            page: () => const ResetPasswordScreen(),
            binding: AuthBindings(),
            transition: Transition.leftToRight,
          );
        } else if (routeSettings.name == AppRoutes.verifyResetPasswordCode) {
          return GetPageRoute(
            routeName: AppRoutes.verifyResetPasswordCode,
            page: () => const VerifyPasswordResetCodeScreen(),
            binding: AuthBindings(),
            transition: Transition.leftToRight,
          );
        } else if (routeSettings.name == AppRoutes.createNewPassword) {
          return GetPageRoute(
            routeName: AppRoutes.createNewPassword,
            page: () => const NewPasswordScreen(),
            binding: AuthBindings(),
            transition: Transition.leftToRight,
          );
        }
        return null;
      },
    );
  }
}
