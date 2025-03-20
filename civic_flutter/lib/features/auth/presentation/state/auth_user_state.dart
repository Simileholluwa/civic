import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';

@immutable
sealed class AuthUserState {
  const AuthUserState();
}

final class AuthUserStateError extends AuthUserState {
  const AuthUserStateError();
}

final class AuthUserStateLoading extends AuthUserState {
  const AuthUserStateLoading();
}

final class AuthUserStateSuccess extends AuthUserState {
  const AuthUserStateSuccess({
    required this.userRecord,
  });
  final UserRecord userRecord;
}

final class AuthUserStateInitial extends AuthUserState {
  const AuthUserStateInitial();
}