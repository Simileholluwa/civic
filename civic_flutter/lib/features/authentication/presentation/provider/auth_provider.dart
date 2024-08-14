// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
// ignore_for_file: avoid_build_context_in_providers

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/search_user_nin_use_case.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/check_if_new_user_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/create_account_request_usecase.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/initiate_password_reset_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/reset_user_password_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/user_sign_in_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/validate_create_account_use_case.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_service_provider.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    return AuthStateBooting();
  }

  Future<void> logout(BuildContext context) async {
    final logOutUseCase = ref.read(logOutProvider);
    final result = await logOutUseCase(
      NoParams(),
    );
    result.fold((error) => null, (r) {
      ref.read(authUserProvider.notifier).setValue(false);
      context.pushNamed(AppRoutes.auth);
    });
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState!.validate();
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      if (context.mounted) {
        TToastMessages.errorToast(
            'No internet connection. Reconnect and try again.', context);
      }
      return;
    }
    if (!isValid) return;
    final signInUseCase = ref.read(userSignInProvider);

    ref.read(signInLoadingProvider.notifier).setValue(true);
    final result = await signInUseCase(
      UserSignInParams(
        email,
        password,
      ),
    );
    ref.read(signInLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message, context);
      return;
    }, (userRecord) {
      ref.read(authUserProvider.notifier).setValue(true);
      if (userRecord != null && userRecord.verifiedAccount!) {
        ref.read(verifiedUserProvider.notifier).setValue(true);
        context.goNamed(
          FeedRoutes.namespace,
        );
        return;
      } else if (userRecord != null && !userRecord.verifiedAccount!) {
        context.goNamed(
          AppRoutes.verifyAccount,
        );
        return;
      }
    });
  }

  Future<void> checkIfNewUser({
    required String email,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      if (context.mounted) {
        TToastMessages.errorToast(
            'No internet connection. Reconnect and try again.', context);
      }
      return;
    }
    final newUserUseCase = ref.read(checkIfNewUserProvider);
    ref.read(checkEmailLoadingProvider.notifier).setValue(true);
    final result = await newUserUseCase(
      CheckIfNewUserParams(
        email,
      ),
    );
    ref.read(checkEmailLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message, context);
    }, (username) {
      if (username != null) {
        context.pushNamed(
          AppRoutes.login,
          extra: {
            'email': email,
            'username': username,
          },
        );
      } else {
        context.pushNamed(
          AppRoutes.politicalStatus,
          extra: {
            'email': email,
          },
        );
      }
    });
  }

  Future<List<String>> fetchAllUsernames() async {
    final usernameUseCase = ref.read(fetchAllUsernamesProvider);
    final result = await usernameUseCase(
      NoParams(),
    );
    var usernames = <String>[];
    result.fold(
      (l) => null,
      (allUsernames) {
        usernames = allUsernames;
      },
    );
    return usernames;
  }

  Future<void> createAccountRequest({
    required GlobalKey<FormState> formKey,
    required String password,
    required String email,
    required String username,
    required int politicalStatus,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState!.validate();
    final createAccountRequest = ref.read(createAccountRequestProvider);
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      if (context.mounted) {
        TToastMessages.errorToast(
            'No internet connection. Reconnect and try again.', context);
      }
      return;
    }

    if (!ref.watch(acceptTermsProvider)) {
      if (context.mounted) {
        TToastMessages.errorToast('Please read and accept terms', context);
      }
      return;
    }
    ref.read(createAccountLoadingProvider.notifier).setValue(true);
    final result = await createAccountRequest(
      CreateAccountRequestParams(
        password,
        email,
        username,
      ),
    );
    ref.read(createAccountLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message, context);
    }, (r) {
      TToastMessages.successToast(
        'A verification code has been sent to your email',
        context,
      );
      context.pushNamed(
        AppRoutes.validateCreateAccount,
        extra: {
          'email': email,
          'politicalStatus': politicalStatus,
          'username': username,
          'password': password,
        },
      );
    });
  }

  void navigateToChooseUsername(
    String email,
    int politicalStatus,
  ) {
    state = AuthStateUsername(email: email, politicalStatus: politicalStatus);
  }

  void navigateToMenu(BuildContext context) {
    context.go(FeedRoutes.namespace);
  }

  void navigateToCreateAccount(
    String email,
    int politicalStatus,
    String username,
    BuildContext context, {
    required GlobalKey<FormState> formKey,
  }) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    context.pushNamed(
      AppRoutes.createAccountRequest,
      extra: {
        'email': email,
        'politicalStatus': politicalStatus,
        'username': username,
      },
    );
  }

  Future<void> validateCreateAccount({
    required String code,
    required String email,
    required int politicalStatus,
    required BuildContext context,
  }) async {
    final isConnected = await TDeviceUtils.hasInternetConnection();
    final validateAccount = ref.read(validateCreateAccountProvider);
    if (!isConnected) {
      if (context.mounted) {
        TToastMessages.errorToast(
            'No internet connection. Reconnect and try again.', context);
      }
      return;
    }
    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(true);
    final result = await validateAccount(
      ValidateCreateAccountParams(
        code: code,
        email: email,
        politicalStatus: PoliticalStatus.fromJson(politicalStatus),
      ),
    );
    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message, context);
    }, (r) {
      TToastMessages.successToast('Your account has been created', context);
      context.pushNamed(
        AppRoutes.verifyAccount,
      );
    });
  }

  Future<void> initiatePasswordRequest({
    required String email,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      if (context.mounted) {
        TToastMessages.errorToast(
            'No internet connection. Reconnect and try again.', context);
      }
      return;
    }
    final initiatePasswordReset = ref.read(initiatePasswordResetProvider);
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(true);
    final result = await initiatePasswordReset(
      InitiatePasswordResetParams(
        email,
      ),
    );
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message, context);
      return;
    }, (r) {
      TToastMessages.successToast(
        'Password reset code has been sent to your email',
        context,
      );
      context.goNamed(
        AppRoutes.verifyResetPasswordCode,
        extra: {
          'email': email,
        },
      );
    });
  }

  void navigateToResetPassword(
    String email,
    BuildContext context,
  ) {
    context.pushNamed(
      AppRoutes.resetPassword,
      extra: {
        'email': email,
      },
    );
  }

  navigateToCreateNewPassword(
    String code,
    String email,
    BuildContext context,
  ) {
    context.goNamed(
      AppRoutes.createNewPassword,
      extra: {
        'code': code,
        'email': email,
      },
    );
  }

  Future<void> resetPassword({
    required GlobalKey<FormState> formKey,
    required String email,
    required String newPassword,
    required String code,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      if (context.mounted) {
        TToastMessages.errorToast(
            'No internet connection. Reconnect and try again.', context);
      }
      return;
    }
    final resetPasswordUseCase = ref.read(resetUserPasswordProvider);
    ref.read(resetPasswordLoadingProvider.notifier).setValue(true);
    final result = await resetPasswordUseCase(
      ResetUserPasswordParams(
        email,
        newPassword,
        code,
      ),
    );
    ref.read(resetPasswordLoadingProvider.notifier).setValue(false);
    result.fold(
      (error) {
        TToastMessages.errorToast(error.message, context);
      },
      (r) {
        context.goNamed(AppRoutes.auth);
      },
    );
  }

  Future<void> searchNinRecord({
    required String ninNumber,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      if (context.mounted) {
        TToastMessages.errorToast(
          'No internet connection. Reconnect and try again.',
          context,
        );
      }
      return;
    }
    final ninUseCase = ref.read(searchUserNinProvider);
    ref.read(searchNinLoadingProvider.notifier).setValue(true);
    final result = await ninUseCase(
      NinUseCaseParams(ninNumber),
    );
    ref.read(searchNinLoadingProvider.notifier).setValue(false);
    result.fold((error) => TToastMessages.errorToast(error.message, context),
        (r) {
      if (r != null) {
        context.goNamed(
          AppRoutes.confirmNinDetails,
          extra: {
            'ninRecord': r,
          },
        );
      } else {
        TToastMessages.errorToast('NIN already exists', context);
      }
    });
  }
}
