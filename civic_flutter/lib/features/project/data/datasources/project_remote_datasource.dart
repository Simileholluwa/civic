import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class ProjectRemoteDataSource {
  Future<ProjectList> getProjects({
    required int limit,
    required int page,
  });

  Future<ProjectVetList> getVettedProjects({
    required int limit,
    required int page,
  });

  Future<Project?> getProject({required int id});

  Future<Project?> saveProject({required Project project});

  Future<ProjectReviewList> getProjectReviews({
    required int projectId,
    required int limit,
    required int page,
    double? rating,
    String? cardinal,
  });

  Future<ProjectReview?> getProjectReview({required int id});

  Future<void> deleteProjectReview({required int id});

  Future<ProjectReview> reactToReview({
    required int reviewId,
    required bool isLike,
  });

  Future<ProjectReview?> saveProjectReview({
    required ProjectReview projectReview,
  });

  Future<void> scheduleProject({
    required Project project,
    required DateTime dateTime,
  });

  Future<void> deleteProject({required int id});

  Future<void> toggleLike({
    required int projectId,
  });

  Future<void> toggleBookmark({
    required int projectId,
  });

  Future<void> undoRepost({
    required int projectId,
  });

  Future<void> markNotInterested({
    required int projectId,
  });

  Future<ProjectVetting> getVettedProject({
    required int projectId,
  });

  Future<ProjectVetting> vetProject({
    required ProjectVetting projectVetting,
  });
}

class ProjectRemoteDatasourceImpl extends ProjectRemoteDataSource {
  ProjectRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;
  final Client _client;
  @override
  Future<void> deleteProject({required int id}) async {
    try {
      return await _client.project.deleteProject(
        id,
      );
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Project?> getProject({required int id}) async {
    try {
      final result = await _client.project.getProject(
        id,
      );
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectList> getProjects({
    required int limit,
    required int page,
  }) async {
    try {
      final result = _client.project.getProjects(
        limit: limit,
        page: page,
      );
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectVetList> getVettedProjects({
    required int limit,
    required int page,
  }) async {
    try {
      final result = _client.project.getVettedProjects(
        limit: limit,
        page: page,
      );
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Project?> saveProject({required Project project}) async {
    try {
      final result = await _client.project.saveProject(
        project,
      );

      if (result == null) {
        return null;
      }
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> scheduleProject({
    required Project project,
    required DateTime dateTime,
  }) async {
    try {
      await _client.project.scheduleProject(
        project,
        dateTime,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> toggleLike({
    required int projectId,
  }) async {
    try {
      return await _client.project.toggleLike(
        projectId,
      );
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectReview?> getProjectReview({required int id}) async {
    try {
      final result = await _client.project.getProjectReview(
        id,
      );
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectReviewList> getProjectReviews({
    required int projectId,
    required int limit,
    required int page,
    double? rating,
    String? cardinal,
  }) async {
    try {
      final result = _client.project.getProjectReviews(
        projectId,
        limit: limit,
        page: page,
        rating: rating,
        cardinal: cardinal,
      );
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectReview?> saveProjectReview({
    required ProjectReview projectReview,
  }) async {
    try {
      final result = await _client.project
          .saveProjectReview(
            projectReview,
          )
          .timeout(
            const Duration(
              seconds: 60,
            ),
          );

      if (result == null) {
        return null;
      }
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectReview> reactToReview({
    required int reviewId,
    required bool isLike,
  }) async {
    try {
      final result = await _client.project
          .reactToReview(
            reviewId,
            isLike,
          )
          .timeout(
            const Duration(
              seconds: 60,
            ),
          );

      if (result == null) {
        throw const ServerException(message: 'Failed to react to review');
      }
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> toggleBookmark({
    required int projectId,
  }) async {
    try {
      final result = await _client.project.toggleBookmark(
        projectId,
      );
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> undoRepost({
    required int projectId,
  }) async {
    try {
      final result = await _client.project.undoRepost(
        projectId,
      );
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> markNotInterested({
    required int projectId,
  }) async {
    try {
      final result = await _client.project.markNotInterested(
        projectId,
      );
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
  
  @override
  Future<void> deleteProjectReview({required int id}) async {
    try {
      final result = await _client.project.deleteProjectReview(
        id,
      );
      if (result) {
        return;
      } else {
        throw const ServerException(message: 'Failed to delete project review');
      }
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out');
    } on SocketException catch (_) {
      throw const ServerException(message: 'Failed to connect to server');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
  
  @override
  Future<ProjectVetting> vetProject({required ProjectVetting projectVetting}) async {
    try {
      final result = await _client.project.vetProject(
        projectVetting,
      );
      if (result == null) {
        throw const ServerException(message: 'Failed to vet project');
      }
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
  
  @override
  Future<ProjectVetting> getVettedProject({required int projectId}) async {
    try {
      final result = await _client.project.getVettedProject(
        projectId,
      );
      if (result == null) {
        throw const ServerException(message: 'Failed to vet project');
      }
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
