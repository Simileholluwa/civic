import 'dart:convert';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

abstract class PostLocalDatabase {
  Future<void> savePostDraft({
    required Post post,
  });
  Future<Post> getPostDraft();
  Future<void> deletePostDraft();
}

class PostLocalDatabaseImpl extends PostLocalDatabase {
  PostLocalDatabaseImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;
  final LocalStorage _prefs;
  @override
  Future<Post> getPostDraft() async {
    try {
      final userId = _prefs.getInt('userId')!;
      final rawOwner = _prefs.getString('userRecord')!;
      final ownerMap = jsonDecode(rawOwner) as Map<String, dynamic>;
      final owner = UserRecord.fromJson(ownerMap);
      final postDraft = _prefs.getString('postDraft');
      if (postDraft != null) {
        final postMap =
            jsonDecode(postDraft.toString()) as Map<String, dynamic>;
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
      );
    } catch (e) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> savePostDraft({
    required Post post,
  }) async {
    try {
      var savedImagesPath = <String>[];
      var existingUploadedImage = <String>[];
      var existingUploadedVideo = '';
      var savedVideoPath = '';
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/postDraft');
      if (!await directory.exists()) {
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
      await _prefs.setString('postDraft', jsonString);
    } catch (e) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> deletePostDraft() async {
    try {
      await _prefs.remove('postDraft');
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/postDraft');
      if (!await directory.exists()) {
        await directory.delete(recursive: true);
      }
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
