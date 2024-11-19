//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/assets_service_provider.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/save_article_usecase.dart';
import 'package:civic_flutter/features/article/presentation/helper/article_helper_functions.dart';
import 'package:civic_flutter/features/article/presentation/providers/article_draft_provider.dart';
import 'package:civic_flutter/features/article/presentation/providers/article_service_provider.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_send_provider.g.dart';

@riverpod
class SendArticle extends _$SendArticle {
  @override
  void build() {}

  Future<void> saveFailedArticleAsDraft(
    String errorMessage,
    String title,
    String content,
    String banner,
  ) async {
    final articleDraft = ArticleDraft(
      draftId: DateTime.now().millisecondsSinceEpoch,
      title: title,
      content: content,
      banner: banner,
      createdAt: DateTime.now(),
    );
    final draftArticleProvider = ref.read(articleDraftsProvider.notifier);
    final result = await draftArticleProvider.saveArticleDraft(
      articleDraft,
    );
    if (result) {
      TToastMessages.errorToast(
        '$errorMessage. Your post was saved to drafts.',
      );
    }
  }

  Future<String?> sendArticleBanner(
    String title,
    String content,
    String banner,
  ) async {
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
      [banner],
      'articles',
      'banners',
    );

    return result.fold((error) async {
      log(error);
      await saveFailedArticleAsDraft(
        error,
        title,
        content,
        banner,
      );

      return null;
    }, (mediaUrl) {
      return mediaUrl.first;
    });
  }

  Future<String?> sendMediaAndModifyContent(
    List<String> embeddedImages,
    String title,
    String content,
    String banner,
  ) async {
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          embeddedImages,
          'articles',
          'images',
        );

    return result.fold((error) async {
      log(error);
      await saveFailedArticleAsDraft(
        error,
        title,
        content,
        banner,
      );

      return null;
    }, (mediaUrls) {
      final pathReplacements = ArticleHelperFunctions.mapEmbededImages(
        embeddedImages,
        mediaUrls,
      );
      final modifiedContent = ArticleHelperFunctions.modifyArticleContent(
          content, pathReplacements);
      return modifiedContent;
    });
  }

  Future<bool> sendArticle({
    required Article article,
  }) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final me = ref.read(meUseCaseProvider);
    final userRecord = await me(NoParams());
    return userRecord.fold((error) {
      log(error.message);
      TToastMessages.infoToast(error.message);
      return false;
    }, (user) async {
      final saveArticle = ref.read(saveArticleProvider);
      String? modifiedContent;
      final embeddedImages =
          ArticleHelperFunctions.getAllImagesFromEditor(article.content ?? '');
      if (embeddedImages.isNotEmpty) {
        modifiedContent = await sendMediaAndModifyContent(
          embeddedImages,
          article.title ?? '',
          article.content ?? '',
          article.banner ?? '',
        );
        if (modifiedContent == null) {
          return false;
        }
      }
      String? bannerUrl = article.banner;
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      if (!regex.hasMatch(article.banner ?? '')) {
        bannerUrl = await sendArticleBanner(
          article.title ?? '',
          article.content ?? '',
          article.banner ?? '',
        );
        if (bannerUrl == null) {
          return false;
        }
      }

      final send = await saveArticle(
        SaveArticleParams(
          article.copyWith(
            ownerId: user.userInfo!.id!,
            content: modifiedContent ?? article.content,
            banner: bannerUrl,
          ),
        ),
      );

      return send.fold((l) async {
        log(l.message);
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        await saveFailedArticleAsDraft(
          l.message,
          article.title ?? '',
          article.content ?? '',
          article.banner ?? '',
        );
        return false;
      }, (r) async {
        TToastMessages.successToast('Your article has been sent!');
        ref.read(sendPostLoadingProvider.notifier).setValue(false);

        return true;
      });
    });
  }
}
