import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  LogoutUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _authRepository.logout();
    return result;
  }
}
