import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/network/network.dart';
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
      TToastMessages.errorToast(l.message);
      return false;
    }, (_) async {
      return true;
    });
  }

  Future<bool> fetchUser(int userId) async {
    final fetchUser = ref.read(fetchUserProvider);
    final result = await fetchUser(
      GetUserParams(
        userId: userId,
      ),
    );
    return result.fold(
      (l) {
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
