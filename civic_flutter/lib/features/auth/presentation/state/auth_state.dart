// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';

class AuthState {
  final String email;
  final String password;
  final String username;
  final PoliticalStatus politicalStatus;
  final String verificationCode;
  final String newPassword;
  final String passwordResetCode;
  final String newAccountPassword;
  final String resetPasswordEmail;
  final bool acceptTerms;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController verificationCodeController;
  final TextEditingController newPasswordController;
  final TextEditingController passwordResetCodeController;
  final TextEditingController newAccountPasswordController;
  final TextEditingController resetPasswordEmailController;
  final GlobalKey<FormState> emailFormKey;
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
    required this.username,
    required this.politicalStatus,
    required this.verificationCode,
    required this.newPassword,
    required this.passwordResetCode,
    required this.newAccountPassword,
    required this.resetPasswordEmail,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.verificationCodeController,
    required this.newPasswordController,
    required this.passwordResetCodeController,
    required this.newAccountPasswordController,
    required this.emailFormKey,
    required this.passwordFormKey,
    required this.usernameFormKey,
    required this.verificationCodeFormKey,
    required this.newPasswordFormKey,
    required this.passwordResetCodeFormKey,
    required this.newAccountPasswordFormKey,
    required this.resetPasswordEmailController,
    required this.resetPasswordEmailFormKey,
    required this.acceptTerms,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? username,
    PoliticalStatus? politicalStatus,
    String? verificationCode,
    String? newPassword,
    String? passwordResetCode,
    String? newAccountPassword,
    String? resetPasswordEmail,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? usernameController,
    TextEditingController? verificationCodeController,
    TextEditingController? newPasswordController,
    TextEditingController? passwordResetCodeController,
    TextEditingController? newAccountPasswordController,
    TextEditingController? resetPasswordEmailController,
    GlobalKey<FormState>? emailFormKey,
    GlobalKey<FormState>? passwordFormKey,
    GlobalKey<FormState>? usernameFormKey,
    GlobalKey<FormState>? verificationCodeFormKey,
    GlobalKey<FormState>? newPasswordFormKey,
    GlobalKey<FormState>? passwordResetCodeFormKey,
    GlobalKey<FormState>? newAccountPasswordFormKey,
    GlobalKey<FormState>? resetPasswordEmailFormKey,
    bool? acceptTerms,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      politicalStatus: politicalStatus ?? this.politicalStatus,
      verificationCode: verificationCode ?? this.verificationCode,
      newPassword: newPassword ?? this.newPassword,
      passwordResetCode: passwordResetCode ?? this.passwordResetCode,
      newAccountPassword: newAccountPassword ?? this.newAccountPassword,
      resetPasswordEmail: resetPasswordEmail ?? this.resetPasswordEmail,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      usernameController: usernameController ?? this.usernameController,
      verificationCodeController: verificationCodeController ?? this.verificationCodeController,
      newPasswordController: newPasswordController ?? this.newPasswordController,
      passwordResetCodeController: passwordResetCodeController ?? this.passwordResetCodeController,
      newAccountPasswordController: newAccountPasswordController ?? this.newAccountPasswordController,
      resetPasswordEmailController: resetPasswordEmailController ?? this.resetPasswordEmailController,
      emailFormKey: emailFormKey ?? this.emailFormKey,
      passwordFormKey: passwordFormKey ?? this.passwordFormKey,
      usernameFormKey: usernameFormKey ?? this.usernameFormKey,
      verificationCodeFormKey: verificationCodeFormKey ?? this.verificationCodeFormKey,
      newPasswordFormKey: newPasswordFormKey ?? this.newPasswordFormKey,
      passwordResetCodeFormKey: passwordResetCodeFormKey ?? this.passwordResetCodeFormKey,
      newAccountPasswordFormKey: newAccountPasswordFormKey ?? this.newAccountPasswordFormKey,
      resetPasswordEmailFormKey: resetPasswordEmailFormKey ?? this.resetPasswordEmailFormKey,
      acceptTerms: acceptTerms ?? this.acceptTerms,
    );
  }

  factory AuthState.empty() {
    return AuthState(
      email: '',
      password: '',
      username: '',
      politicalStatus: PoliticalStatus.none,
      verificationCode: '',
      newPassword: '',
      passwordResetCode: '',
      newAccountPassword: '',
      resetPasswordEmail: '',
      acceptTerms: false,
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      usernameController: TextEditingController(),
      verificationCodeController: TextEditingController(),
      newPasswordController: TextEditingController(),
      passwordResetCodeController: TextEditingController(),
      newAccountPasswordController: TextEditingController(),
      resetPasswordEmailController: TextEditingController(),
      emailFormKey: GlobalKey<FormState>(),
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
