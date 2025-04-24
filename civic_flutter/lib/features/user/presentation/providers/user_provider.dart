import 'dart:developer';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_provider.g.dart';

@riverpod
class CurrentActiveUser extends _$CurrentActiveUser {
  @override
  UserState build() {
    return UserState.empty(ref);
  }

  Future<bool> toggleFollow(int userId) async {
    final toggleFollow = ref.read(toggleFollowProvider);
    final result = await toggleFollow(
      ToggleFollowParams(
        userId,
      ),
    );
    return result.fold((l) {
      log(l.message);
      return false;
    }, (_) async {
      final user = await fetchUser();
      if (user) return true;
      return false;
    });
  }

  Future<bool> fetchUser() async {
    final fetchUser = ref.read(fetchUserProvider);
    final result = await fetchUser(
      NoParams(),
    );
    return result.fold(
      (l) {
        log(l.message);
        return false;
      },
      (r) {
        state = state.copyWith(
          currentUser: r,
        );
        return true;
      },
    );
  }
}
