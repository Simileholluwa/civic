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
    final link = ref.keepAlive();
    final toggleFollow = ref.read(toggleFollowProvider);
    final result = await toggleFollow(
      ToggleFollowParams(
        userId,
      ),
    );

    return result.fold(
      (l) {
        TToastMessages.errorToast(l.message);
        link.close();
        return false;
      },
      (_) {
        link.close();
        return true;
      },
    );
  }

  Future<bool> fetchUser(int userId) async {
    final link = ref.keepAlive();
    final fetchUser = ref.read(fetchUserProvider);
    final result = await fetchUser(
      GetUserParams(
        userId: userId,
      ),
    );

    return result.fold(
      (l) {
        link.close();
        return false;
      },
      (r) {
        state = state.copyWith(
          currentUser: r,
        );
        link.close();
        return true;
      },
    );
  }
}
