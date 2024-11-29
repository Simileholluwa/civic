// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
// ignore_for_file: avoid_build_context_in_providers

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/project/project.dart';
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
    result.fold((error) => TToastMessages.errorToast(error.message), (r) {
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
      TToastMessages.errorToast(error.message);
      return;
    }, (userRecord) {
      ref.read(authUserProvider.notifier).setValue(true);

      if (userRecord != null && userRecord.verifiedAccount) {
        ref.read(verifiedUserProvider.notifier).setValue(true);
        context.goNamed(
          ProjectRoutes.namespace,
        );
        ref.read(localStorageProvider).setInt(
              'userId',
              userRecord.userInfo!.id!,
            );
        return;
      } else if (userRecord != null && !userRecord.verifiedAccount) {
        context.goNamed(
          AppRoutes.verifyAccount,
        );
        ref.read(localStorageProvider).setInt(
              'userId',
              userRecord.userInfo!.id!,
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

    final newUserUseCase = ref.read(checkIfNewUserProvider);
    ref.read(checkEmailLoadingProvider.notifier).setValue(true);
    final result = await newUserUseCase(
      CheckIfNewUserParams(
        email,
      ),
    );
    ref.read(checkEmailLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message);
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

    if (!ref.watch(acceptTermsProvider)) {
      if (context.mounted) {
        TToastMessages.errorToast(
          'Read and accept privacy policy and terms of use.',
        );
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
      TToastMessages.errorToast(error.message);
    }, (r) {
      TToastMessages.successToast(
        'A verification code has been sent to your email',
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

  void navigateToApp(BuildContext context) {
    context.go(ProjectRoutes.namespace);
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
    required String password,
  }) async {
    final validateAccount = ref.read(validateCreateAccountProvider);

    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(true);
    final result = await validateAccount(
      ValidateCreateAccountParams(
        code: code,
        email: email,
        politicalStatus: PoliticalStatus.fromJson(politicalStatus),
        password: password,
      ),
    );
    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message);
    }, (r) {
      TToastMessages.successToast(
        'Great! Your account has been created.',
      );
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

    final initiatePasswordReset = ref.read(initiatePasswordResetProvider);
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(true);
    final result = await initiatePasswordReset(
      InitiatePasswordResetParams(
        email,
      ),
    );
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message);
      return;
    }, (r) {
      TToastMessages.successToast(
        'Password reset code has been sent to your email',
      );
      context.goNamed(
        AppRoutes.verifyResetPasswordCode,
        extra: {
          'email': email,
        },
      );
    });
  }

  Future<void> resendPasswordResetCode({
    required String email,
  }) async {
    final initiatePasswordReset = ref.read(initiatePasswordResetProvider);
    ref
        .read(initiateResendPasswordResetLoadingProvider.notifier)
        .setValue(true);
    final result = await initiatePasswordReset(
      InitiatePasswordResetParams(
        email,
      ),
    );
    ref
        .read(initiateResendPasswordResetLoadingProvider.notifier)
        .setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message);
      ref.read(countdownTimerProvider.notifier).resetTimer();
      return;
    }, (r) {
      TToastMessages.successToast(
        'Password reset code has been sent to your email',
      );
      ref.read(countdownTimerProvider.notifier).startCountdown();
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
        TToastMessages.errorToast(error.message);
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
    final ninUseCase = ref.read(searchUserNinProvider);
    ref.read(searchNinLoadingProvider.notifier).setValue(true);
    final result = await ninUseCase(
      NinUseCaseParams(ninNumber),
    );
    ref.read(searchNinLoadingProvider.notifier).setValue(false);
    result.fold((error) => TToastMessages.errorToast(error.message), (r) {
      if (r != null) {
        context.goNamed(
          AppRoutes.confirmNinDetails,
          extra: {
            'ninRecord': r,
          },
        );
      } else {
        TToastMessages.errorToast('NIN already exists');
      }
    });
  }
}
