import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

class AssetService {
  AssetService({required this.client});
  final Client client;
  Future<Either<String, List<String>>> uploadMediaAssets(
    List<String> media,
    String folderName,
    String subFolderName,
  ) async {
    try {
      final mediaUrls = <String>[];
      for (final mediaPath in media) {
        final file = XFile(mediaPath);
        final path = '$folderName/$subFolderName/${file.name}';
        final uploadDescription =
            await client.assets.getUploadDescription(path);
        if (uploadDescription == null) {
          return left(TTexts.unableToInitiateAssetUpload);
        }
        final uploader = FileUploader(uploadDescription);
        final stream = file.openRead();
        final length = (await file.readAsBytes()).length;
        await uploader.upload(stream, length);
        final success = await client.assets.verifyUpload(path);
        if (!success) return left(TTexts.couldNotCompleteUpload);
        final decodedDescription =
            jsonDecode(uploadDescription) as Map<String, dynamic>;
        if (!decodedDescription.containsKey('url')) {
          return left(TTexts.couldNotGetUrl);
        }
        mediaUrls.add('${decodedDescription['url']}/$path');
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
