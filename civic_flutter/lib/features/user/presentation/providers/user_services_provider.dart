

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_services_provider.g.dart';

@riverpod
UserRemoteDatasourceImpl userRemoteDatasource(Ref ref) {
  return UserRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
UserRepositoryImpl userRepositoryImpl(Ref ref) {
  return UserRepositoryImpl(
    remoteDatasource: ref.read(
      userRemoteDatasourceProvider,
    ),
  );
}

@riverpod
ToggleFollowUseCase toggleFollow(Ref ref) {
  return ToggleFollowUseCase(
    userRepository: ref.read(userRepositoryImplProvider,),
  );
}

@riverpod
FetchUserUseCase fetchUser(Ref ref) {
  return FetchUserUseCase(
    userRepository: ref.read(userRepositoryImplProvider,),
  );
}