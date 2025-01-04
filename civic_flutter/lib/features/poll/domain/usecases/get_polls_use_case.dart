import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class GetPollsUseCase implements UseCase<PollList, GetPollsParams> {
  GetPollsUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, PollList>> call(GetPollsParams params) async {
    final result = await _pollRepository.getPolls(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetPollsParams {
  GetPollsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
