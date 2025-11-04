import 'dart:convert';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

abstract class FeedLocalDatabase {
  Future<void> saveDraft({
    required Post post,
    required String draftType,
  });
  Future<Post> getDraft({
    required String draftType,
  });
  Future<void> deleteDraft({
    required String draftType,
  });
}

class FeedLocalDatabaseImpl extends FeedLocalDatabase {
  FeedLocalDatabaseImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;
  final LocalStorage _prefs;
  @override
  Future<Post> getDraft({
    required String draftType,
  }) async {
    try {
      final userId = _prefs.getInt('userId')!;
      final rawOwner = _prefs.getString('userRecord')!;
      final ownerMap = jsonDecode(rawOwner) as Map<String, dynamic>;
      final owner = UserRecord.fromJson(ownerMap);
      final postDraft = _prefs.getString(draftType);
      if (postDraft != null) {
        final postMap = jsonDecode(postDraft) as Map<String, dynamic>;
        if (postMap['ownerId'] == userId) {
          return Post.fromJson(postMap);
        }
        return Post(
          ownerId: userId,
          owner: owner,
        );
      }
      return Post(
        ownerId: userId,
        owner: owner,
        poll: Poll(
          ownerId: userId,
          owner: owner,
        ),
        article: Article(
          ownerId: userId,
          owner: owner,
          content: '',
        ),
      );
    } on Exception catch (_) {
      throw const CacheException(message: TTexts.somethingWentWrong);
    }
  }

  @override
  Future<void> saveDraft({
    required Post post,
    required String draftType,
  }) async {
    try {
      final savedImagesPath = <String>[];
      final existingUploadedImage = <String>[];
      var existingUploadedVideo = '';
      var savedVideoPath = '';
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/$draftType');
      if (!directory.existsSync()) {
        await directory.create(recursive: true);
      }
      if (post.imageUrls!.isNotEmpty) {
        for (var i = 0; i < post.imageUrls!.length; i++) {
          final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
          final match = regex.hasMatch(post.imageUrls![i]);
          if (match) {
            existingUploadedImage.add(post.imageUrls![i]);
          } else {
            final ext = path.extension(post.imageUrls![i]);
            final fileName = '${DateTime.now().millisecondsSinceEpoch}$ext';
            final savedFile = File(
              path.join(directory.path, fileName),
            );
            final copy = await File(post.imageUrls![i]).copy(savedFile.path);
            savedImagesPath.add(copy.path);
          }
        }
      }
      if (post.videoUrl!.isNotEmpty) {
        final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
        final match = regex.hasMatch(post.videoUrl!);
        if (match) {
          existingUploadedVideo = post.videoUrl!;
        } else {
          final ext = path.extension(post.videoUrl!);
          final fileName = '${DateTime.now().millisecondsSinceEpoch}$ext';
          final savedFile = File(
            path.join(directory.path, fileName),
          );
          final copy = await File(post.videoUrl!).copy(savedFile.path);
          savedVideoPath = copy.path;
        }
      }
      final rawOwner = _prefs.getString('userRecord')!;
      final ownerMap = jsonDecode(rawOwner) as Map<String, dynamic>;
      final owner = UserRecord.fromJson(ownerMap);
      final postDraft = post.copyWith(
        imageUrls: [...savedImagesPath, ...existingUploadedImage],
        videoUrl: savedVideoPath + existingUploadedVideo,
        owner: owner,
      ).toJson();
      final jsonString = jsonEncode(postDraft);
      await _prefs.setString(draftType, jsonString);
    } on Exception catch (_) {
      throw const CacheException(message: TTexts.somethingWentWrong);
    }
  }

  @override
  Future<void> deleteDraft({required String draftType}) async {
    try {
      await _prefs.remove(draftType);
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/$draftType');
      if (!directory.existsSync()) {
        await directory.delete(recursive: true);
      }
    } on Exception catch (_) {
      throw const CacheException(message: TTexts.somethingWentWrong);
    }
  }
}
