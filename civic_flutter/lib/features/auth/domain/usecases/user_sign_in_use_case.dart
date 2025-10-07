import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class UserSignInUseCase implements UseCase<bool, UserSignInParams> {
  UserSignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(UserSignInParams params) async {
    final result = await _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return result;
  }
}

class UserSignInParams {
  UserSignInParams({
    required this.email,
    required this.password,
  });
  final String password;
  final String email;
}
