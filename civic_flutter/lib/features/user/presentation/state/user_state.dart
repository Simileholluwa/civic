// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  final UserRecord currentUser;
  UserState({
    required this.currentUser,
  });

  UserState copyWith({
    UserRecord? currentUser,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  factory UserState.initial(Ref ref) {
    final userRecord = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded = jsonDecode(userRecord.toString());
    return UserState(
      currentUser: UserRecord.fromJson(decoded),
    );
  }
}
