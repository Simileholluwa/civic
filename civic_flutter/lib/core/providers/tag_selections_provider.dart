import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'tag_selections_provider.g.dart';

@Riverpod(keepAlive: true)
class TagSelections extends _$TagSelections {
  @override
  List<UserRecord> build() => <UserRecord>[];

  void addUser(UserRecord userRecord) {
    if (state.length < 10) {
      state = [...state, userRecord];
      log(state[0].politicalStatus.toString());
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

  List<int> getIdsFromTags() {
    if (state.isNotEmpty) {
      return state.map((record) => record.userInfo!.id!).toList();
    } else {
      return [];
    }
  }

}
