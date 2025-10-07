import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class SearchUserNinUseCase implements UseCase<UserRecord?, String> {
  SearchUserNinUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserRecord?>> call(String param) async {
    final result = await _authRepository.searchNinDetails(
      ninNumber: param,
    );
    return result;
  }
}
