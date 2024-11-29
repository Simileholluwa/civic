import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class SearchUserNinUseCase
    implements UseCase<UserNinRecord?, NinUseCaseParams> {
  SearchUserNinUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserNinRecord?>> call(NinUseCaseParams params) async {
    final result = await _authRepository.searchNinDetails(
      ninNumber: params.ninNumber,
    );
    return result;
  }
}

class NinUseCaseParams {
  NinUseCaseParams(
    this.ninNumber,
  );
  final String ninNumber;
}
