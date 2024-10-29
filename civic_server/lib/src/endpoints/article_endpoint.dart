import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ArticleEndpoint extends Endpoint {
  Future<ArticleList> getArticles(
    Session session, {
    int limit = 10,
    int page = 1,
  }) async {
    final count = await Article.db.count(session);
    final results = await Article.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      include: Article.include(
        owner: UserRecord.include(),
      ),
    );

    return ArticleList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<Article?> getArticle(
    Session session, {
    required int id,
  }) async {
    return await Article.db.findFirstRow(
      session,
      where: (row) => row.id.equals(id),
      include: Article.include(
        owner: UserRecord.include(),
      ),
    );
  }

  Future<Article?> saveArticle(
    Session session,
    Article article,
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
      if (article.id != null) {
        if (article.ownerId != user.userInfoId) {
          throw PostException(
            message: 'Unauthorised operation',
          );
        }
        return await Article.db.updateRow(
          session,
          article,
        );
        
      } else {
        return await Article.db.insertRow(
          session,
          article.copyWith(
            ownerId: user.id,
            owner: user,
          ),
        );
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> deleteArticle(
    Session session,
    int id,
  ) async {
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
    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    final article = await Article.db.findFirstRow(
      session,
      where: (row) => row.id.equals(id),
    );
    if (article == null) {
      throw PostException(
        message: 'Article not found',
      );
    }
    if (article.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }

    await Article.db.deleteRow(
      session,
      article,
    );
  }
}
