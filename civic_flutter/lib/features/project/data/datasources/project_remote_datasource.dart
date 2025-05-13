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

  Future<Project> getProject({required int id});

  Future<Project> saveProject({required Project project});

  Future<ProjectReviewList> getProjectReviews({
    required int projectId,
    required int limit,
    required int page,
    double? rating,
    String? cardinal,
  });

  Future<ProjectReview?> getProjectReview({required int id});

  Future<void> deleteProjectReview({required int id});

  Future<void> deleteProjectVetting({required int vettingId});

  Future<ProjectReview> reactToReview({
    required int reviewId,
    required bool isLike,
  });

  Future<ProjectVetting> reactToVetting({
    required int vettingId,
    required bool isLike,
  });

  Future<ProjectReview> saveProjectReview({
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

  Future<ProjectVetting?> getVettedProject({
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
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Project> getProject({required int id}) async {
    try {
      final result = await _client.project.getProject(
        id,
      );
      return result;
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Project> saveProject({required Project project}) async {
    try {
      final result = await _client.project.saveProject(
        project,
      );
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
    } on PostException catch (e) {
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
    } on PostException catch (e) {
      throw ServerException(
        message: e.message,
        action: e.action,
      );
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
        action: 'retry',
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        action: 'retry',
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
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectReview> saveProjectReview({
    required ProjectReview projectReview,
  }) async {
    try {
      final result = await _client.project.saveProjectReview(
        projectReview,
      );
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
      final result = await _client.project.reactToReview(
        reviewId,
        isLike,
      );
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectVetting> reactToVetting({
    required int vettingId,
    required bool isLike,
  }) async {
    try {
      final result = await _client.project.reactToVetting(
        vettingId,
        isLike,
      );
      return result;
    } on UserException catch (e) {
      throw ServerException(message: e.message);
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
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
      await _client.project.deleteProjectReview(
        id,
      );
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> deleteProjectVetting({required int vettingId}) async {
    try {
      await _client.project.deleteProjectVetting(
        vettingId,
      );
    } on PostException catch (e) {
      throw ServerException(message: e.message);
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ProjectVetting> vetProject({
    required ProjectVetting projectVetting,
  }) async {
    try {
      final result = await _client.project.vetProject(
        projectVetting,
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
  Future<ProjectVetting?> getVettedProject({required int projectId}) async {
    try {
      final result = await _client.project.getVettedProject(
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
}
