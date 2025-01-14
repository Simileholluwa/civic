import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_card_provider.g.dart';

@riverpod
class ArticleCardWidget extends _$ArticleCardWidget {
  @override
  ArticleCardState build(Article article) {
    return ArticleCardState.populate(article);
  }
}