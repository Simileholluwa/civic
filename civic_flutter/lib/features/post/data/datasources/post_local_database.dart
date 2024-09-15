import 'dart:convert';

import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

abstract class PostLocalDatabase {
  Future<void> saveDraft({
    required DraftPost draftPost,
  });
  List<DraftPost> retrieveDrafts();
  Future<List<DraftPost>> removeAllDraftPost();
  Future<void> deleteDraftPost({
    required DraftPost draftPost,
  });
}

class PostLocalDatabaseImpl extends PostLocalDatabase {
  PostLocalDatabaseImpl({
    required AppLocalStorage prefs,
  }) : _prefs = prefs;
  final AppLocalStorage _prefs;
  @override
  List<DraftPost> retrieveDrafts() {
    try {
      final postsDraft = _prefs.getString('postsDraft');
      final ownerId = _prefs.getInt('userId');
      if (postsDraft != null) {
        final draftList = jsonDecode(postsDraft) as List<dynamic>;
        return draftList
            .map(
              (postDraft) =>
                  DraftPost.fromJson(postDraft as Map<String, dynamic>),
            )
            .where((draft) => draft.ownerId == ownerId)
            .toList();
      }
      return <DraftPost>[];
    } catch (e) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> saveDraft({
    required DraftPost draftPost,
  }) async {
    try {
      final drafts = await clearExpiredDrafts();
      final ownerId = _prefs.getInt('userId');
      var savedImagesPath = <String>[];
      var savedVideoPath = '';
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/drafts');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (draftPost.imagesPath.isNotEmpty) {
        for (var i = 0; i < draftPost.imagesPath.length; i++) {
          final ext = path.extension(draftPost.imagesPath[i]);
          final fileName = '${draftPost.draftId}$i$ext';
          final savedFile = File(
            path.join(directory.path, fileName),
          );
          final copy = await File(draftPost.imagesPath[i]).copy(savedFile.path);
          savedImagesPath.add(copy.path);
        }
      }
      if (draftPost.videoPath.isNotEmpty) {
        final ext = path.extension(draftPost.videoPath);
        final fileName = '${draftPost.draftId}$ext';
        final savedFile = File(
          path.join(directory.path, fileName),
        );
        final copy = await File(draftPost.videoPath).copy(savedFile.path);
        savedVideoPath = copy.path;
      }

      if (drafts.length < 10) {
        drafts.add(
          draftPost.copyWith(
            draftId: DateTime.now().millisecondsSinceEpoch,
            ownerId: ownerId,
            createdAt: DateTime.now(),
            imagesPath: savedImagesPath,
            videoPath: savedVideoPath,
          ),
        );
        final jsonString = jsonEncode(
          drafts.map((draft) => draft.toJson()).toList(),
        );
        await _prefs.setString('postsDraft', jsonString);
      }
    } catch (e) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  Future<List<DraftPost>> clearExpiredDrafts() async {
    try {
      var drafts = retrieveDrafts();
      if (drafts.isEmpty) return <DraftPost>[];

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
  Future<void> deleteDraftPost({
    required DraftPost draftPost,
  }) async {
    try {
      final drafts = retrieveDrafts();

      drafts.removeWhere((draft) => draft.draftId == draftPost.draftId);

      final draftsJson = jsonEncode(
        drafts.map((draft) => draft.toJson()).toList(),
      );

      await _prefs.setString('postsDraft', draftsJson);

      if (draftPost.videoPath.isNotEmpty) {
        final videoFile = File(draftPost.videoPath);
        if (videoFile.existsSync()) {
          videoFile.deleteSync();
        }
      }

      if (draftPost.imagesPath.isNotEmpty) {
        for (final imgPath in draftPost.imagesPath) {
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
  Future<List<DraftPost>> removeAllDraftPost() async {
    try {
      await _prefs.remove('postsDraft');
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/drafts');
      if (!await directory.exists()) {
        await directory.delete(recursive: true);
      }

      final drafts = retrieveDrafts();
      return drafts;
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
