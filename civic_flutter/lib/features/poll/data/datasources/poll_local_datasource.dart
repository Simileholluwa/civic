import 'dart:convert';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

abstract class PollLocalDatabase {
  Future<void> savePollDraft({
    required Poll poll,
  });
  Future<Poll> getPollDraft();
  Future<void> deletePollDraft();
}

class PollLocalDatabaseImpl extends PollLocalDatabase {
  PollLocalDatabaseImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;
  final LocalStorage _prefs;

  @override
  Future<Poll> getPollDraft() async {
    try {
      final userId = _prefs.getInt('userId')!;
      final rawOwner = _prefs.getString('userRecord')!;
      final ownerMap = jsonDecode(rawOwner) as Map<String, dynamic>;
      final owner = UserRecord.fromJson(ownerMap);
      final pollDraft = _prefs.getString('pollDraft');
      if (pollDraft != null) {
        final pollMap =
            jsonDecode(pollDraft.toString()) as Map<String, dynamic>;
        if (pollMap['ownerId'] == userId) {
          return Poll.fromJson(pollMap);
        }
        return Poll(
          ownerId: userId,
          owner: owner,
        );
      }
      return Poll(
        ownerId: userId,
        owner: owner,
      );
    } catch (e) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> savePollDraft({
    required Poll poll,
  }) async {
    try {
      var savedImagesPath = <String>[];
      var existingUploadedImage = <String>[];
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/pollDraft');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (poll.imagesUrl!.isNotEmpty) {
        for (var i = 0; i < poll.imagesUrl!.length; i++) {
          final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
          final match = regex.hasMatch(poll.imagesUrl![i]);
          if (match) {
            existingUploadedImage.add(poll.imagesUrl![i]);
          } else {
            final ext = path.extension(poll.imagesUrl![i]);
            final fileName = '${DateTime.now().millisecondsSinceEpoch}$ext';
            final savedFile = File(
              path.join(directory.path, fileName),
            );
            final copy = await File(poll.imagesUrl![i]).copy(savedFile.path);
            savedImagesPath.add(copy.path);
          }
        }
      }
      final rawOwner = _prefs.getString('userRecord')!;
      final ownerMap = jsonDecode(rawOwner) as Map<String, dynamic>;
      final owner = UserRecord.fromJson(ownerMap);
      final pollDraft = poll.copyWith(
        imagesUrl: [...savedImagesPath, ...existingUploadedImage],
        owner: owner,
      ).toJson();
      final jsonString = jsonEncode(pollDraft);
      await _prefs.setString('pollDraft', jsonString);
    } catch (e) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

    @override
  Future<void> deletePollDraft() async {
    try {
      await _prefs.remove('pollDraft');
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory('${appDir.path}/pollDraft');
      if (!await directory.exists()) {
        await directory.delete(recursive: true);
      }
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
