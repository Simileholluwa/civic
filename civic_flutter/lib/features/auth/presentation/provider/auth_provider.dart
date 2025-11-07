import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  // Move imperative UI objects (controllers/keys) into the notifier.
  // Controllers
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _firstNameController =
      TextEditingController();
  late final TextEditingController _lastNameController =
      TextEditingController();
  late final TextEditingController _middleNameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _verificationCodeController =
      TextEditingController();
  late final TextEditingController _newPasswordController =
      TextEditingController();
  late final TextEditingController _passwordResetCodeController =
      TextEditingController();
  late final TextEditingController _newAccountPasswordController =
      TextEditingController();
  late final TextEditingController _resetPasswordEmailController =
      TextEditingController();
  late final TextEditingController _ninController = TextEditingController();

  // Form keys
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _ninFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _usernameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _verificationCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _newPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordResetCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _newAccountPasswordFormKey =
      GlobalKey<FormState>();
  final GlobalKey<FormState> _resetPasswordEmailFormKey =
      GlobalKey<FormState>();

  // Getters for UI access without triggering state watches
  TextEditingController get emailController => _emailController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get middleNameController => _middleNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get verificationCodeController =>
      _verificationCodeController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get passwordResetCodeController =>
      _passwordResetCodeController;
  TextEditingController get newAccountPasswordController =>
      _newAccountPasswordController;
  TextEditingController get resetPasswordEmailController =>
      _resetPasswordEmailController;
  TextEditingController get ninController => _ninController;

  GlobalKey<FormState> get emailFormKey => _emailFormKey;
  GlobalKey<FormState> get ninFormKey => _ninFormKey;
  GlobalKey<FormState> get passwordFormKey => _passwordFormKey;
  GlobalKey<FormState> get usernameFormKey => _usernameFormKey;
  GlobalKey<FormState> get verificationCodeFormKey => _verificationCodeFormKey;
  GlobalKey<FormState> get newPasswordFormKey => _newPasswordFormKey;
  GlobalKey<FormState> get passwordResetCodeFormKey =>
      _passwordResetCodeFormKey;
  GlobalKey<FormState> get newAccountPasswordFormKey =>
      _newAccountPasswordFormKey;
  GlobalKey<FormState> get resetPasswordEmailFormKey =>
      _resetPasswordEmailFormKey;

  @override
  AuthState build() {
    // Ensure controllers are disposed when provider is destroyed
    ref.onDispose(() {
      _emailController.dispose();
      _firstNameController.dispose();
      _lastNameController.dispose();
      _middleNameController.dispose();
      _passwordController.dispose();
      _verificationCodeController.dispose();
      _newPasswordController.dispose();
      _passwordResetCodeController.dispose();
      _newAccountPasswordController.dispose();
      _resetPasswordEmailController.dispose();
      _ninController.dispose();
    });
    return AuthState.empty();
  }

  final imageHelper = ImageHelper();

  void setCheckEmailLoading(bool value) {
    state = state.copyWith(checkEmailLoading: value);
  }

  void setSignInLoading(bool value) {
    state = state.copyWith(signInLoading: value);
  }

  void setCreateAccountLoading(bool value) {
    state = state.copyWith(createAccountLoading: value);
  }

  void setValidatCreateAccountLoading(bool value) {
    state = state.copyWith(validatCreateAccountLoading: value);
  }

  void setInitiatePasswordResetLoading(bool value) {
    state = state.copyWith(initiatePasswordResetLoading: value);
  }

  void setResetPasswordLoading(bool value) {
    state = state.copyWith(resetPasswordLoading: value);
  }

  void setEmail(String email) {
    if (state.email == email) return;
    state = state.copyWith(email: email);
  }

  void setFirstName(String firstName) {
    if (state.firstName == firstName) return;
    state = state.copyWith(
      firstName: firstName,
    );
  }

  void setNin(String nin) {
    if (state.nin == nin) return;
    state = state.copyWith(nin: nin);
  }

  void setLastName(String lastName) {
    if (state.lastName == lastName) return;
    state = state.copyWith(lastName: lastName);
  }

  void setMiddleName(String middleName) {
    if (state.middleName == middleName) return;
    state = state.copyWith(middleName: middleName);
  }

  void setPassword(String password) {
    if (state.password == password) return;
    state = state.copyWith(password: password);
  }

  void setPoliticalStatus(PoliticalStatus politicalStatus) {
    state = state.copyWith(politicalStatus: politicalStatus);
  }

  void setNewAccountPassword(String password) {
    if (state.newAccountPassword == password) return;
    state = state.copyWith(newAccountPassword: password);
  }

  void setVerificationCode(String code) {
    if (state.verificationCode == code) return;
    state = state.copyWith(verificationCode: code);
  }

  void setResetPasswordEmail(String email) {
    if (state.resetPasswordEmail == email) return;
    state = state.copyWith(resetPasswordEmail: email);
  }

  void setPasswordResetCode(String code) {
    if (state.passwordResetCode == code) return;
    state = state.copyWith(passwordResetCode: code);
  }

  void setNewPassword(String password) {
    if (state.newPassword == password) return;
    state = state.copyWith(newPassword: password);
  }

  void toggleAcceptTerms(bool value) {
    if (state.acceptTerms == value) return;
    state = state.copyWith(acceptTerms: value);
  }

  // Alias with correct spelling for forward-compatibility; keeps old API intact
  void setValidateCreateAccountLoading(bool value) {
    setValidatCreateAccountLoading(value);
  }

  void clearImage() {
    state = state.copyWith(imagePath: '');
  }

  void setPhotoUrlLoading(bool value) {
    state = state.copyWith(photoUrlLoading: value);
  }

  Future<void> pickImage() async {
    final image = await imageHelper.pickImage();
    if (image != null) {
      state = state.copyWith(
        imagePath: image.first.path,
      );
    }
  }

  Future<void> takePicture() async {
    final image = await imageHelper.takeImage();
    if (image != null) {
      state = state.copyWith(
        imagePath: image.path,
      );
    }
  }

  Future<void> editImage() async {
    final image = await imageHelper.crop(
      file: File(state.imagePath),
      cropStyle: CropStyle.circle,
    );
    if (image != null) {
      state = state.copyWith(
        imagePath: image.path,
      );
    }
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
      ref
        ..invalidate(paginatedProjectListProvider)
        ..invalidate(paginatedPostListProvider)
        ..invalidate(paginatedNotificationsListProvider);
      return true;
    });
  }

  Future<bool> signInWithEmailAndPassword() async {
    final signInUseCase = ref.read(userSignInProvider);
    setSignInLoading(true);
    final result = await signInUseCase(
      UserSignInParams(
        email: state.email,
        password: state.password,
      ),
    );
    setSignInLoading(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (_) {
      return true;
    });
  }

  Future<bool?> checkIfNewUser() async {
    final newUserUseCase = ref.read(checkIfNewUserProvider);
    setCheckEmailLoading(true);
    final result = await newUserUseCase(
      state.email,
    );
    setCheckEmailLoading(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return null;
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
    setCreateAccountLoading(true);
    final result = await createAccountRequest(
      CreateAccountRequestParams(
        password: state.newAccountPassword,
        email: state.email,
        firstName: state.firstName,
      ),
    );
    setCreateAccountLoading(false);
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

    setValidatCreateAccountLoading(true);
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
    setValidatCreateAccountLoading(false);
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
    setInitiatePasswordResetLoading(true);
    final result = await initiatePasswordReset(
      state.resetPasswordEmail,
    );
    setInitiatePasswordResetLoading(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      ref.read(countdownTimerProvider.notifier).resetTimer();
      return false;
    }, (r) {
      TToastMessages.successToast(
        'Password reset code has been sent to your email',
      );
      ref.read(countdownTimerProvider.notifier).startCountdown();
      return true;
    });
  }

  Future<bool> resetPassword() async {
    final resetPasswordUseCase = ref.read(resetUserPasswordProvider);
    setResetPasswordLoading(true);
    final result = await resetPasswordUseCase(
      ResetUserPasswordParams(
        email: state.resetPasswordEmail,
        password: state.newPassword,
        verificationCode: state.passwordResetCode,
      ),
    );
    setResetPasswordLoading(false);
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
    ref.read(searchNinLoadingProvider.notifier).value = true;
    final result = await ninUseCase(
      ninNumber,
    );
    ref.read(searchNinLoadingProvider.notifier).value = false;
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      if (r != null) {
        setFirstName(r.firstName ?? '');
        setMiddleName(r.middleName ?? '');
        setLastName(r.lastName ?? '');
        _firstNameController.text = state.firstName;
        _middleNameController.text = state.middleName;
        _lastNameController.text = state.lastName;
        return true;
      } else {
        TToastMessages.errorToast('NIN already exists');
        return false;
      }
    });
  }

  Future<bool> uploadProfileImage() async {
    final uploadImageUseCase = ref.read(uploadProfileImageProvider);
    setPhotoUrlLoading(true);
    final result = await uploadImageUseCase(
      state.imagePath,
    );
    setPhotoUrlLoading(false);
    return result.fold((l) {
      TToastMessages.errorToast(l.message);
      return false;
    }, (r) {
      TToastMessages.successToast('Profile image uploaded');
      return true;
    });
  }
}
