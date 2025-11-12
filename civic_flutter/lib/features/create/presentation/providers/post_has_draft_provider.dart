import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_has_draft_provider.g.dart';

@riverpod
Future<bool> hasPostDraft(Ref ref, String draftType) async {
  final getPostDraft = ref.read(getPostDraftsProvider);
  final result = await getPostDraft(draftType);
  return result.fold(
    (l) => false,
    (r) {
      return r.isNotEmpty;
    },
  );
}
