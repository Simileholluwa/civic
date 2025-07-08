// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:civic_client/civic_client.dart';

class AuthState {
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
  AuthState({
    required this.email,
    required this.password,
    required this.politicalStatus,
    required this.verificationCode,
    required this.newPassword,
    required this.passwordResetCode,
    required this.newAccountPassword,
    required this.resetPasswordEmail,
    required this.acceptTerms,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.nin,
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
  });

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
      emailController: emailController ?? this.emailController,
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      middleNameController: middleNameController ?? this.middleNameController,
      passwordController: passwordController ?? this.passwordController,
      verificationCodeController: verificationCodeController ?? this.verificationCodeController,
      newPasswordController: newPasswordController ?? this.newPasswordController,
      passwordResetCodeController: passwordResetCodeController ?? this.passwordResetCodeController,
      newAccountPasswordController: newAccountPasswordController ?? this.newAccountPasswordController,
      resetPasswordEmailController: resetPasswordEmailController ?? this.resetPasswordEmailController,
      ninController: ninController ?? this.ninController,
      emailFormKey: emailFormKey ?? this.emailFormKey,
      ninFormKey: ninFormKey ?? this.ninFormKey,
      passwordFormKey: passwordFormKey ?? this.passwordFormKey,
      usernameFormKey: usernameFormKey ?? this.usernameFormKey,
      verificationCodeFormKey: verificationCodeFormKey ?? this.verificationCodeFormKey,
      newPasswordFormKey: newPasswordFormKey ?? this.newPasswordFormKey,
      passwordResetCodeFormKey: passwordResetCodeFormKey ?? this.passwordResetCodeFormKey,
      newAccountPasswordFormKey: newAccountPasswordFormKey ?? this.newAccountPasswordFormKey,
      resetPasswordEmailFormKey: resetPasswordEmailFormKey ?? this.resetPasswordEmailFormKey,
    );
  }

  factory AuthState.empty() {
    return AuthState(
      email: '',
      password: '',
      politicalStatus: PoliticalStatus.none,
      verificationCode: '',
      newPassword: '',
      passwordResetCode: '',
      newAccountPassword: '',
      resetPasswordEmail: '',
      acceptTerms: false,
      firstName: '',
      lastName: '',
      nin: '',
      middleName: '',
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
}
