import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AssetService {
  AssetService({required this.client});
  final Client client;
  static const int _maxRetries = 3;
  static const Duration _initialBackoff = Duration(milliseconds: 500);

  Duration _nextBackoff(int attempt) {
    final base = _initialBackoff.inMilliseconds * pow(2, attempt).toInt();
    final jitter = Random().nextInt(250);
    return Duration(milliseconds: base + jitter);
  }

  Future<Map<String, int>?> _getImageDimensions(String mediaPath) async {
    try {
      final file = XFile(mediaPath);
      final bytes = await file.readAsBytes();
      final completer = Completer<ui.Image>();
      ui.decodeImageFromList(bytes, completer.complete);
      final image = await completer.future;
      return {
        'width': image.width,
        'height': image.height,
      };
    } on Exception catch (_) {
      return null;
    }
  }

  Future<Map<String, int>?> _getVideoDimensions(String mediaPath) async {
    try {
      final controller = VideoPlayerController.file(File(mediaPath));
      await controller.initialize();
      final size = controller.value.size;
      final duration = controller.value.duration;
      await controller.dispose();
      return {
        'width': size.width.round(),
        'height': size.height.round(),
        'durationMs': duration.inMilliseconds,
      };
    } on Exception catch (_) {
      return null;
    }
  }

  bool _isRetryable(Object e) {
    if (e is SocketException || e is TimeoutException) return true;
    if (e is ServerpodClientException) {
      try {
        final status = e.statusCode;
        if (status >= 500) return true;
      } on Exception catch (_) {}
    }
    return false;
  }

  Future<Either<String, String>> _uploadSingleWithRetry(
    String mediaPath,
  ) async {
    var attempt = 0;
    Object? lastError;
    while (attempt <= _maxRetries) {
      try {
        final file = XFile(mediaPath);
        final ext = file.name.split('.').last.toLowerCase();
        final kind = _inferKindFromPath(mediaPath);
        final target = await client.media.requestUploadTarget(
          kind: kind.name,
          ext: ext,
        );
        final uploadDescription = target['description'];
        final path = target['path'];
        if (uploadDescription == null || path == null) {
          throw Exception(TTexts.unableToInitiateAssetUpload);
        }
        final uploader = FileUploader(uploadDescription);
        final stream = file.openRead();
        final length = await file.length();
        await uploader.upload(stream, length);
        await client.media.confirmUpload(
          path: path,
          kind: kind.name,
        );
        final decodedDescription =
            jsonDecode(uploadDescription) as Map<String, dynamic>;
        if (!decodedDescription.containsKey('url')) {
          throw Exception(TTexts.couldNotGetUrl);
        }
        final url = '${decodedDescription['url']}/$path';
        return right(url);
      } on SocketException catch (e) {
        lastError = e;
      } on TimeoutException catch (e) {
        lastError = e;
      } on ServerpodClientException catch (e) {
        lastError = e;
        if (!_isRetryable(e)) {
          return left(e.message);
        }
      } on Exception catch (e) {
        lastError = e;
        return left(e.toString());
      }

      if (attempt == _maxRetries || !_isRetryable(lastError)) {
        if (lastError is ServerpodClientException) {
          return left(lastError.message);
        }
        return left(lastError.toString());
      }
      await Future<void>.delayed(_nextBackoff(attempt));
      attempt++;
    }
    return left(TTexts.couldNotCompleteUpload);
  }

  Future<Either<String, List<String>>> uploadMediaAssets(
    List<String> media,
    String folderName,
    String subFolderName,
  ) async {
    try {
      final mediaUrls = <String>[];
      for (final mediaPath in media) {
        final single = await _uploadSingleWithRetry(
          mediaPath,
        );
        if (single.isLeft()) {
          return left(single.getLeft().toNullable()!);
        }
        mediaUrls.add(single.getRight().toNullable()!);
      }
      return right(mediaUrls);
    } on SocketException catch (_) {
      return left(TTexts.failedToConnectToServer);
    } on TimeoutException catch (_) {
      return left(TTexts.requestTimedOut);
    } on ServerpodClientException catch (e) {
      return left(e.message);
    } on ServerSideException catch (e) {
      return left(e.message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  MediaKind _inferKindFromPath(String mediaPath) {
    final ext = mediaPath.split('.').last.toLowerCase();
    const imageExts = {
      'jpg',
      'jpeg',
      'png',
      'gif',
      'webp',
      'bmp',
      'heic',
      'heif',
    };
    const videoExts = {'mp4', 'mov', 'm4v', 'webm', 'avi', 'mkv'};
    if (imageExts.contains(ext)) return MediaKind.image;
    if (videoExts.contains(ext)) return MediaKind.video;
    return MediaKind.image;
  }

  String? _contentTypeForPath(String mediaPath) {
    final ext = mediaPath.split('.').last.toLowerCase();
    switch (ext) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      case 'bmp':
        return 'image/bmp';
      case 'heic':
      case 'heif':
        return 'image/heic';
      case 'mp4':
        return 'video/mp4';
      case 'mov':
      case 'm4v':
        return 'video/quicktime';
      case 'webm':
        return 'video/webm';
      case 'avi':
        return 'video/x-msvideo';
      case 'mkv':
        return 'video/x-matroska';
      default:
        return null;
    }
  }

  String? inferObjectKeyFromUrl(String url) {
    final u = url.trim();
    if (u.isEmpty) return null;
    if (u.startsWith('public/')) return u;
    final i = u.indexOf('/public/');
    if (i >= 0) {
      final key = u.substring(i + 1);
      return key.isNotEmpty ? key : null;
    }
    return null;
  }

  Future<Either<String, MediaAsset>> uploadSingleMediaAsset({
    required String mediaPath,
  }) async {
    final retry = await _uploadSingleWithRetry(
      mediaPath,
    );
    if (retry.isLeft()) return left(retry.getLeft().toNullable()!);
    final publicUrl = retry.getRight().toNullable()!;
    try {
      final file = XFile(mediaPath);
      final length = await file.length();
      final kind = _inferKindFromPath(mediaPath);
      final contentType = _contentTypeForPath(mediaPath);
      int? width;
      int? height;
      int? durationMs;
      if (kind == MediaKind.image) {
        final dims = await _getImageDimensions(mediaPath);
        if (dims != null) {
          width = dims['width'];
          height = dims['height'];
        }
      } else if (kind == MediaKind.video) {
        final dims = await _getVideoDimensions(mediaPath);
        if (dims != null) {
          width = dims['width'];
          height = dims['height'];
          durationMs = dims['durationMs'];
        }
      }
      final asset = MediaAsset(
        ownerId: 0,
        objectKey: inferObjectKeyFromUrl(publicUrl) ?? '',
        publicUrl: publicUrl,
        contentType: contentType,
        size: length,
        width: width,
        height: height,
        durationMs: durationMs,
        kind: kind,
      );
      dev.log(asset.toString());
      return right(asset);
    } on ServerpodClientException catch (e) {
      return left(e.message);
    } on ServerSideException catch (e) {
      return left(e.message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<MediaAsset>>> uploadPostMediaAssets(
    List<String> media,
  ) async {
    try {
      final results = <MediaAsset>[];
      for (final mediaPath in media) {
        final single = await uploadSingleMediaAsset(
          mediaPath: mediaPath,
        );
        if (single.isLeft()) {
          return left(single.getLeft().toNullable()!);
        }
        results.add(single.getRight().toNullable()!);
      }
      return right(results);
    } on ServerpodClientException catch (e) {
      return left(e.message);
    } on ServerSideException catch (e) {
      return left(e.message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
