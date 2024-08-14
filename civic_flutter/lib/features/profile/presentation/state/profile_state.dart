import 'package:flutter/material.dart';

@immutable
sealed class ProfileState {
  const ProfileState();
}

class ProfileStateError extends ProfileState {}
