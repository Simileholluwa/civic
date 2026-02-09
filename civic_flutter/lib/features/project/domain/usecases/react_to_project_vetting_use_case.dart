import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ReactToProjectVettingUseCase
    implements UseCase<void, ReactToProjectVettingParams> {
  ReactToProjectVettingUseCase({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(
    ReactToProjectVettingParams params,
  ) async {
    return _projectRepository.reactToVetting(
      vettingId: params.vettingId,
      isLike: params.isLike,
    );
  }
}

class ReactToProjectVettingParams {
  ReactToProjectVettingParams(
    this.vettingId,
    this.isLike,
  );
  final int vettingId;
  final bool isLike;
}
