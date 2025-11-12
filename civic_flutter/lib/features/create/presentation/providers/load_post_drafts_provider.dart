import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'load_post_drafts_provider.g.dart';

@riverpod
Future<List<Post>> loaddraftPost(Ref ref, String draftType) async {
  final getPostDraft = ref.read(getPostDraftsProvider);
  final result = await getPostDraft(draftType);
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
