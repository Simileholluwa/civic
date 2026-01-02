import 'package:civic_client/civic_client.dart';

import 'package:civic_flutter/features/create/presentation/state/post_creation_state.dart';

class PostBuilder {
  const PostBuilder._();

  static Post buildPost({
    required int ownerId,
    required PostCreationState state,
    required List<UserRecord> mentions,
    int? id,
    PostType? postType,
    Poll? poll,
    Article? article,
    int? parentId,
    int? projectId,
    bool includeLocalMedia = false,
  }) {
    final post = Post(
      id: id,
      ownerId: ownerId,
      text: state.text.trim(),
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mediaAssets: state.uploadedAssets,
      mentions: mentions,
      tags: state.tags,
      postType: postType,
      poll: poll,
      article: article,
      parentId: parentId,
      projectId: projectId,
    );
    return post;
  }

  static Poll buildPoll({
    required int ownerId,
    required PostCreationState state,
    int? id,
    int? pollId,
  }) {
    final pollOptions = state.optionText.asMap().entries.map((entry) {
      final text = entry.value;
      return PollOption(
        option: text,
        pollId: pollId ?? 0,
      );
    }).toList();
    return Poll(
      id: id ?? pollId,
      ownerId: ownerId,
      options: pollOptions,
      expiresAt: state.expiresAt,
    );
  }

  static Article buildArticle({
    required int ownerId,
    required PostCreationState state,
    int? id,
  }) {
    return Article(
      id: id,
      ownerId: ownerId,
      content: state.articleContent,
      tag: state.articleTags,
    );
  }
}
