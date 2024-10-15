import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class RetrievePollUseCase implements UseCase<Poll?, RetrievePollParams> {
  RetrievePollUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, Poll?>> call(RetrievePollParams params) async {
    final result = await _pollRepository.retrieve(
      id: params.id,
    );
    return result;
  }
}

class RetrievePollParams {
  RetrievePollParams(
    this.id,
  );
  final int id;
}
