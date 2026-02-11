import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<PostWithUserState> postDetail(
  Ref ref,
  int id,
  Post? post,
  PostType postType,
) async {
  final completer = Completer<PostWithUserState>();
  if (id == 0) {
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    if (postType == PostType.regular) {
      completer.complete(
        PostWithUserState(
          post: Post(
            ownerId: ownerId,
          ),
        ),
      );
    } else if (postType == PostType.article) {
      completer.complete(
        PostWithUserState(
          post: Post(
            ownerId: ownerId,
            article: Article(
              ownerId: ownerId,
            ),
          ),
        ),
      );
    } else if (postType == PostType.poll) {
      completer.complete(
        PostWithUserState(
          post: Post(
            ownerId: ownerId,
            poll: Poll(
              ownerId: ownerId,
            ),
          ),
        ),
      );
    }
    return completer.future;
  } else if (post != null) {
    completer.complete(
      PostWithUserState(
        post: post,
      ),
    );
    return completer.future;
  } else {
    final retrievePost = ref.read(getPostProvider);
    final result = await retrievePost(
      GetPostParams(
        id,
      ),
    );

    return result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
          'type': error.type,
        });
        return completer.future;
      },
      (postData) {
        completer.complete(postData);
        return completer.future;
      },
    );
  }
}
