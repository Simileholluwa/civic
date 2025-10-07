import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';

class AuthState {
  AuthState({
    required this.emailController,
    required this.firstNameController,
    required this.lastNameController,
    required this.middleNameController,
    required this.passwordController,
    required this.verificationCodeController,
    required this.newPasswordController,
    required this.passwordResetCodeController,
    required this.newAccountPasswordController,
    required this.resetPasswordEmailController,
    required this.ninController,
    required this.emailFormKey,
    required this.ninFormKey,
    required this.passwordFormKey,
    required this.usernameFormKey,
    required this.verificationCodeFormKey,
    required this.newPasswordFormKey,
    required this.passwordResetCodeFormKey,
    required this.newAccountPasswordFormKey,
    required this.resetPasswordEmailFormKey,
    this.imagePath = '',
    this.email = '',
    this.password = '',
    this.politicalStatus = PoliticalStatus.none,
    this.verificationCode = '',
    this.newPassword = '',
    this.passwordResetCode = '',
    this.newAccountPassword = '',
    this.resetPasswordEmail = '',
    this.acceptTerms = false,
    this.firstName = '',
    this.lastName = '',
    this.middleName = '',
    this.nin = '',
    this.checkEmailLoading = false,
    this.signInLoading = false,
    this.createAccountLoading = false,
    this.validatCreateAccountLoading = false,
    this.initiatePasswordResetLoading = false,
    this.initiateResendPasswordResetLoading = false,
    this.searchNinLoading = false,
    this.resetPasswordLoading = false,
    this.photoUrlLoading = false,
  });

  factory AuthState.empty() {
    return AuthState(
      emailController: TextEditingController(),
      ninController: TextEditingController(),
      passwordController: TextEditingController(),
      verificationCodeController: TextEditingController(),
      newPasswordController: TextEditingController(),
      passwordResetCodeController: TextEditingController(),
      newAccountPasswordController: TextEditingController(),
      firstNameController: TextEditingController(),
      lastNameController: TextEditingController(),
      middleNameController: TextEditingController(),
      resetPasswordEmailController: TextEditingController(),
      emailFormKey: GlobalKey<FormState>(),
      ninFormKey: GlobalKey<FormState>(),
      passwordFormKey: GlobalKey<FormState>(),
      usernameFormKey: GlobalKey<FormState>(),
      verificationCodeFormKey: GlobalKey<FormState>(),
      newPasswordFormKey: GlobalKey<FormState>(),
      passwordResetCodeFormKey: GlobalKey<FormState>(),
      newAccountPasswordFormKey: GlobalKey<FormState>(),
      resetPasswordEmailFormKey: GlobalKey<FormState>(),
    );
  }
  final String email;
  final String password;
  final PoliticalStatus politicalStatus;
  final String verificationCode;
  final String newPassword;
  final String passwordResetCode;
  final String newAccountPassword;
  final String resetPasswordEmail;
  final bool acceptTerms;
  final String firstName;
  final String lastName;
  final String middleName;
  final String nin;
  final String imagePath;
  final bool checkEmailLoading;
  final bool signInLoading;
  final bool createAccountLoading;
  final bool validatCreateAccountLoading;
  final bool initiatePasswordResetLoading;
  final bool initiateResendPasswordResetLoading;
  final bool searchNinLoading;
  final bool resetPasswordLoading;
  final bool photoUrlLoading;
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController middleNameController;
  final TextEditingController passwordController;
  final TextEditingController verificationCodeController;
  final TextEditingController newPasswordController;
  final TextEditingController passwordResetCodeController;
  final TextEditingController newAccountPasswordController;
  final TextEditingController resetPasswordEmailController;
  final TextEditingController ninController;
  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> ninFormKey;
  final GlobalKey<FormState> passwordFormKey;
  final GlobalKey<FormState> usernameFormKey;
  final GlobalKey<FormState> verificationCodeFormKey;
  final GlobalKey<FormState> newPasswordFormKey;
  final GlobalKey<FormState> passwordResetCodeFormKey;
  final GlobalKey<FormState> newAccountPasswordFormKey;
  final GlobalKey<FormState> resetPasswordEmailFormKey;

  AuthState copyWith({
    String? email,
    String? password,
    PoliticalStatus? politicalStatus,
    String? verificationCode,
    String? newPassword,
    String? passwordResetCode,
    String? newAccountPassword,
    String? resetPasswordEmail,
    bool? acceptTerms,
    String? firstName,
    String? lastName,
    String? middleName,
    String? nin,
    bool? checkEmailLoading,
    bool? signInLoading,
    bool? createAccountLoading,
    bool? validatCreateAccountLoading,
    bool? initiatePasswordResetLoading,
    bool? initiateResendPasswordResetLoading,
    bool? searchNinLoading,
    bool? resetPasswordLoading,
    String? imagePath,
    bool? photoUrlLoading,
    TextEditingController? emailController,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? middleNameController,
    TextEditingController? passwordController,
    TextEditingController? verificationCodeController,
    TextEditingController? newPasswordController,
    TextEditingController? passwordResetCodeController,
    TextEditingController? newAccountPasswordController,
    TextEditingController? resetPasswordEmailController,
    TextEditingController? ninController,
    GlobalKey<FormState>? emailFormKey,
    GlobalKey<FormState>? ninFormKey,
    GlobalKey<FormState>? passwordFormKey,
    GlobalKey<FormState>? usernameFormKey,
    GlobalKey<FormState>? verificationCodeFormKey,
    GlobalKey<FormState>? newPasswordFormKey,
    GlobalKey<FormState>? passwordResetCodeFormKey,
    GlobalKey<FormState>? newAccountPasswordFormKey,
    GlobalKey<FormState>? resetPasswordEmailFormKey,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      politicalStatus: politicalStatus ?? this.politicalStatus,
      verificationCode: verificationCode ?? this.verificationCode,
      newPassword: newPassword ?? this.newPassword,
      passwordResetCode: passwordResetCode ?? this.passwordResetCode,
      newAccountPassword: newAccountPassword ?? this.newAccountPassword,
      resetPasswordEmail: resetPasswordEmail ?? this.resetPasswordEmail,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      nin: nin ?? this.nin,
      photoUrlLoading: photoUrlLoading ?? this.photoUrlLoading,
      imagePath: imagePath ?? this.imagePath,
      signInLoading: signInLoading ?? this.signInLoading,
      createAccountLoading: createAccountLoading ?? this.createAccountLoading,
      validatCreateAccountLoading:
          validatCreateAccountLoading ?? this.validatCreateAccountLoading,
      initiatePasswordResetLoading:
          initiatePasswordResetLoading ?? this.initiatePasswordResetLoading,
      initiateResendPasswordResetLoading: initiateResendPasswordResetLoading ??
          this.initiateResendPasswordResetLoading,
      searchNinLoading: searchNinLoading ?? this.searchNinLoading,
      resetPasswordLoading: resetPasswordLoading ?? this.resetPasswordLoading,
      checkEmailLoading: checkEmailLoading ?? this.checkEmailLoading,
      emailController: emailController ?? this.emailController,
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      middleNameController: middleNameController ?? this.middleNameController,
      passwordController: passwordController ?? this.passwordController,
      verificationCodeController:
          verificationCodeController ?? this.verificationCodeController,
      newPasswordController:
          newPasswordController ?? this.newPasswordController,
      passwordResetCodeController:
          passwordResetCodeController ?? this.passwordResetCodeController,
      newAccountPasswordController:
          newAccountPasswordController ?? this.newAccountPasswordController,
      resetPasswordEmailController:
          resetPasswordEmailController ?? this.resetPasswordEmailController,
      ninController: ninController ?? this.ninController,
      emailFormKey: emailFormKey ?? this.emailFormKey,
      ninFormKey: ninFormKey ?? this.ninFormKey,
      passwordFormKey: passwordFormKey ?? this.passwordFormKey,
      usernameFormKey: usernameFormKey ?? this.usernameFormKey,
      verificationCodeFormKey:
          verificationCodeFormKey ?? this.verificationCodeFormKey,
      newPasswordFormKey: newPasswordFormKey ?? this.newPasswordFormKey,
      passwordResetCodeFormKey:
          passwordResetCodeFormKey ?? this.passwordResetCodeFormKey,
      newAccountPasswordFormKey:
          newAccountPasswordFormKey ?? this.newAccountPasswordFormKey,
      resetPasswordEmailFormKey:
          resetPasswordEmailFormKey ?? this.resetPasswordEmailFormKey,
    );
  }
}
