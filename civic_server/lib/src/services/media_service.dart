import 'dart:math';

import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class MediaService {

  static const String storageId = 'public';
  final String prefix;

  MediaService({String? prefix}) : prefix = prefix ?? 'public/posts';

  String _randId() {
    final r = Random.secure();
    final bytes = List<int>.generate(12, (_) => r.nextInt(256));
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  String _buildExt(String ext) {
    final clean = ext.trim();
    if (clean.isEmpty) return '';
    return clean.startsWith('.') ? clean : '.$clean';
  }

  String buildPostKey({
    required int userId,
    required MediaKind kind,
    required String ext,
  }) {
    final id = _randId();
    final e = _buildExt(ext);
    final k = kind.name;
    return '$prefix/$userId/$k/$id$e';
  }

  Future<Map<String, String?>> requestUploadTarget(
    Session session, {
    required MediaKind kind,
    required String ext,
    int? postId,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(message: 'You must be logged in');
    }
    final userId = authInfo.userId;
    final path = buildPostKey(
      userId: userId,
      kind: kind,
      ext: ext,
    );

    final description = await session.storage.createDirectFileUploadDescription(
      storageId: storageId,
      path: path,
    );

    return <String, String?>{
      'path': path,
      'description': description,
    };
  }

  Future<String> confirmUpload(
    Session session, {
    required String path,
    required MediaKind kind,
  }) async {
    final verified = await session.storage.verifyDirectFileUpload(
      storageId: storageId,
      path: path,
    );
    if (!verified) {
      throw ServerSideException(
        message: 'Upload not verified for $path',
      );
    }
    return path;
  }

  Future<bool> deleteAssetById(Session session, int assetId) async {
    final asset = await MediaAsset.db.findById(session, assetId);
    if (asset == null) return false;

    try {
      await session.storage.deleteFile(
        storageId: storageId,
        path: asset.objectKey,
      );
    } catch (e) {
      session.log('Failed to delete ${asset.objectKey}: $e');
    }

    await MediaAsset.db.deleteRow(session, asset);
    return true;
  }

  Future<int> deleteAssetsByPost(Session session, int postId) async {
    final assets = await MediaAsset.db.find(
      session,
      where: (a) => a.postId.equals(postId),
    );
    int count = 0;
    for (final a in assets) {
      try {
        await session.storage.deleteFile(
          storageId: storageId,
          path: a.objectKey,
        );
      } catch (e) {
        session.log('Failed to delete ${a.objectKey}: $e');
      }
      await MediaAsset.db.deleteRow(session, a);
      count++;
    }
    return count;
  }

  Future<int> cleanupTemp(
    Session session,
  ) async {
    final tempAssets = await MediaAsset.db.find(
      session,
      where: (a) => a.postId.equals(null),
    );
    int removed = 0;
    for (final a in tempAssets) {
      try {
        await session.storage
            .deleteFile(storageId: storageId, path: a.objectKey);
      } catch (e) {
        session.log('Failed to delete ${a.objectKey}: $e');
      }
      await MediaAsset.db.deleteRow(session, a);
      removed++;
    }
    return removed;
  }
}
