import 'package:civic_server/src/generated/endpoints.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:civic_server/src/services/media_service.dart';
import 'package:serverpod/serverpod.dart';

class MediaEndpoint extends Endpoint {
  final _defaultService = MediaService();

  Future<Map<String, String?>> requestUploadTarget(
    Session session, {
    required String kind,
    required String ext,
    int? postId,
    String? prefix,
  }) async {
    final mediaKind = MediaKind.values.firstWhere(
      (k) => k.name == kind,
      orElse: () => MediaKind.image,
    );
    final service = prefix != null ? MediaService(prefix: prefix) : _defaultService;
    return service.requestUploadTarget(
      session,
      kind: mediaKind,
      ext: ext,
      postId: postId,
    );
  }

  Future<String> confirmUpload(
    Session session, {
    required String path,
    required String kind,
  }) async {
    final mediaKind = MediaKind.values.firstWhere(
      (k) => k.name == kind,
      orElse: () => MediaKind.image,
    );
    return _defaultService.confirmUpload(session, path: path, kind: mediaKind);
  }

  Future<bool> deleteAsset(Session session, int assetId) async {
    return _defaultService.deleteAssetById(session, assetId);
  }

  Future<int> deleteAssetsByPost(Session session, int postId) async {
    return _defaultService.deleteAssetsByPost(session, postId);
  }

  Future<int> cleanupTemp(Session session) async {
    return _defaultService.cleanupTemp(session);
  }

  Future<void> scheduleCleanup(Session session, {int hours = 24}) async {
    final h = hours <= 0 ? 24 : hours;
    await session.serverpod.futureCalls
        .callAtTime(DateTime.now().add(Duration(hours: h)))
        .mediaCleanup
        .cleanUpMedia(MediaCleanupParams(hours: h));
  }

  Future<List<MediaAsset>> listAssets(
    Session session,
    int postId, {
    String? kind,
  }) async {
    MediaKind? k;
    if (kind != null) {
      k = MediaKind.values.firstWhere(
        (e) => e.name == kind,
        orElse: () => MediaKind.image,
      );
    }
    return MediaAsset.db.find(
      session,
      where: (a) =>
          a.postId.equals(postId) &
          (k != null ? a.kind.equals(k) : Constant.bool(true)),
    );
  }
}
