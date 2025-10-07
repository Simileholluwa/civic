import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  UserState({
    required this.currentUser,
  });

  factory UserState.empty(Ref ref) {
    final userRecord = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded = jsonDecode(
      userRecord.toString(),
    ) as Map<String, dynamic>;
    return UserState(
      currentUser: UserRecord.fromJson(decoded),
    );
  }
  final UserRecord currentUser;

  UserState copyWith({
    UserRecord? currentUser,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
