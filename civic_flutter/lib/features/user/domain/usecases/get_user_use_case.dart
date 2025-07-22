import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:fpdart/fpdart.dart';

class GetUserUseCase implements UseCase<UserRecord, GetUserParams> {
  GetUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;
  final UserRepository _userRepository;

  @override
  Future<Either<Failure, UserRecord>> call(GetUserParams params) async {
    final result = await _userRepository.getUser(
      userId: params.userId,
    );
    return result;
  }
}

class GetUserParams {
  final int? userId;
  GetUserParams({
    required this.userId,
  });
}
