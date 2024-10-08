import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> save(
    Session session,
    Post post,
  ) async {
    try {
      final authInfo = await session.authenticated;
      if (authInfo == null) {
        throw UserException(
          message: 'You must be logged in',
        );
      }
      final user = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(authInfo.userId),
      );
      if (user == null) return null;
      if (post.id != null) {
        if (post.ownerId != user.userInfoId) {
          throw PostException(
            message: 'Unauthorised operation',
          );
        }
        final sentPost = await Post.db.updateRow(
          session,
          post,
        );
        await sendHashTags(
          session,
          post.tags,
          post.id!,
        );
        return sentPost;
      } else {
        final sentPost = await Post.db.insertRow(
          session,
          post.copyWith(
            ownerId: user.id,
            owner: user,
          ),
        );
        if (sentPost.id == null) {
          throw Exception('Post ID is null after insert');
        } else {
          await sendHashTags(
            session,
            post.tags,
            sentPost.id!,
          );
        }
        return sentPost;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> sendHashTags(
    Session session,
    List<String> tags,
    int postId,
  ) async {
    try {
      for (var tag in tags) {
        var existingHashtag = await Hashtag.db.findFirstRow(
          session,
          where: (t) => t.tag.equals(tag),
        );

        int hashtagId;

        if (existingHashtag != null) {
          existingHashtag.usageCount += 1;
          await Hashtag.db.updateRow(
            session,
            existingHashtag,
          );
          hashtagId = existingHashtag.id!;
        } else {
          var newHashtag = Hashtag(
            tag: tag,
            usageCount: 1,
          );
          final sentHashtag = await Hashtag.db.insertRow(
            session,
            newHashtag,
          );
          
          hashtagId = sentHashtag.id!;
        }
        var postHashtag = PostsHashtags(
          postId: postId,
          hashtagId: hashtagId,
        );
        await PostsHashtags.db.insertRow(
          session,
          postHashtag,
        );
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<void> sendInFuture(
    Session session,
    Post post,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'sendPostFutureCall',
      post,
      dateTime,
    );
  }

  Future<Post?> retrieve(
    Session session,
    int id,
  ) async {
    final result = await Post.db.findById(
      session,
      id,
    );
    return result;
  }

  Future<PostList> listPost(
    Session session, {
    int limit = 10,
    int page = 1,
  }) async {
    final count = await Post.db.count(session);
    final results = await Post.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      include: Post.include(
        owner: UserRecord.include(),
      ),
    );

    return PostList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }
}
