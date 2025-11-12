import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetUserProjectBookmarksUseCase
    implements UseCase<FeedProjectList, GetUserProjectBookmarksParams> {
  GetUserProjectBookmarksUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, FeedProjectList>> call(
    GetUserProjectBookmarksParams params,
  ) async {
    final result = await _projectRepository.getUserProjectBookmarks(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetUserProjectBookmarksParams {
  GetUserProjectBookmarksParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
