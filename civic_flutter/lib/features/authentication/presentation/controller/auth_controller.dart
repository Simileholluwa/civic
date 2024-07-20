import 'dart:async';
import 'dart:io';

import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/helpers/image_helper.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/check_if_new_user_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/create_account_request_usecase.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/fetch_all_usernames_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/initiate_password_reset_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/logout_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/reset_user_password_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/search_user_nin_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/upload_profile_image_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/user_sign_in_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/validate_create_account_use_case.dart';
import 'package:civic_flutter/features/authentication/presentation/pages/authentication_landing_screen.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class AuthController extends GetxController {
  AuthController({
    required CreateAccountRequestUseCase createAccountRequest,
    required UserSignInUseCase signInUseCase,
    required ResetUserPasswordUseCase resetPasswordUseCase,
    required CheckIfNewUserUseCase checkIfNewUserUseCase,
    required ValidateCreateAccountUseCase validateCreateAccount,
    required LogoutUseCase logoutUseCase,
    required SearchUserNinUseCase ninUseCase,
    required FetchAllUsernamesUseCase usernamesUseCase,
    required InitiatePasswordResetUseCase initiatePasswordReset,
    required UploadProfileImageUseCase profileImageUseCase,
  })  : _createAccountRequest = createAccountRequest,
        _signInUseCase = signInUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _checkIfNewUserUseCase = checkIfNewUserUseCase,
        _validateCreateAccount = validateCreateAccount,
        _logoutUseCase = logoutUseCase,
        _ninUseCase = ninUseCase,
        _usernamesUseCase = usernamesUseCase,
        _profileImageUseCase = profileImageUseCase,
        _initiatePasswordReset = initiatePasswordReset;

  final CreateAccountRequestUseCase _createAccountRequest;
  final UserSignInUseCase _signInUseCase;
  final ResetUserPasswordUseCase _resetPasswordUseCase;
  final CheckIfNewUserUseCase _checkIfNewUserUseCase;
  final ValidateCreateAccountUseCase _validateCreateAccount;
  final LogoutUseCase _logoutUseCase;
  final SearchUserNinUseCase _ninUseCase;
  final FetchAllUsernamesUseCase _usernamesUseCase;
  final UploadProfileImageUseCase _profileImageUseCase;
  final InitiatePasswordResetUseCase _initiatePasswordReset;

  static AuthController get instance => Get.find();
  final state = AuthState();

  @override
  void onInit() {
    super.onInit();
    fetchAllUsernames();
    state
      ..usernameController = TextEditingController()
      ..signupPasswordController = TextEditingController()
      ..ninController = TextEditingController()
      ..pinController = TextEditingController()
      ..phoneNumberController = TextEditingController()
      ..fullNameController = TextEditingController()
      ..resetPasswordController = TextEditingController()
      ..verifyEmailController = TextEditingController()
      ..loginPasswordController = TextEditingController()
      ..emailPinController = TextEditingController()
      ..confirmPasswordController = TextEditingController()
      ..identityCodeController = TextEditingController()
      ..ninEmailPinController = TextEditingController()
      ..passwordResetPinController = TextEditingController()
      ..createNewPasswordController = TextEditingController()
      ..emailController = TextEditingController();
  }

  @override
  void onClose() {
    state.usernameController.dispose();
    state.signupPasswordController.dispose();
    state.ninController.dispose();
    state.pinController.dispose();
    state.phoneNumberController.dispose();
    state.fullNameController.dispose();
    state.resetPasswordController.dispose();
    state.verifyEmailController.dispose();
    state.loginPasswordController.dispose();
    state.emailController.dispose();
    state.emailPinController.dispose();
    state.confirmPasswordController.dispose();
    state.identityCodeController.dispose();
    state.ninEmailPinController.dispose();
    state.passwordResetPinController.dispose();
    state.createNewPasswordController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
  }

  void navigateToMenu() {
    Get.offAllNamed<dynamic>(AppRoutes.civic);
  }

  void checkEmailIfNewUser() {
    Get.toNamed<dynamic>(AppRoutes.checkIfNewUser);
  }

  void navigateToChooseUsername() {
    Get.toNamed<dynamic>(AppRoutes.chooseUsername);
  }

  void navigateToCheckEmailIfNewUser() {
    Get.offNamed<dynamic>(AppRoutes.checkIfNewUser);
    _logoutUseCase(NoParams());
  }

  void navigateToResetPassword() {
    Get.toNamed<dynamic>(
      AppRoutes.resetPassword,
      id: 1,
    );
  }

  void navigateToConfirmNinDetails() {
    Get.toNamed<dynamic>(
      AppRoutes.confirmNinDetails,
    );
  }

  void navigateToLogin() {
    Get.toNamed<dynamic>(
      AppRoutes.login,
    );
  }

  void navigateToVerifyEmail() {
    Get.toNamed<dynamic>(
      AppRoutes.verifyEmail,
    );
  }

  void navigateToVerifyPasswordResetCode() {
    Get.toNamed<dynamic>(
      AppRoutes.verifyResetPasswordCode,
      id: 1,
    );
  }

  void navigateToCreateNewPassword() {
    Get.toNamed<dynamic>(
      AppRoutes.createNewPassword,
      id: 1,
    );
  }

  void navigateToVerifyNinOTP() {
    Get.offNamed<dynamic>(
      AppRoutes.verifyNinOTP,
    );
  }

  void navigateToSignUp() {
    Get.toNamed<dynamic>(AppRoutes.signUp);
  }

  void navigateToVerifyNinEmail() {
    Get.offNamed<dynamic>(
      AppRoutes.verifyNinEmailOTP,
    );
  }

  void navigateToAuthLandingScreen() {
    Get.offAllNamed<dynamic>(AppRoutes.authLandingScreen);
  }

  void navigateToVerifyAccountScreen() {
    Get.toNamed<dynamic>(AppRoutes.verifyAccount);
  }

  Future<void> fetchAllUsernames() async {
    final result = await _usernamesUseCase(
      NoParams(),
    );
    result.fold(
      (l) {
        TToastMessages.errorToast(
          'Unable to fetch data from database',
        );
        return;
      },
      (r) => state.usernames.assignAll(
        r.map(
          (e) => e.toLowerCase(),
        ),
      ),
    );
  }

  void cancelTimer() {
    state.timer?.cancel();
  }

  void startTimer(int timerSeconds) {
    const duration = Duration(
      seconds: 1,
    );
    state
      ..secondsLeft = timerSeconds
      ..timer = Timer.periodic(
        duration,
        (Timer timer) {
          if (state.secondsLeft == 1) {
            cancelTimer();
            state.canRetry.value = true;
          } else {
            state.canRetry.value = false;
            final minutes = state.secondsLeft ~/ 60;
            final seconds = state.secondsLeft % 60;
            state.time.value = "${minutes.toString().padLeft(
                  2,
                  '0',
                )}:${seconds.toString().padLeft(
                  2,
                  '0',
                )}";
            state.secondsLeft--;
          }
        },
      );
  }

  String redactString(String original, int redactLength, {int start = 3}) {
    final length = original.length;
    final redactedPart = original.substring(start, length - redactLength);
    return original.replaceRange(
      start,
      length - redactLength,
      '*' * redactedPart.length,
    );
  }

  String redactEmail(String email) {
    if (email.length <= 3) {
      return email;
    }

    final atIndex = email.indexOf('@');
    var redactedPart = '';
    for (var i = 0; i < atIndex - 3 && i < 5; i++) {
      // ignore: use_string_buffers
      redactedPart += '*';
    }

    return email.substring(0, 3) + redactedPart + email.substring(atIndex);
  }

  Future<void> navigateToAuthLanding() async {
    final result = await _logoutUseCase(
      NoParams(),
    );
    result.fold((l) => null, (r) {
      Get.offAll<dynamic>(
        AuthLandingScreen.new,
        transition: Transition.downToUp,
      );
    });
  }

  Future<void> createAccountRequest() async {
    final isValid = state.formKeySignUp.currentState!.validate();
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    if (!isValid) return;
    if (state.acceptTerms.isFalse) {
      TToastMessages.infoToast(
        'Please read and accept privacy policy and terms of use',
      );
      return;
    }
    state.isLoadingSignUp.value = true;
    final result = await _createAccountRequest(
      CreateAccountRequestParams(
        state.signupPasswordController.text.trim(),
        state.emailController.text.trim().toLowerCase(),
        state.usernameController.text.trim().capitalizeFirst!,
      ),
    );
    state.isLoadingSignUp.value = false;
    result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
    }, (r) {
      TToastMessages.successToast(
        'A verification code has been sent to your email',
      );
      navigateToVerifyEmail();
    });
  }

  Future<void> signInWithEmailAndPassword() async {
    final isValid = state.formKeySignIn.currentState!.validate();
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    if (!isValid) return;
    state.isLoadingSignIn.value = true;
    final result = await _signInUseCase(
      UserSignInParams(
        state.loginPasswordController.text.trim(),
        state.emailController.text.trim().toLowerCase(),
      ),
    );
    state.isLoadingSignIn.value = false;
    result.fold((l) => TToastMessages.errorToast(l.message), (r) {
      if (r != null && r.verifiedAccount!) {
        navigateToMenu();
      } else if (r != null && !r.verifiedAccount!) {
        navigateToVerifyAccountScreen();
      }
    });
  }

  void removeImage() {
    state.profileImage.clear();
    update([15]);
  }

  Future<void> takeImage() async {
    final imageHelper = ImageHelper();
    final image = await imageHelper.takeImage();
    if (image != null) {
      final cropImage = await imageHelper.crop(
        file: File(
          image.path,
        ),
        cropStyle: CropStyle.circle,
      );
      if (cropImage != null) {
        if (state.profileImage.isNotEmpty) {
          state.profileImage.clear();
        }
        state.profileImage.add(
          File(cropImage.path),
        );
        update([15]);
      } else {
        state.profileImage.add(
          File(image.path),
        );
        update([15]);
      }
    }
  }

  Future<void> resetPassword() async {
    final isValid = state.formKeyResetPassword.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    state.isLoadingResetPassword.value = true;
    final result = await _resetPasswordUseCase(
      ResetUserPasswordParams(
        state.resetPasswordController.text.trim(),
        state.createNewPasswordController.text.trim(),
        state.passwordResetPinController.text.trim(),
      ),
    );
    state.isLoadingResetPassword.value = false;
    result.fold(
      (l) => TToastMessages.errorToast(l.message),
      (r) {
        TToastMessages.successToast(
          'Your password has been reset.',
        );
        Get
          ..back(
            id: 1,
          )
          ..back(
            id: 1,
          )
          ..back(
            id: 1,
          );
      },
    );
  }

  Future<void> checkIfNewUser() async {
    final isValid = state.formKeyEmail.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    state.isLoadingCheckUser.value = true;
    if (state.usernames.isEmpty) {
      await fetchAllUsernames();
    }
    final result = await _checkIfNewUserUseCase(
      CheckIfNewUserParams(
        state.emailController.text.trim().toLowerCase(),
      ),
    );
    state.isLoadingCheckUser.value = false;
    result.fold((l) => TToastMessages.errorToast(l.message), (r) {
      if (r != null) {
        state.userName.value = r;
        navigateToLogin();
      } else {
        navigateToChooseUsername();
      }
    });
  }

  Future<void> validateCreateAccount({
    required bool shouldNavigate,
  }) async {
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    state.isLoadingVerifyEmail.value = true;
    final result = await _validateCreateAccount(
      ValidateCreateAccountParams(
        code: state.emailPinController.text.trim(),
        email: state.emailController.text.trim().toLowerCase(),
      ),
    );
    state.isLoadingVerifyEmail.value = false;
    result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
    }, (r) {
      navigateToVerifyAccountScreen();
    });
  }

  Future<void> initiatePasswordRequest({
    required bool shouldNavigate,
  }) async {
    final isValid = state.formKeyResetPassword.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    state.isLoadingResetPassword.value = true;
    final result = await _initiatePasswordReset(
      InitiatePasswordResetParams(
        state.resetPasswordController.text.trim(),
      ),
    );
    state.isLoadingResetPassword.value = false;
    result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
    }, (r) {
      TToastMessages.successToast(
        'Verification code has been sent to your email',
      );
      startTimer(120);
      if (shouldNavigate) {
        navigateToVerifyPasswordResetCode();
      }
    });
  }

  Future<void> searchNinRecord() async {
    final isValid = state.formKeyNin.currentState!.validate();
    if (!isValid) return;
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    state.isLoadingSearchNin.value = true;
    final result = await _ninUseCase(
      NinUseCaseParams(
        state.ninController.text.trim(),
      ),
    );
    state.isLoadingSearchNin.value = false;
    result.fold((l) {
      TToastMessages.errorToast(l.message);
    }, (r) {
      if (r != null) {
        state.userNinEntity?.value = r;
        navigateToConfirmNinDetails();
      } else {
        TToastMessages.errorToast('Unable to retrieve NIN data');
      }
    });
  }

  Future<void> cropImage() async {
    final imageHelper = ImageHelper();
    final cropImage = await imageHelper.crop(
      file: state.profileImage[0],
      cropStyle: CropStyle.circle,
    );
    if (cropImage != null) {
      if (state.profileImage.isNotEmpty) {
        state.profileImage.clear();
      }
      state.profileImage.add(
        File(cropImage.path),
      );
      update([15]);
    }
  }

  Future<void> selectImage() async {
    final imageHelper = ImageHelper();
    final file = await imageHelper.pickImage();
    if (file == null) {
      return;
    } else {
      final cropImage = await imageHelper.crop(
        file: File(
          file.first!.path,
        ),
        cropStyle: CropStyle.circle,
      );
      if (cropImage != null) {
        if (state.profileImage.isNotEmpty) {
          state.profileImage.clear();
        }
        state.profileImage.add(
          File(cropImage.path),
        );
        update([15]);
      } else {
        state.profileImage.add(
          File(file[0]!.path),
        );
        update([15]);
      }
    }
  }

  Future<void> uploadProfileImageToFirebase() async {
    if (state.profileImage.isEmpty) {
      TToastMessages.errorToast(
        'Please select an image from your gallery',
      );
      return;
    }
    final isConnected = await TDeviceUtils.hasInternetConnection();
    if (!isConnected) {
      TToastMessages.infoToast(
        'No internet connection',
      );
    }
    state.isLoadingUploadImage.value = true;
    final result = await _profileImageUseCase(
      UploadProfileImageParams(
        state.profileImage.first.path,
      ),
    );
    state.isLoadingUploadImage.value = false;
    result.fold((l) {
      TToastMessages.errorToast(
        l.message,
      );
    }, (r) {
      Get.back<dynamic>();
      TToastMessages.successToast(
        'Profile image successfully uploaded.',
      );
    });
  }
}
