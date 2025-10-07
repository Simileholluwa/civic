import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
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
