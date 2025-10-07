import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class ProjectLocalDataSource {
  Future<void> saveProjectDraft({required Project project});
  Future<Project> getProjectDraft();
  Future<void> deleteProjectDraft();
}

class ProjectLocalDataSourceImpl extends ProjectLocalDataSource {
  ProjectLocalDataSourceImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;
  final LocalStorage _prefs;

  @override
  Future<void> saveProjectDraft({required Project project}) async {
    try {
      final projectDraft = project.toJson();
      final jsonString = jsonEncode(projectDraft);
      await _prefs.setString('projectDraft', jsonString);
    } on Exception catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<Project> getProjectDraft() async {
    try {
      final userId = _prefs.getInt('userId')!;
      final projectDraft = _prefs.getString('projectDraft');
      if (projectDraft != null) {
        final projectMap = jsonDecode(projectDraft) as Map<String, dynamic>;
        if (projectMap['ownerId'] == userId) {
          return Project.fromJson(projectMap);
        }
        return Project(
          ownerId: userId,
        );
      }

      return Project(
        ownerId: userId,
      );
    } on Exception catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> deleteProjectDraft() async {
    try {
      await _prefs.remove('projectDraft');
    } on Exception catch (_) {
      throw const CacheException(message: 'Something went wrong');
    }
  }
}
