import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchAllUsernamesUseCase implements UseCase<List<String>, NoParams> {
  FetchAllUsernamesUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    final result = await _authRepository.fetchAllUsernames();
    return result;
  }
}
