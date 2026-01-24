import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectReviewsUseCase
    implements UseCase<ProjectReviewList, GetProjectReviewsParams> {
  GetProjectReviewsUseCase({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectReviewList>> call(
    GetProjectReviewsParams params,
  ) async {
    final result = await _projectRepository.getProjectReviews(
      projectId: params.projectId,
      page: params.page,
      limit: params.limit,
      rating: params.rating,
      cardinal: params.cardinal,
    );
    return result;
  }
}

class GetProjectReviewsParams {
  GetProjectReviewsParams(
    this.projectId,
    this.page,
    this.limit,
    this.rating,
    this.cardinal,
  );
  final int projectId;
  final int page;
  final int limit;
  final double? rating;
  final String? cardinal;
}
