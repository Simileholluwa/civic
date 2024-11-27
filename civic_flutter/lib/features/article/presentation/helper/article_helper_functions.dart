import 'dart:convert';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/core/core.dart';

class ArticleHelperFunctions {
  ArticleHelperFunctions._();
  static void sendArticle(
    WidgetRef ref,
    ArticleState articleState,
    int id,
    int ownerId,
  ) {
    ref.read(sendArticleProvider.notifier).sendArticle(
          article: id != 0 
          ? articleToSend(articleState, id, ownerId)
          : articleToSend(articleState, null, ownerId),
        );
  }

  static Future<bool?> deleteArticleDraftsDialog(
      BuildContext context, WidgetRef ref) {
    return postDialog(
      context: context,
      title: 'Delete all drafts?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result =
            await ref.read(articleDraftsProvider.notifier).deleteAllDrafts();
        if (result) {
          if (context.mounted) context.pop();
        }
        TToastMessages.successToast('All drafts was deleted');
      },
    );
  }

  static List<String> getAllImagesFromEditor(String content) {
    final List<String> imageUrls = [];
    // Convert the document to JSON

    final jsonDocument = jsonDecode(
      content,
    );

    // Loop through the document's operations
    for (var operation in jsonDocument) {
      if (operation['insert'] is Map &&
          operation['insert'].containsKey('image')) {
        // Add the image URL to the list
        final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
        if (!operation['insert']['image'].toString().startsWith(regex)) {
          imageUrls.add(operation['insert']['image']);
        }
      }
    }

    return imageUrls;
  }

  static Map<String, String> mapEmbededImages(
    List<String> oldPath,
    List<String> newPath,
  ) {
    return {for (int i = 0; i < oldPath.length; i++) oldPath[i]: newPath[i]};
  }

  static String modifyArticleContent(
    String content,
    Map<String, String> pathReplacements,
  ) {
    // Convert document to JSON
    final documentJson = jsonDecode(
      content,
    );

    // Update the JSON with new image paths
    for (var block in documentJson) {
      if (block.containsKey('insert')) {
        final insert = block['insert'];

        // Check if the block is an image
        if (insert is Map<String, dynamic> && insert.containsKey('image')) {
          final oldPath = insert['image'] as String;

          // If the image path has a replacement, update it
          if (pathReplacements.containsKey(oldPath)) {
            insert['image'] = pathReplacements[oldPath];
          }
        }
      }
    }

    return jsonEncode(documentJson);
  }

  static Future<String> pickBannerImage(
    WidgetRef ref,
    BuildContext context,
  ) async {
    final picker = ImageHelper();
    final pickedFile = await picker.pickImage();
    if (pickedFile != null) {
      final croppedFile = await picker.crop(
        file: File(pickedFile.first.path),
        // ignore: use_build_context_synchronously
        context: context,
      );
      return croppedFile!.path;
    }
    return '';
  }

  static Future<String> captureBannerImage(
    WidgetRef ref,
    BuildContext context,
  ) async {
    final picker = ImageHelper();
    final pickedFile = await picker.takeImage();
    if (pickedFile != null) {
      final croppedFile = await picker.crop(
        file: File(pickedFile.path),
        // ignore: use_build_context_synchronously
        context: context,
      );
      return croppedFile!.path;
    }
    return '';
  }

  static DefaultStyles articleTextEditorStyles(
    BuildContext context,
    DefaultTextStyle defaultTextStyle,
  ) {
    return DefaultStyles(
      h1: DefaultTextBlockStyle(
        Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 23,
              height: 1.15,
            ),
        HorizontalSpacing.zero,
        const VerticalSpacing(16, 0),
        VerticalSpacing.zero,
        null,
      ),
      paragraph: DefaultTextBlockStyle(
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17,
            ),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      placeHolder: DefaultTextBlockStyle(
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17,
              color: Theme.of(context).textTheme.bodySmall!.color!,
            ),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      sizeSmall: defaultTextStyle.style.copyWith(fontSize: 9),
      lists: DefaultListBlockStyle(
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17,
            ),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        const VerticalSpacing(
          0,
          20,
        ),
        null,
        null,
      ),
      leading: DefaultListBlockStyle(
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17,
            ),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
        null,
      ),
    );
  }

  static Future<bool?> showArticleDraftsScreen(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return const DraftArticleScreen();
      },
    );
  }

  static Article createArticleFromDraft(
    ArticleDraft articleDraft,
    UserRecord currentUser,
  ) {
    return Article(
      ownerId: currentUser.userInfo!.id!,
      owner: currentUser,
      banner: articleDraft.banner,
      title: articleDraft.title,
      content: articleDraft.content,
    );
  }

  static Article articleToSendFromDraft(ArticleDraft articleDraft) {
    return Article(
      ownerId: 0,
      title: articleDraft.title,
      content: articleDraft.content,
      banner: articleDraft.banner,
    );
  }

  static ArticleDraft createDraftFromArticle(Article article) {
    return ArticleDraft(
      draftId: DateTime.now().millisecondsSinceEpoch,
      title: article.title ?? '',
      content: article.content ?? '',
      banner: article.banner ?? '',
      createdAt: DateTime.now(),
    );
  }

  static ArticleDraft createDraftFromArticleState(ArticleState articleState) {
    return ArticleDraft(
      banner: articleState.banner,
      content: articleState.content,
      title: articleState.title,
    );
  }

  static Article articleToSend(
    ArticleState articleState,
    int? id,
    int ownerId,
  ) {
    return Article(
      id: id,
      ownerId: ownerId,
      title: articleState.title,
      content: articleState.content,
      banner: articleState.banner,
    );
  }
}
