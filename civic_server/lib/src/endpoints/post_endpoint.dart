import 'package:civic_server/src/endpoints/hashtag_endpoint.dart';
import 'package:civic_server/src/endpoints/project_endpoint.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class PostEndpoint extends Endpoint {
  Future<Post?> savePost(
    Session session,
    Post post,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(
          session,
        );
        if (post.id != null) {
          await validatePostOwnership(
            session,
            post.id!,
            user,
          );
          final sentPost = await Post.db.updateRow(
            session,
            post.copyWith(
              updatedAt: DateTime.now(),
            ),
            transaction: transaction,
          );
          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            post.id!,
          );
          return sentPost;
        } else {
          final sentPost = await Post.db.insertRow(
            session,
            post.copyWith(
              ownerId: user.id,
              owner: user,
              postType: PostType.regular,
              likedBy: [],
              commentedBy: [],
              bookmarkedBy: [],
              quotedBy: [],
            ),
            transaction: transaction,
          );

          await HashtagEndpoint().sendPostHashtags(
            session,
            post.tags ?? [],
            sentPost.id!,
          );

          return sentPost;
        }
      } catch (e, stackTrace) {
        session.log(
          'Error in savePost: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        return null;
      }
    });
  }

  Future<Post?> savePostComment(
    Session session,
    Post comment,
    bool isReply,
  ) async {
    try {
      final user = await authUser(session);

      if (comment.id != null) {
        await validateCommentOwnership(
          session,
          comment.id!,
          comment.parentId!,
          user,
        );
        return await Post.db.updateRow(
          session,
          comment.copyWith(
            updatedAt: DateTime.now(),
          ),
        );
      } else {
        Post? parent;
        if (comment.parentId != null) {
          parent = await Post.db.findById(
            session,
            comment.parentId!,
          );
          if (parent != null) {
            await updatePost(
              session,
              parent.copyWith(
                commentedBy: {
                  ...parent.commentedBy!,
                  user.userInfoId,
                }.toList(),
                commentCount: parent.commentCount! + 1,
              ),
            );
          }
        }

        return await Post.db.insertRow(
          session,
          comment.copyWith(
            owner: user,
            postType: isReply ? PostType.commentReply : PostType.comment,
            dateCreated: DateTime.now(),
            likedBy: [],
            commentedBy: [],
          ),
        );
      }
    } catch (e, stackTrace) {
      session.log(
        'Failed to add comment: $e',
        stackTrace: stackTrace,
        level: LogLevel.error,
      );
      return null;
    }
  }

  Future<PostList> getPostComments(
    Session session,
    int postId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }
    final count = await Post.db.count(
      session,
      where: (t) =>
          t.parentId.equals(postId) & t.postType.equals(PostType.comment),
    );

    final results = await Post.db.find(
      session,
      where: (t) =>
          t.parentId.equals(postId) & t.postType.equals(PostType.comment),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    return PostList(
      count: count,
      results: results,
      limit: limit,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<int> toggleCommentLike() async {
    return 1;
  }

  Future<void> deletePostComment(int commentId) async {
    return;
  }

  Future<void> getComment(
    Session session,
    int commentId,
    bool isComment,
  ) async {
    final comment = await Post.db.findById(
      session,
      commentId,
    );

    if (comment == null) {
      throw PostException(
        message: isComment
            ? 'This comment does not exist. It may have been deleted.'
            : 'This reply does not exist. It may have been deleted.',
      );
    }
  }

  Future<PostList> getPostCommentReplies(
    Session session,
    int commentId, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }

    final count = await Post.db.count(
      session,
      where: (t) =>
          t.parentId.equals(commentId) &
          t.postType.equals(PostType.commentReply),
    );

    final results = await Post.db.find(
      session,
      where: (t) =>
          t.parentId.equals(commentId) &
          t.postType.equals(PostType.commentReply),
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    return PostList(
      count: count,
      results: results,
      limit: limit,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<void> schedulePost(
    Session session,
    Post post,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'schedulePostFutureCall',
      post,
      dateTime,
    );
  }

  Future<Post> getRootPost(Session session, Post post) async {
    var current = post;
    while (current.parentId != null) {
      final parent = await Post.db.findById(session, current.parentId!);
      if (parent == null) break;
      current = parent;
    }
    return current;
  }

  Future<Post> repostOrQuote(
    Session session,
    int? projectId,
    Post? quoteContent,
  ) async {
    final user = await authUser(session);
    return await session.db.transaction((transaction) async {
      try {
        if (projectId == null) {
          throw PostException(message: 'Specify the Id of the project');
        }

        // Determine if this is a post or project repost/quote
        Post? existing;
        Post newPost;

        final selectedProject = await Project.db.findById(
          session,
          projectId,
          transaction: transaction,
        );
        if (selectedProject == null) {
          throw PostException(message: 'Project not found.');
        }
        existing = await Post.db.findFirstRow(
          session,
          where: (t) =>
              t.ownerId.equals(user.id!) &
              t.projectId.equals(selectedProject.id!) &
              t.postType.equals(
                PostType.projectRepost,
              ),
          transaction: transaction,
        );

        if (existing != null) {
          await Post.db.deleteRow(
            session,
            existing,
            transaction: transaction,
          );
          selectedProject.quotedBy?.remove(user.id);
          await ProjectEndpoint().updateProject(session, selectedProject);
          throw PostException(
            message: 'Project repost successfully removed.',
            action: 'deleted',
          );
        }

        newPost = Post(
          ownerId: user.id!,
          postType: PostType.projectRepost,
          projectId: selectedProject.id,
          text: quoteContent?.text,
          imageUrls: quoteContent?.imageUrls,
          videoUrl: quoteContent?.videoUrl,
          mentions: quoteContent?.mentions,
          tags: quoteContent?.tags,
          locations: quoteContent?.locations,
          taggedUsers: quoteContent?.taggedUsers,
          hashtags: quoteContent?.hashtags,
          quotedOrRepostedFromUserId: user.id,
          dateCreated: DateTime.now(),
          likedBy: [],
          commentedBy: [],
          quotedBy: [],
          bookmarkedBy: [],
        );

        if (!selectedProject.quotedBy!.contains(user.id!)) {
          selectedProject.quotedBy!.add(user.id!);
        }
        selectedProject.quoteCount = (selectedProject.quoteCount ?? 0) + 1;

        await ProjectEndpoint().updateProject(session, selectedProject);
        final sentPost = await Post.db.insertRow(
          session,
          newPost,
          transaction: transaction,
        );

        await HashtagEndpoint().sendPostHashtags(
          session,
          newPost.tags ?? [],
          sentPost.id!,
        );

        return sentPost.copyWith(
          quotedOrRepostedFromUser: user,
          owner: user,
        );
      } on PostException {
        rethrow;
      } catch (e, stackTrace) {
        session.log(
          'Error in repostOrQuote: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        throw PostException(
          message: 'Error reposting or quoting post',
        );
      }
    });
  }

  Future<Post> getPost(
    Session session,
    int id,
  ) async {
    final result = await Post.db.findById(
      session,
      id,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        project: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        parent: Post.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
      ),
    );

    if (result == null) {
      throw PostException(
        message: 'This post does not exist. It may have been deleted.',
      );
    }

    return result;
  }

  Future<PostList> getPosts(
    Session session, {
    int limit = 50,
    int page = 1,
  }) async {
    if (limit <= 0 || page <= 0) {
      throw UserException(
        message: 'Invalid pagination parameters',
      );
    }
    final count = await Post.db.count(session,
        where: (t) =>
            t.postType.equals(PostType.regular) |
            t.postType.equals(PostType.postRepost) |
            t.postType.equals(PostType.projectRepost));
    final results = await Post.db.find(
      session,
      limit: limit,
      where: (t) =>
          t.postType.equals(PostType.regular) |
          t.postType.equals(PostType.postRepost) |
          t.postType.equals(PostType.projectRepost),
      offset: (page * limit) - limit,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        project: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        parent: Post.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        quotedOrRepostedFromUser: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
      orderBy: (t) => t.dateCreated,
      orderDescending: true,
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

  Future<void> deletePost(
    Session session,
    int id,
  ) async {
    final user = await authUser(
      session,
    );
    await validatePostOwnership(
      session,
      id,
      user,
    );
    final post = await Post.db.findById(
      session,
      id,
    );

    if (post == null) {
      throw PostException(
        message: 'Post not found',
      );
    }

    await Post.db.deleteRow(
      session,
      post,
    );
  }

  Future<void> toggleBookmark(
    Session session,
    int postId,
  ) async {
    Post? post;
    final user = await authUser(session);

    await session.db.transaction((transaction) async {
      try {
        post = await Post.db.findById(
          session,
          postId,
          transaction: transaction,
        );
        if (post == null) {
          throw PostException(
            message: "Post not found",
          );
        }

        final existingBookmark = await PostBookmarks.db.findFirstRow(
          session,
          where: (t) =>
              t.postId.equals(
                postId,
              ) &
              t.ownerId.equals(
                user.userInfoId,
              ),
          transaction: transaction,
        );

        if (existingBookmark != null) {
          await PostBookmarks.db.deleteRow(
            session,
            existingBookmark,
            transaction: transaction,
          );
          post!.bookmarkedBy?.remove(user.id!);
        } else {
          await PostBookmarks.db.insertRow(
            session,
            PostBookmarks(
              postId: postId,
              ownerId: user.userInfoId,
            ),
            transaction: transaction,
          );
          post!.bookmarkedBy?.add(user.id!);
        }
        await updatePost(session, post!);
      } catch (e, stackTrace) {
        session.log(
          'Error in toggleBookmark: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

  Future<void> toggleLike(
    Session session,
    int postId,
  ) async {
    await session.db.transaction((transaction) async {
      try {
        final user = await authUser(
          session,
        );

        final post = await Post.db.findById(
          session,
          postId,
          transaction: transaction,
        );
        if (post == null) {
          throw PostException(
            message: "Post not found",
          );
        }

        final existingLike = await PostLikes.db.findFirstRow(
          session,
          where: (t) =>
              t.postId.equals(
                postId,
              ) &
              t.ownerId.equals(
                user.userInfoId,
              ),
          transaction: transaction,
        );

        if (existingLike != null) {
          await PostLikes.db.deleteRow(
            session,
            existingLike,
            transaction: transaction,
          );
          post.likedBy?.remove(user.id!);
        } else {
          await PostLikes.db.insertRow(
            session,
            PostLikes(
              postId: postId,
              ownerId: user.userInfoId,
              dateCreated: DateTime.now(),
            ),
            transaction: transaction,
          );
          post.likedBy?.add(user.userInfoId);
        }
        await updatePost(session, post);
      } catch (e, stackTrace) {
        session.log(
          'Error in togglePostLike: $e',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
      }
    });
  }

  Future<void> markNotInterested(
    Session session,
    int postId,
  ) async {
    try {
      final user = await authUser(session);
      final entry = PostNotInterested(
        userId: user.id!,
        postId: postId,
      );

      await PostNotInterested.db.insertRow(
        session,
        entry,
      );
    } catch (e, stackTrace) {
      session.log(
        'Error in markPostNotInterested: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<UserRecord> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(
        message: 'You must be logged in',
      );
    }

    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(
        authInfo.userId,
      ),
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    return user;
  }

  Future<void> validatePostOwnership(
    Session session,
    int postId,
    UserRecord user,
  ) async {
    final post = await Post.db.findById(
      session,
      postId,
    );
    if (post == null) {
      throw PostException(
        message: 'Post not found',
      );
    }
    if (post.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
  }

  Future<void> validateCommentOwnership(
    Session session,
    int commentId,
    int postId,
    UserRecord user,
  ) async {
    final comment = await Post.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(commentId) &
          t.parentId.equals(postId) &
          t.ownerId.equals(user.id) &
          t.postType.equals(PostType.comment),
    );
    if (comment == null) {
      throw PostException(
        message: 'Comment not found',
      );
    }
    if (comment.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }
  }

  Stream<Post> postUpdates(Session session, int postId) async* {
    // Create a message stream for this post
    var updateStream = session.messages.createStream<Post>('post_$postId');

    // Yield the latest post details when the client subscribes
    var post = await Post.db.findById(
      session,
      postId,
      include: Post.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
        project: Project.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        parent: Post.include(
          owner: UserRecord.include(
            userInfo: UserInfo.include(),
          ),
        ),
        quotedOrRepostedFromUser: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );
    if (post != null) {
      yield post;
    }

    // Send updates when changes occur
    await for (var postUpdate in updateStream) {
      yield postUpdate.copyWith(
        owner: post!.owner,
        project: post.project,
        parent: post.parent,
        quotedOrRepostedFromUser: post.quotedOrRepostedFromUser,
      );
    }
  }

  Future<void> updatePost(Session session, Post post) async {
    // Update the project in the database
    await Post.db.updateRow(session, post);

    // Send an update to all clients subscribed to this project
    session.messages.postMessage(
      'post_${post.id}',
      post,
    );
  }
}
