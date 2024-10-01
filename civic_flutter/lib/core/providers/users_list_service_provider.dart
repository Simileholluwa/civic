import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/services/users_list_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_list_service_provider.g.dart';

@Riverpod(keepAlive: true)
UsersListService usersListService(UsersListServiceRef ref) {
  return UsersListService(
    client: ref.read(clientProvider),
  );
}
