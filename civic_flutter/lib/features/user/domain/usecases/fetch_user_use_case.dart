import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:fpdart/fpdart.dart';

class FetchUserUseCase implements UseCase<UserRecord, NoParams> {
  FetchUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;
  final UserRepository _userRepository;

  @override
  Future<Either<Failure, UserRecord>> call(NoParams params) async {
    final result = await _userRepository.fetchUser();
    return result;
  }
}