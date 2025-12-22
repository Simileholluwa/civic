import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectReviewUseCase
    implements UseCase<ProjectReview?, GetProjectReviewParams> {
  GetProjectReviewUseCase({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectReview?>> call(
    GetProjectReviewParams params,
  ) async {
    final result = await _projectRepository.getProjectReview(
      id: params.id,
    );
    return result;
  }
}

class GetProjectReviewParams {
  GetProjectReviewParams(
    this.id,
  );
  final int id;
}
