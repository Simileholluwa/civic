import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class ProjectLocalDataSource {
  Future<void> saveProjectDraft({required Project project});
  Future<List<Project>> getProjectDrafts();
  Future<void> deleteProjectDraft({required int projectId});
  Future<void> deleteAllProjectDrafts();
}

class ProjectLocalDataSourceImpl extends ProjectLocalDataSource {
  ProjectLocalDataSourceImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;
  final LocalStorage _prefs;

  @override
  Future<void> saveProjectDraft({required Project project}) async {
    try {
      final drafts = await getProjectDrafts();
      final index = drafts.indexWhere((p) => p.id == project.id);
      if (index != -1) {
        drafts[index] = project;
      } else {
        drafts.add(project);
      }
      final draftStrings = drafts
          .map(
            (p) => jsonEncode(
              p.toJson(),
            ),
          )
          .toList();
      await _prefs.setList('projectDrafts', draftStrings);
    } on Exception catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<List<Project>> getProjectDrafts() async {
    try {
      final userId = _prefs.getInt('userId')!;
      final projectDrafts = _prefs.getList('projectDrafts');
      if (projectDrafts != null) {
        return projectDrafts
            .map((draft) {
              final projectMap = jsonDecode(draft) as Map<String, dynamic>;
              if (projectMap['ownerId'] == userId) {
                return Project.fromJson(projectMap);
              }
              return null;
            })
            .whereType<Project>()
            .toList();
      }
      return [];
    } on Exception catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> deleteProjectDraft({required int projectId}) async {
    try {
      final drafts = await getProjectDrafts();
      drafts.removeWhere((p) => p.id == projectId);
      final draftStrings = drafts.map((p) => jsonEncode(p.toJson())).toList();
      await _prefs.setList('projectDrafts', draftStrings);
    } on Exception catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> deleteAllProjectDrafts() async {
    try {
      await _prefs.remove('projectDrafts');
    } on Exception catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
