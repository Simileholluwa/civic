import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUserUseCase implements UseCase<UserRecord?, NoParams> {
  CurrentUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserRecord?>> call(NoParams params) async {
    final result = await _authRepository.currentUser();
    return result;
  }
}

