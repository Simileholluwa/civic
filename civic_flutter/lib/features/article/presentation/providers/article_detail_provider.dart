// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/get_article_usecase.dart';
import 'package:civic_flutter/features/article/presentation/providers/article_service_provider.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_detail_provider.g.dart';

@riverpod
Future<Article?> articleDetail(
  ArticleDetailRef ref,
  ArticleDraft? articleDraft,
  int id,
) async {
  if (id == 0 && articleDraft == null) {
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return Article(
        ownerId: currentUser.userInfo!.id!,
        owner: currentUser,
        banner: '',
        title: '',
        content: '',
      );
    });
  } else if(id == 0 && articleDraft != null) {
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return Article(
        ownerId: currentUser.userInfo!.id!,
        owner: currentUser,
        banner: articleDraft.banner,
        title: articleDraft.title,
        content: articleDraft.content,
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
