import 'dart:convert';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';

abstract class PollLocalDatabase {
  Future<void> saveDraft({
    required DraftPoll draftPoll,
  });
  List<DraftPoll> retrieveDrafts();
  Future<List<DraftPoll>> removeAllDraftPoll();
  Future<void> deleteDraftPoll({
    required DraftPoll draftPoll,
  });
}

class PollLocalDatabaseImpl extends PollLocalDatabase {
  PollLocalDatabaseImpl({
    required AppLocalStorage prefs,
  }) : _prefs = prefs;
  final AppLocalStorage _prefs;
  @override
  List<DraftPoll> retrieveDrafts() {
    try {
      final pollsDraft = _prefs.getString('pollsDraft');
      final ownerId = _prefs.getInt('userId');
      if (pollsDraft != null) {
        final draftList = jsonDecode(pollsDraft) as List<dynamic>;
        return draftList
            .map(
              (pollDraft) =>
                  DraftPoll.fromJson(pollDraft as Map<String, dynamic>),
            )
            .where((draft) => draft.ownerId == ownerId)
            .toList();
      }
      return <DraftPoll>[];
    } catch (e) {
      log(e.toString());
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> saveDraft({
    required DraftPoll draftPoll,
  }) async {
    try {
      final drafts = await clearExpiredDrafts();
      final ownerId = _prefs.getInt('userId');
      if (drafts.length < 10) {
        drafts.add(
          draftPoll.copyWith(
            draftId: DateTime.now().millisecondsSinceEpoch,
            ownerId: ownerId,
            createdAt: DateTime.now(),
          ),
        );
        final jsonString = jsonEncode(
          drafts.map((draft) => draft.toJson()).toList(),
        );
        await _prefs.setString('pollsDraft', jsonString);
      }
    } catch (e) {
      
      throw const CacheException(message: 'Something went wrong');
    }
  }

  Future<List<DraftPoll>> clearExpiredDrafts() async {
    try {
      var drafts = retrieveDrafts();
      if (drafts.isEmpty) return <DraftPoll>[];

      final latestDraft = drafts.where((draft) {
        return DateTime.now()
                .difference(
                  DateTime.fromMillisecondsSinceEpoch(
                    int.parse(
                      draft.createdAt!.millisecondsSinceEpoch.toString(),
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
  Future<void> deleteDraftPoll({
    required DraftPoll draftPoll,
  }) async {
    try {
      final drafts = retrieveDrafts();

      drafts.removeWhere((draft) => draft.draftId == draftPoll.draftId);

      final draftsJson = jsonEncode(
        drafts.map((draft) => draft.toJson()).toList(),
      );

      await _prefs.setString('pollsDraft', draftsJson);

    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<List<DraftPoll>> removeAllDraftPoll() async {
    try {
      await _prefs.remove('pollsDraft');
      final drafts = retrieveDrafts();
      return drafts;
    } catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
