import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';

abstract class PostLocalDatabase {
  Future<void> saveDraft({
    required DraftPost draftPost,
  });
  List<DraftPost> retrieveDrafts();
  Future<List<DraftPost>> removeAllDraftPost();
  Future<void> deleteDraftPost({
    required int draftId,
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
      if (postsDraft != null) {
        final draftList = jsonDecode(postsDraft) as List<dynamic>;
        return draftList
            .map(
              (postDraft) =>
                  DraftPost.fromJson(postDraft as Map<String, dynamic>),
            )
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

      if (drafts.length < 10) {
        drafts.add(draftPost);
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
                      draft.createdAt.millisecondsSinceEpoch.toString(),
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
    required int draftId,
  }) async {
    try {
      final drafts = retrieveDrafts();

      drafts.removeWhere((draft) => draft.draftId == draftId);

      final draftsJson = jsonEncode(
        drafts.map((draft) => draft.toJson()).toList(),
      );
      await _prefs.setString('postsDraft', draftsJson);
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<List<DraftPost>> removeAllDraftPost() async {
    try {
      await _prefs.remove('postsDraft');

      final drafts = retrieveDrafts();
      return drafts;
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
