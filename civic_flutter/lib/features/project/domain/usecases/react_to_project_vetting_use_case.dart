import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ReactToProjectVettingUseCase implements UseCase<ProjectVetting, ReactToProjectVettingParams> {
  ReactToProjectVettingUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectVetting>> call(ReactToProjectVettingParams params) async {
    final result = await _projectRepository.reactToVetting(
      vettingId: params.vettingId,
      isLike: params.isLike,
    );
    return result;
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
