// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'article_detail_provider.g.dart';

@riverpod
Future<Article?> articleDetail(
  Ref ref,
  ArticleDraft? articleDraft,
  int id,
) async {
  if (id == 0 && articleDraft == null) {
    final me = ref.read(fetchUserProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return Article(
        ownerId: currentUser.userInfo!.id!,
      );
    });
  } else if(id == 0 && articleDraft != null) {
    final me = ref.read(fetchUserProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return ArticleHelperFunctions.createArticleFromDraft(
        articleDraft,
        currentUser,
      );
    });
  } else {
    final getArticle = ref.read(getArticleProvider);
    final result = await getArticle(
      GetArticleParams(
        id,
      ),
    );

    return result.fold(
      (error) => null,
      (article) {
        return article;
      },
    );
  }
}
