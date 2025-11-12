import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'load_project_drafts_provider.g.dart';

@riverpod
Future<List<Project>> loaddraftProjects(Ref ref) async {
  final getProjectsDraft = ref.read(getProjectDraftsProvider);
  final result = await getProjectsDraft(NoParams());
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
