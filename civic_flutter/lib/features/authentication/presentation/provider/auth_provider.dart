// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/providers/api_client_provider.dart';
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
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    init();
    return AuthStateBooting();
  }

  Future<void> init() async {
    final sessionManager = ref.read(sessionProvider);
    await sessionManager.initialize();
    await currentUser();
    FlutterNativeSplash.remove();
  }

  void setUser(UserRecord userRecord) {
    state = AuthStateSuccess(
      userRecord: userRecord,
    );
  }

  void logOutUser() {
    state = AuthStateGuest();
  }

  Future<void> currentUser() async {
    final currentUser = ref.read(currentUserProvider);
    final result = await currentUser(
      NoParams(),
    );
    result.fold((error) {
      state = AuthStateError(
        error: error.message,
      );
    }, (userRecord) {
      if (userRecord == null) {
        state = AuthStateGuest();
      } else {
        state = AuthStateSuccess(
          userRecord: userRecord,
        );
      }
    });
  }

  Future<void> logout() async {
    final logOutUseCase = ref.read(logOutProvider);
    final result = await logOutUseCase(
      NoParams(),
    );
    result.fold(
        (error) => state = const AuthStateError(
              error: 'Something went wrong',
            ), (r) {
      logOutUser();
    });
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required GlobalKey<FormState> formKey,
  }) async {
    final signInUseCase = ref.read(userSignInProvider);
    final isValid = formKey.currentState!.validate();
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      state = const AuthStateError(error: 'No internet connection');
      return;
    }
    if (!isValid) return;
    state = AuthStateLoading();
    final result = await signInUseCase(
      UserSignInParams(
        email,
        password,
      ),
    );
    state = AuthStateNotLoading();
    result.fold((error) => state = AuthStateError(error: error.message),
        (userRecord) {
      if (userRecord != null && userRecord.verifiedAccount!) {
        state = AuthStateSuccess(userRecord: userRecord);
      } else if (userRecord != null && !userRecord.verifiedAccount!) {
        state = AuthStateVerifyAccount();
      }
    });
  }

  Future<void> checkIfNewUser({
    required String email,
    required GlobalKey<FormState> formKey,
  }) async {
    final newUserUseCase = ref.read(checkIfNewUserProvider);
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      state = const AuthStateError(error: 'No internet connection');
      return;
    }
    state = AuthStateLoading();
    final result = await newUserUseCase(
      CheckIfNewUserParams(
        email,
      ),
    );
    state = AuthStateNotLoading();
    result.fold((error) => state = AuthStateError(error: error.message),
        (username) {
      if (username != null) {
        state = AuthStateLogin(
          username: username,
          email: email,
        );
      } else {
        state = AuthStatePoliticalStatus(
          email: email,
        );
      }
    });
  }

  Future<List<String>> fetchAllUsernames() async {
    final usernameUseCase = ref.read(fetchAllUsernamesProvider);
    final result = await usernameUseCase(
      NoParams(),
    );
    final usernames = <String>[];
    result.fold(
      (l) => null,
      (usernames) => usernames = usernames,
    );
    return usernames;
  }

  Future<void> createAccountRequest({
    required GlobalKey<FormState> formKey,
    required bool acceptTerms,
    required String password,
    required String email,
    required String username,
    required int politicalStatus,
  }) async {
    final isValid = formKey.currentState!.validate();
    final createAccountRequest = ref.read(createAccountRequestProvider);
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      state = const AuthStateError(error: 'No internet connection');
      return;
    }

    if (!acceptTerms) {
      state = const AuthStateError(
        error: 'Please read and accept privacy policy and terms of use',
      );
      return;
    }
    state = AuthStateLoading();
    final result = await createAccountRequest(
      CreateAccountRequestParams(
        password,
        email,
        username,
      ),
    );
    state = AuthStateNotLoading();
    result.fold((l) {
      state = AuthStateError(
        error: l.message,
      );
    }, (r) {
      state = const AuthStateSuccessfulRequest(
        successMessage: 'A verification code has been sent to your email',
      );
      state = AuthStateVerificationCode(
        email: email,
        password: password,
        username: username,
        politicalStatus: politicalStatus,
      );
    });
  }

  void navigateToChooseUsername(
    String email,
    int politicalStatus,
  ) {
    state = AuthStateUsername(email: email, politicalStatus: politicalStatus);
  }

  void navigateToCheckIfNewUser() {
    state = AuthStateCheckIfNewUser();
  }

  void navigateToMenu() {
    state = AuthStateMenu();
  }

  void navigateToCreateAccount(
    String email,
    int politicalStatus,
    String username, {
    required GlobalKey<FormState> formKey,
  }) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    state = AuthStateCreateAccount(
      email: email,
      politicalStatus: politicalStatus,
      username: username,
    );
  }

  Future<void> validateCreateAccount({
    required String code,
    required String email,
    required int politicalStatus,
  }) async {
    final isConnected = await TDeviceUtils.hasInternetConnection();
    final validateAccount = ref.read(validateCreateAccountProvider);
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
      return;
    }
    state = AuthStateLoading();
    final result = await validateAccount(
      ValidateCreateAccountParams(
        code: code,
        email: email,
        politicalStatus: PoliticalStatus.fromJson(0),
      ),
    );
    state = AuthStateNotLoading();
    result.fold((error) {
      state = AuthStateError(
        error: error.message,
      );
    }, (r) {
      state = const AuthStateSuccessfulRequest(
        successMessage: 'Your account has been verified',
      );
      state = AuthStateVerifyAccount();
    });
  }

  Future<void> initiatePasswordRequest({
    required String email,
    required GlobalKey<FormState> formKey,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      state = const AuthStateError(error: 'No internet connection');
      return;
    }
    final initiatePasswordReset = ref.read(initiatePasswordResetProvider);
    state = AuthStateLoading();
    final result = await initiatePasswordReset(
      InitiatePasswordResetParams(
        email,
      ),
    );
    state = AuthStateNotLoading();
    result.fold((error) {
      state = AuthStateError(
        error: error.message,
      );
    }, (r) {
      state = const AuthStateSuccessfulRequest(
        successMessage: 'Verification code has been sent to your email',
      );
      state = AuthStateVerifyPasswordReset(
        email: email,
      );
    });
  }

  void navigateToResetPassword(
    String email,
  ) {
    state = AuthStateInitiatePasswordReset(
      email: email,
    );
  }

  navigateToCreateNewPassword(
    String code,
    email,
  ) {
    state = AuthStateNewPassword(
      code: code,
      email: email,
    );
  }

  Future<void> resetPassword({
    required GlobalKey<FormState> formKey,
    required String email,
    required String newPassword,
    required String code,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      state = const AuthStateError(
        error: 'No internet connection',
      );
      return;
    }
    final resetPasswordUseCase = ref.read(resetUserPasswordProvider);
    state = AuthStateLoading();
    final result = await resetPasswordUseCase(
      ResetUserPasswordParams(
        email,
        newPassword,
        code,
      ),
    );
    state = AuthStateNotLoading();
    result.fold(
      (error) => state = AuthStateError(error: error.message),
      (r) {
        state = const AuthStateSuccessfulRequest(
          successMessage: 'Your password has been reset.',
        );
        logOutUser();
      },
    );
  }

  Future<void> searchNinRecord({
    required String ninNumber,
    required GlobalKey<FormState> formKey,
  }) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      state = const AuthStateError(
        error: 'No internet connection',
      );
      return;
    }
    final ninUseCase = ref.read(searchUserNinProvider);
    state = AuthStateLoading();
    final result = await ninUseCase(
      NinUseCaseParams(ninNumber),
    );
    state = AuthStateNotLoading();
    result.fold(
        (error) => state = AuthStateError(
              error: error.message,
            ), (r) {
      if (r != null) {
        state = AuthStateNin(ninRecord: r.toString(),);
      } else {
        state = const AuthStateError(
          error: 'Nin already in use',
        );
      }
    });
  }
}
