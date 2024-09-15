import 'package:civic_client/civic_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'tag_selections_provider.g.dart';

@riverpod
class TagSelections extends _$TagSelections {
  @override
  List<UserRecord> build() => <UserRecord>[];

  void addUser(UserRecord userRecord) {
    if (state.length < 10 && !state.contains(userRecord)) {
      state = [...state, userRecord];
    }
  }

  void removeUser(UserRecord userRecord) {
    state = state
        .where((record) => record.userInfo!.id != userRecord.userInfo!.id)
        .toList();
  }

  void clearSelections() {
    state = <UserRecord>[];
  }
}
