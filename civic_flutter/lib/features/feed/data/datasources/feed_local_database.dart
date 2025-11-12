import 'dart:convert';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

abstract class FeedLocalDatabase {
  Future<List<Post>> getDrafts({
    required String draftType,
  });

  Future<void> saveOrUpdateDraft({
    required Post post,
    required String draftType,
  });

  Future<void> deleteDraftById({
    required String draftType,
    required int draftId,
  });

  Future<void> clearDrafts({
    required String draftType,
  });
}

class FeedLocalDatabaseImpl extends FeedLocalDatabase {
  FeedLocalDatabaseImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;
  final LocalStorage _prefs;
  static const int _maxDrafts = 10;
  static final _urlRegex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');

  Future<List<Map<String, dynamic>>> _readDraftsJson(
    String draftType,
  ) async {
    final raw = _prefs.getString(draftType);
    if (raw == null) return <Map<String, dynamic>>[];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        return decoded.whereType<Map<String, dynamic>>().toList(growable: true);
      }
      // Backward compat: if it was a single draft Map, wrap into list
      if (decoded is Map<String, dynamic>) {
        return <Map<String, dynamic>>[decoded];
      }
      return <Map<String, dynamic>>[];
    } on FormatException catch (_) {
      return <Map<String, dynamic>>[];
    }
  }

  Future<void> _writeDraftsJson(
    String draftType,
    List<Map<String, dynamic>> drafts,
  ) async {
    final jsonString = jsonEncode(drafts);
    await _prefs.setString(draftType, jsonString);
  }

  Future<void> _cleanupStoredDraftFiles(Map<String, dynamic> map) async {
    try {
      final images =
          (map['imageUrls'] as List?)?.whereType<String>() ?? const <String>[];
      for (final p in images) {
        if (!_urlRegex.hasMatch(p)) {
          final f = File(p);
          if (f.existsSync()) {
            await f.delete();
          }
        }
      }
      final video = map['videoUrl'] as String?;
      if (video != null && video.isNotEmpty && !_urlRegex.hasMatch(video)) {
        final vf = File(video);
        if (vf.existsSync()) {
          await vf.delete();
        }
      }
    } on Exception catch (_) {
      // ignore cleanup failures
    }
  }

  @override
  Future<List<Post>> getDrafts({required String draftType}) async {
    try {
      final userId = _prefs.getInt('userId')!;
      final maps = await _readDraftsJson(draftType);
      final filtered = maps.where((m) => m['ownerId'] == userId).toList();
      return filtered.map(Post.fromJson).toList();
    } on Exception catch (_) {
      throw const CacheException(message: TTexts.somethingWentWrong);
    }
  }

  @override
  Future<void> saveOrUpdateDraft({
    required Post post,
    required String draftType,
  }) async {
    try {
      final userId = _prefs.getInt('userId')!;
      final rawOwner = _prefs.getString('userRecord')!;
      final ownerMap = jsonDecode(rawOwner) as Map<String, dynamic>;
      final owner = UserRecord.fromJson(ownerMap);

      final savedImagesPath = <String>[];
      final existingUploadedImage = <String>[];
      var existingUploadedVideo = '';
      var savedVideoPath = '';
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/$draftType');
      if (!directory.existsSync()) {
        await directory.create(recursive: true);
      }

      if ((post.imageUrls ?? []).isNotEmpty) {
        for (final img in post.imageUrls!) {
          final match = _urlRegex.hasMatch(img);
          if (match) {
            existingUploadedImage.add(img);
          } else {
            final ext = path.extension(img);
            final fileName = '${DateTime.now().millisecondsSinceEpoch}$ext';
            final savedFile = File(path.join(directory.path, fileName));
            final copy = await File(img).copy(savedFile.path);
            savedImagesPath.add(copy.path);
          }
        }
      }

      if ((post.videoUrl ?? '').isNotEmpty) {
        final video = post.videoUrl!;
        final match = _urlRegex.hasMatch(video);
        if (match) {
          existingUploadedVideo = video;
        } else {
          final ext = path.extension(video);
          final fileName = '${DateTime.now().millisecondsSinceEpoch}$ext';
          final savedFile = File(path.join(directory.path, fileName));
          final copy = await File(video).copy(savedFile.path);
          savedVideoPath = copy.path;
        }
      }

      final draftId = post.id ?? DateTime.now().millisecondsSinceEpoch;
      final toStore = post
          .copyWith(
            id: draftId,
            ownerId: userId,
            owner: owner,
            imageUrls: [...savedImagesPath, ...existingUploadedImage],
            videoUrl: existingUploadedVideo.isNotEmpty
                ? existingUploadedVideo
                : savedVideoPath,
          )
          .toJson();

      final list = await _readDraftsJson(draftType);
      final idx = list.indexWhere((m) => m['id'] == draftId);
      if (idx >= 0) {
        // update and move to end to mark most-recent
        list[idx] = toStore;
        final moved = list.removeAt(idx);
        list.add(moved);
      } else {
        list.add(toStore);
      }
      // trim to max drafts, removing oldest first
      while (list.length > _maxDrafts) {
        final oldest = list.first;
        await _cleanupStoredDraftFiles(oldest);
        list.removeAt(0);
      }
      await _writeDraftsJson(draftType, list);
    } on Exception catch (_) {
      throw const CacheException(message: TTexts.somethingWentWrong);
    }
  }

  @override
  Future<void> deleteDraftById({
    required String draftType,
    required int draftId,
  }) async {
    try {
      final list = await _readDraftsJson(draftType);
      final idx = list.indexWhere((m) => m['id'] == draftId);
      if (idx >= 0) {
        // Attempt to delete local files saved for this draft
        final map = list[idx];
        await _cleanupStoredDraftFiles(map);
        list.removeAt(idx);
        await _writeDraftsJson(draftType, list);
      }
    } on Exception catch (_) {
      throw const CacheException(message: TTexts.somethingWentWrong);
    }
  }

  @override
  Future<void> clearDrafts({
    required String draftType,
  }) async {
    try {
      final list = await _readDraftsJson(draftType);
      for (final map in list) {
        await _cleanupStoredDraftFiles(map);
      }
      await _prefs.remove(draftType);
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/$draftType');
      if (directory.existsSync()) {
        await directory.delete(recursive: true);
      }
    } on Exception catch (_) {
      throw const CacheException(message: TTexts.somethingWentWrong);
    }
  }
}
