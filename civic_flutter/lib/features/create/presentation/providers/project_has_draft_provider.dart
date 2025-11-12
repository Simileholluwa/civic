import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_has_draft_provider.g.dart';

@riverpod
Future<bool> hasProjectDraft(Ref ref) async {
  final getProjectsDraft = ref.read(getProjectDraftsProvider);
  final result = await getProjectsDraft(NoParams());
  return result.fold(
    (l) => false,
    (r) {
      return r.isNotEmpty;
    },
  );
}
