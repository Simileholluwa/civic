import 'dart:convert';
import 'dart:developer';

import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

abstract class ArticleLocalDatabase {
  Future<void> saveDraftArticle({
    required ArticleDraft articleDraft,
    required QuillController controller,
  });
  List<ArticleDraft> retrieveDraftArticles();
  Future<List<ArticleDraft>> removeAllDraftArticles();
  Future<void> deleteDraftArticle({
    required ArticleDraft articleDraft,
    required QuillController controller,
  });
}

class ArticleLocalDatabaseImpl extends ArticleLocalDatabase {
  ArticleLocalDatabaseImpl({
    required AppLocalStorage prefs,
  }) : _prefs = prefs;
  final AppLocalStorage _prefs;
  @override
  List<ArticleDraft> retrieveDraftArticles() {
    try {
      final articlesDraft = _prefs.getString('articlesDraft');
      final ownerId = _prefs.getInt('userId');
      if (articlesDraft != null) {
        final draftList = jsonDecode(articlesDraft) as List<dynamic>;
        return draftList
            .map(
              (articleDraft) =>
                  ArticleDraft.fromJson(articleDraft as Map<String, dynamic>),
            )
            .where((draft) => draft.ownerId == ownerId)
            .toList();
      }
      return <ArticleDraft>[];
    } catch (e) {
      log(e.toString());
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> saveDraftArticle({
    required ArticleDraft articleDraft,
    required QuillController controller,
  }) async {
    try {
      final drafts = await clearExpiredDrafts();
      final ownerId = _prefs.getInt('userId');
      var savedImagesPath = <String>[];
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/articles_draft');
      var content = articleDraft.content;
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      final embededImages = THelperFunctions.getAllImagesFromEditor(controller);
      final savedBanner = await saveBannerImage(articleDraft.banner, directory);
      if (embededImages.isNotEmpty) {
        for (var i = 0; i < embededImages.length; i++) {
          final ext = path.extension(embededImages[i]);
          final fileName = '${DateTime.now()}$i$ext';
          final savedFile = File(
            path.join(directory.path, fileName),
          );
          final copy = await File(embededImages[i]).copy(savedFile.path);
          savedImagesPath.add(copy.path);
        }
        final pathReplacements =
            THelperFunctions.mapEmbededImages(embededImages, savedImagesPath);
        content = THelperFunctions.modifyArticleContent(
          controller,
          pathReplacements,
        );
      }
      if (drafts.length < 10) {
        drafts.add(
          articleDraft.copyWith(
            draftId: DateTime.now().millisecondsSinceEpoch,
            ownerId: ownerId,
            createdAt: DateTime.now(),
            banner: savedBanner,
            content: content,
            title: articleDraft.title,
          ),
        );
        final jsonString = jsonEncode(
          drafts.map((draft) => draft.toJson()).toList(),
        );
        await _prefs.setString('articlesDraft', jsonString);
      }
    } catch (e) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  Future<String> saveBannerImage(
      String bannerImage, Directory directory) async {
    final ext = path.extension(bannerImage);
    final fileName = '${DateTime.now()}$ext';
    final savedFile = File(
      path.join(directory.path, fileName),
    );
    final copy = await File(bannerImage).copy(savedFile.path);
    return copy.path;
  }

  Future<List<ArticleDraft>> clearExpiredDrafts() async {
    try {
      var drafts = retrieveDraftArticles();
      if (drafts.isEmpty) return <ArticleDraft>[];

      final latestDraft = drafts.where((draft) {
        return DateTime.now()
                .difference(
                  DateTime.fromMillisecondsSinceEpoch(
                    int.parse(
                      draft.createdAt!.millisecondsSinceEpoch.toString(),
                    ),
                  ),
                )
                .inDays <=
            10;
      }).toList();
      return latestDraft;
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> deleteDraftArticle({
    required ArticleDraft articleDraft,
    required QuillController controller,
  }) async {
    try {
      final drafts = retrieveDraftArticles();

      drafts.removeWhere((draft) => draft.draftId == articleDraft.draftId);

      final draftsJson = jsonEncode(
        drafts.map((draft) => draft.toJson()).toList(),
      );

      await _prefs.setString('postsDraft', draftsJson);
      final embededImages = THelperFunctions.getAllImagesFromEditor(controller);
      if (embededImages.isNotEmpty) {
        for (final imgPath in embededImages) {
          final imageFile = File(imgPath);
          if (imageFile.existsSync()) {
            imageFile.deleteSync();
          }
        }
      }
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<List<ArticleDraft>> removeAllDraftArticles() async {
    try {
      await _prefs.remove('articlesDraft');
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/articles_draft');
      if (!await directory.exists()) {
        await directory.delete(recursive: true);
      }

      final drafts = retrieveDraftArticles();
      return drafts;
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
