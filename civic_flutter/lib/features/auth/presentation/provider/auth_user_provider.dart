import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_user_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthUser extends _$AuthUser {
  @override
  AuthUserState build() {
    return const AuthUserStateInitial();
  }

  Future<void> init() async {
    await fetchUser();
  }

  Future<void> fetchUser() async {
    final me = ref.read(fetchUserProvider);
    final result = await me(
      GetUserParams(
        userId: null,
      ),
    );

    if (!ref.mounted) return;

    return result.fold(
      (error) async {
        if (!ref.mounted) return;
        final savedUserString = ref
            .read(
              localStorageProvider,
            )
            .getString('userRecord');
        if (savedUserString == null) {
          state = const AuthUserStateError();
          return;
        }

        final savedUser = await compute(
          _parseSavedUser,
          savedUserString,
        );

        state = AuthUserStateSuccess(
          userRecord: savedUser,
        );
      },
      (response) async {
        if (!ref.mounted) return;
        state = AuthUserStateSuccess(
          userRecord: response,
        );
        final jsonString = jsonEncode(response);
        await ref.read(localStorageProvider).setString(
              'userRecord',
              jsonString,
            );
      },
    );
  }
}

UserRecord _parseSavedUser(String jsonString) {
  return UserRecord.fromJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );
}
