import 'dart:convert';
import 'dart:developer';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/network/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_user_provider.g.dart';

@riverpod
class AuthUser extends _$AuthUser {
  @override
  AuthUserState build() {
    return const AuthUserStateInitial();
  }

  Future<void> init() async {
    await ref.read(sessionProvider).initialize();
    await fetchUser();
  }

  Future<void> fetchUser() async {
    final me = ref.read(fetchUserProvider);
    final result = await me(
      GetUserParams(
        userId: null,
      ),
    );
    return result.fold((error) {
      log(error.message);
      state = const AuthUserStateError();
      return;
    }, (response) async {
      state = AuthUserStateSuccess(
        userRecord: response,
      );
      final jsonString = jsonEncode(response);
      await ref.read(localStorageProvider).setString(
            'userRecord',
            jsonString,
          );
      return;
    });
  }
}
