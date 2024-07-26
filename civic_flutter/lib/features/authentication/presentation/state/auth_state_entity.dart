// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:civic_client/civic_client.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

class AuthStateBooting extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateCheckIfNewUser extends AuthState {}

class AuthStateMenu extends AuthState {}

class AuthStateNin extends AuthState {
  final String ninRecord;
  const AuthStateNin({
    required this.ninRecord,
  });
}

class AuthStateError extends AuthState {
  final String error;
  const AuthStateError({required this.error});
}

class AuthStateSuccess extends AuthState {
  final UserRecord userRecord;
  const AuthStateSuccess({required this.userRecord});
}

class AuthStateGuest extends AuthState {}

class AuthStateLogin extends AuthState {
  final String username;
  final String email;
  const AuthStateLogin({
    required this.username,
    required this.email,
  });
}

class AuthStatePoliticalStatus extends AuthState {
  final String email;
  const AuthStatePoliticalStatus({
    required this.email,
  });
}

class AuthStateUsername extends AuthState {
  final String email;
  final int politicalStatus;
  const AuthStateUsername({
    required this.email,
    required this.politicalStatus,
  });
}

class AuthStateInitiatePasswordReset extends AuthState {
  final String email;
  const AuthStateInitiatePasswordReset({
    required this.email,
  });
}

class AuthStateVerifyPasswordReset extends AuthState {
  final String email;
  const AuthStateVerifyPasswordReset({
    required this.email,
  });
}

class AuthStateNewPassword extends AuthState {
  final String code;
  final String email;
  const AuthStateNewPassword({
    required this.code,
    required this.email,
  });
}

class AuthStateCreateAccount extends AuthState {
  final String email;
  final int politicalStatus;
  final String username;
  const AuthStateCreateAccount({
    required this.email,
    required this.politicalStatus,
    required this.username,
  });
}

class AuthStateSuccessfulRequest extends AuthState {
  final String successMessage;
  const AuthStateSuccessfulRequest({
    required this.successMessage,
  });
}

class AuthStateNotLoading extends AuthState {}

class AuthStateSignUp extends AuthState {}

class AuthStateVerifyAccount extends AuthState {}

class AuthStateVerificationCode extends AuthState {
  final String email;
  final String password;
  final String username;
  final int politicalStatus;
  const AuthStateVerificationCode({
    required this.email,
    required this.password,
    required this.username,
    required this.politicalStatus,
  });
}
