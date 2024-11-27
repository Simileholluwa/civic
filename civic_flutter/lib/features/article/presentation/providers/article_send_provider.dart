//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_send_provider.g.dart';

@riverpod
class SendArticle extends _$SendArticle {
  @override
  void build() {}

  Future<void> saveFailedArticleAsDraft(
    String errorMessage,
    Article article,
  ) async {
    final articleDraft = ArticleHelperFunctions.createDraftFromArticle(
      article,
    );
    final draftArticleProvider = ref.read(
      articleDraftsProvider.notifier,
    );
    final result = await draftArticleProvider.saveArticleDraft(
      articleDraft,
    );
    if (result) {
      TToastMessages.errorToast(
        '$errorMessage. Your article was saved to drafts.',
      );
    }
  }

  Future<String?> sendArticleBanner(
    Article article,
  ) async {
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
      [article.banner!],
      'articles',
      'banners',
    );

    return result.fold((error) async {
      log(error);
      await saveFailedArticleAsDraft(
        error,
        article,
      );

      return null;
    }, (mediaUrl) {
      return mediaUrl.first;
    });
  }

  Future<String?> sendMediaAndModifyContent(
    List<String> embeddedImages,
    Article article,
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
        article,
      );

      return null;
    }, (mediaUrls) {
      final pathReplacements = ArticleHelperFunctions.mapEmbededImages(
        embeddedImages,
        mediaUrls,
      );
      final modifiedContent = ArticleHelperFunctions.modifyArticleContent(
        article.content!,
        pathReplacements,
      );
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
          article,
        );
        if (modifiedContent == null) {
          return false;
        }
      }
      String? bannerUrl = article.banner;
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      if (!regex.hasMatch(article.banner ?? '')) {
        bannerUrl = await sendArticleBanner(
          article,
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
          article,
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
