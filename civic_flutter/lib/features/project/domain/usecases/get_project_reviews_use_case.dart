import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectReviewsUseCase implements UseCase<ProjectReviewList, GetProjectReviewsParams> {
  GetProjectReviewsUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectReviewList>> call(GetProjectReviewsParams params) async {
    final result = await _projectRepository.getProjectReviews(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetProjectReviewsParams {
  GetProjectReviewsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
