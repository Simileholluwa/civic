import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

class AssetService {
  AssetService({required this.client});
  final Client client;
  static const int _maxRetries = 3;
  static const Duration _initialBackoff = Duration(milliseconds: 500);

  Duration _nextBackoff(int attempt) {
    // Exponential backoff with small jitter
    final base = _initialBackoff.inMilliseconds * pow(2, attempt).toInt();
    final jitter = Random().nextInt(250); // up to 250ms jitter
    return Duration(milliseconds: base + jitter);
  }

  bool _isRetryable(Object e) {
    // Consider network and timeouts retryable, and 5xx server errors if available
    if (e is SocketException || e is TimeoutException) return true;
    if (e is ServerpodClientException) {
      try {
        final status = e.statusCode;
        if (status >= 500) return true;
      } on Exception catch (_) {
        // If status not available, fall through
      }
    }
    return false;
  }

  Future<Either<String, String>> _uploadSingleWithRetry(
    String mediaPath,
    String folderName,
    String subFolderName,
  ) async {
    var attempt = 0;
    Object? lastError;
    while (attempt <= _maxRetries) {
      try {
        final file = XFile(mediaPath);
        final path = '$folderName/$subFolderName/${file.name}';
        final uploadDescription =
            await client.assets.getUploadDescription(path);
        if (uploadDescription == null) {
          throw Exception(TTexts.unableToInitiateAssetUpload);
        }
        final uploader = FileUploader(uploadDescription);
        final stream = file.openRead();
        final length = await file.length();
        await uploader.upload(stream, length);
        final success = await client.assets.verifyUpload(path);
        if (!success) {
          throw Exception(TTexts.couldNotCompleteUpload);
        }
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
        // Treat generic exceptions as non-retryable by default
        return left(e.toString());
      }

      // If here, we encountered a retryable error
      if (attempt == _maxRetries || !_isRetryable(lastError)) {
        if (lastError is ServerpodClientException) {
          return left(lastError.message);
        }
        return left(lastError.toString());
      }
      await Future<void>.delayed(_nextBackoff(attempt));
      attempt++;
    }
    // Should not reach here
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
          folderName,
          subFolderName,
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
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
