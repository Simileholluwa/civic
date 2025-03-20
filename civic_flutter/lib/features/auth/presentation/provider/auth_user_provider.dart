// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
part 'auth_user_provider.g.dart';

@riverpod
class AuthUser extends _$AuthUser {
  @override
  AuthUserState build() {
    return AuthUserStateInitial();
  }

  Future<void> init() async {
    ref.read(sessionProvider).initialize();
    await fetchUser();
  }

  Future<void> fetchUser() async {
    final me = ref.read(meUseCaseProvider);
    final result = await me(
      NoParams(),
    );
    return result.fold((error) {
      log(error.message);
      state = AuthUserStateError();
      return;
    }, (response) {
      state = AuthUserStateSuccess(
        userRecord: response,
      );
      log(response.toString());
      return;
    });
  }

}