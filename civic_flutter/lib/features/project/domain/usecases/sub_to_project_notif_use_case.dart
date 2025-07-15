import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class SubToProjectNotifUseCase implements UseCase<void, SubscribeToProjectNotifParams> {
  SubToProjectNotifUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(SubscribeToProjectNotifParams params) async {
    final result = await _projectRepository.subscribeToNotifications(
      id: params.id,
    );
    return result;
  }
}

class SubscribeToProjectNotifParams {
  SubscribeToProjectNotifParams(
    this.id,
  );
  final int id;
}
