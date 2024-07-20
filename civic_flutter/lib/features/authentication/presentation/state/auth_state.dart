import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AuthState {
  late TextEditingController loginPasswordController;
  late TextEditingController resetPasswordController;
  late TextEditingController usernameController;
  late TextEditingController signupPasswordController;
  late TextEditingController createNewPasswordController;
  late TextEditingController ninController;
  late TextEditingController pinController;
  late TextEditingController phoneNumberController;
  late TextEditingController fullNameController;
  late TextEditingController verifyEmailController;
  late TextEditingController emailController;
  late TextEditingController emailPinController;
  late TextEditingController confirmPasswordController;
  late TextEditingController identityCodeController;
  late TextEditingController ninEmailPinController;
  late TextEditingController passwordResetPinController;

  GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyNin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyNinPhoneNumber = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyVerifyEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyVerifyNin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyVerifyNinEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyUsername = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyNewPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyVerifyPasswordResetCode = GlobalKey<FormState>();

  RxBool isLoadingSignUp = false.obs;
  RxBool isLoadingSignIn = false.obs;
  RxBool isLoadingCheckUser = false.obs;
  RxBool isLoadingVerifyEmail = false.obs;
  RxBool isLoadingUploadImage = false.obs;
  RxBool isLoadingSearchNin = false.obs;
  RxBool isLoadingResetPassword = false.obs;
  RxBool isLoadingVerifyEmailCode = false.obs;
  RxBool isLoadingSendPhoneCode = false.obs;
  RxBool isLoadingVerifyPhoneCode = false.obs;
  RxBool isLoadingResendPhoneCode = false.obs;
  RxBool isLoadingSendNinCode = false.obs;
  RxBool isLoadingCreateNewPassword = false.obs;

  RxBool showPassword = false.obs;
  RxBool showPasswordSignUp = false.obs;
  RxBool acceptTerms = false.obs;
  RxBool canRetry = true.obs;
  RxBool fromAuth = true.obs;
  RxInt selectionVerificationMethod = 1.obs;
  RxString profilePicture = ''.obs;
  RxString userName = ''.obs;
  Rx<UserNinRecord>? userNinEntity;

  Timer? timer;
  int secondsLeft = 1;
  final time = '00.00'.obs;
  RxInt numberOfTries = 0.obs;
  RxString displayName = ''.obs;
  RxList<File> profileImage = <File>[].obs;
  RxList<String> usernames = <String>[].obs;
}
