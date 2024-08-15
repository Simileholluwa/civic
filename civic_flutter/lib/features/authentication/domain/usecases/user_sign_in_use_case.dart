import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignInUseCase implements UseCase<UserRecord?, UserSignInParams> {
  UserSignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserRecord?>> call(UserSignInParams params) async {
    final result = await _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return result;
  }
}

class UserSignInParams {
  UserSignInParams(
    this.email,
    this.password,
  );
  final String password;
  final String email;
}
