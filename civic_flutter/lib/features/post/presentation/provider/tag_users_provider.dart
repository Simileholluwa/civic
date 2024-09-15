import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/usecases/search_users_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'tag_users_provider.g.dart';

@riverpod
class TagSuggestions extends _$TagSuggestions {
  @override
  Future<List<UserRecord>> build() async {
    return await loadSuggestions();
  }

  Future<List<UserRecord>> loadSuggestions() async {
    final getUsers = ref.read(tagUsersProvider);
    final result = await getUsers(
      NoParams(),
    );

    return result.fold(
      (error) {
        log(error.message);
        return <UserRecord>[];
      },
      (users) {
        return users;
      },
    );
  }

  Future<List<UserRecord>> searchUsersToTag(String query) async {
    if (query.isEmpty) {
      return await loadSuggestions();
    } else {
      final searchUsers = ref.read(searchUsersToTagProvider);
      final result = await searchUsers(
        SearchUsersToTagParams(query),
      );
      return result.fold(
        (error) => <UserRecord>[],
        (users) {
          return users;
        },
      );
    }
  }
}
