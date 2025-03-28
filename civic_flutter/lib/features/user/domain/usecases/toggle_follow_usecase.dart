import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:fpdart/fpdart.dart';

class ToggleFollowUseCase implements UseCase<void, ToggleFollowParams> {
  ToggleFollowUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;
  final UserRepository _userRepository;

  @override
  Future<Either<Failure, void>> call(ToggleFollowParams params) async {
    final result = await _userRepository.toggleFollow(
      userId: params.userId,
    );
    return result;
  }
}

class ToggleFollowParams {
  ToggleFollowParams(
    this.userId,
  );
  final int userId;
}
