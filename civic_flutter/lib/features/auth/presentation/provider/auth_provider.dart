// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    ref.onDispose(() {
      state.firstNameController.dispose();
      state.emailController.dispose();
      state.lastNameController.dispose();
      state.middleNameController.dispose();
      state.verificationCodeController.dispose();
      state.newPasswordController.dispose();
      state.passwordResetCodeController.dispose();
      state.newAccountPasswordController.dispose();
      state.resetPasswordEmailController.dispose();
    });
    return AuthState.empty();
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setFirstName(String firstName) {
    state = state.copyWith(
      firstName: firstName,
    );
  }

  void setNin(String nin) {
    state = state.copyWith(nin: nin);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void setMiddleName(String middleName) {
    state = state.copyWith(middleName: middleName);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setPoliticalStatus(PoliticalStatus politicalStatus) {
    state = state.copyWith(politicalStatus: politicalStatus);
  }

  void setNewAccountPassword(String password) {
    state = state.copyWith(newAccountPassword: password);
  }

  void setVerificationCode(String code) {
    state = state.copyWith(verificationCode: code);
  }

  void setResetPasswordEmail(String email) {
    state = state.copyWith(resetPasswordEmail: email);
  }

  void setPasswordResetCode(String code) {
    state = state.copyWith(passwordResetCode: code);
  }

  void setNewPassword(String password) {
    state = state.copyWith(newPassword: password);
  }

  void toggleAcceptTerms(bool value) {
    state = state.copyWith(acceptTerms: value);
  }

  Future<bool> logout() async {
    final logOutUseCase = ref.read(logOutProvider);
    final result = await logOutUseCase(
      NoParams(),
    );
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      ref.invalidate(paginatedProjectListProvider);
      ref.invalidate(paginatedPostListProvider);
      ref.invalidate(paginatedPollListProvider);
      ref.invalidate(paginatedArticleListProvider);
      return true;
    });
  }

  Future<UserRecord?> signInWithEmailAndPassword() async {
    final signInUseCase = ref.read(userSignInProvider);
    ref.read(signInLoadingProvider.notifier).setValue(true);
    final result = await signInUseCase(
      UserSignInParams(
        state.email,
        state.password,
      ),
    );
    ref.read(signInLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return null;
    }, (userRecord) {
      return userRecord;
    });
  }

  Future<bool> checkIfNewUser() async {
    final newUserUseCase = ref.read(checkIfNewUserProvider);
    ref.read(checkEmailLoadingProvider.notifier).setValue(true);
    final result = await newUserUseCase(
      CheckIfNewUserParams(
        state.email,
      ),
    );
    ref.read(checkEmailLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (firstName) {
      if (firstName != null) {
        setFirstName(firstName);
        return false;
      } else {
        return true;
      }
    });
  }

  Future<bool> createAccountRequest() async {
    final createAccountRequest = ref.read(createAccountRequestProvider);
    if (!state.acceptTerms) {
      TToastMessages.errorToast(
        'Read and accept privacy policy and terms of use.',
      );
      return false;
    }
    ref.read(createAccountLoadingProvider.notifier).setValue(true);
    final result = await createAccountRequest(
      CreateAccountRequestParams(
        state.newAccountPassword,
        state.email,
        state.firstName,
      ),
    );
    ref.read(createAccountLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      TToastMessages.successToast(
        'A verification code has been sent to your email.',
      );
      return true;
    });
  }

  Future<bool> validateCreateAccount() async {
    final validateAccount = ref.read(validateCreateAccountProvider);

    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(true);
    final userRecord = UserRecord(
      nin: state.nin,
      firstName: state.firstName,
      lastName: state.lastName,
      middleName: state.middleName,
      politicalStatus: PoliticalStatus.fromJson(state.politicalStatus.index),
    );
    final result = await validateAccount(
      ValidateCreateAccountParams(
        code: state.verificationCode,
        email: state.email,
        password: state.newAccountPassword,
        userRecord: userRecord,
      ),
    );
    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      TToastMessages.successToast(
        'Great! Your account has been created.',
      );
      return true;
    });
  }

  Future<bool> initiatePasswordRequest() async {
    final initiatePasswordReset = ref.read(initiatePasswordResetProvider);
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(true);
    final result = await initiatePasswordReset(
      InitiatePasswordResetParams(
        state.resetPasswordEmail,
      ),
    );
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      TToastMessages.successToast(
        'Password reset code has been sent to your email',
      );
      return true;
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

  Future<bool> resetPassword() async {
    final resetPasswordUseCase = ref.read(resetUserPasswordProvider);
    ref.read(resetPasswordLoadingProvider.notifier).setValue(true);
    final result = await resetPasswordUseCase(
      ResetUserPasswordParams(
        state.resetPasswordEmail,
        state.newPassword,
        state.passwordResetCode,
      ),
    );
    ref.read(resetPasswordLoadingProvider.notifier).setValue(false);
    return result.fold(
      (error) {
        TToastMessages.errorToast(error.message);
        return false;
      },
      (r) {
        return true;
      },
    );
  }

  Future<bool> searchNinRecord({
    required String ninNumber,
  }) async {
    final ninUseCase = ref.read(searchUserNinProvider);
    ref.read(searchNinLoadingProvider.notifier).setValue(true);
    final result = await ninUseCase(
      NinUseCaseParams(ninNumber),
    );
    ref.read(searchNinLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      if (r != null) {
        setFirstName(r.firstName ?? '');
        setMiddleName(r.middleName ?? '');
        setLastName(r.lastName ?? '');
        state.firstNameController.text = state.firstName;
        state.middleNameController.text = state.middleName;
        state.lastNameController.text = state.lastName;
        return true;
      } else {
        TToastMessages.errorToast('NIN already exists');
        return false;
      }
    });
  }
}
