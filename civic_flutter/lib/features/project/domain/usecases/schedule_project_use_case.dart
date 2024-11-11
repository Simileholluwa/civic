import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/project/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

class ScheduleProjectUseCase implements UseCase<void, ScheduleProjectParams> {
  ScheduleProjectUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(ScheduleProjectParams params) async {
    final result = await _projectRepository.scheduleProject(
      project: params.project,
      dateTime: params.dateTime,
    );
    return result;
  }
}

class ScheduleProjectParams {
  ScheduleProjectParams(
    this.project,
    this.dateTime,
  );
  final Project project;
  final DateTime dateTime;
}
