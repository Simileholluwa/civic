import 'dart:async';
import 'dart:io';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class ProjectRemoteDataSource {
  Future<ProjectList> getProjects({required int limit, required int page,});

  Future<Project?> getProject({required int id});

  Future<Project?> saveProject({required Project project});

  Future<void> scheduleProject({
    required Project project,
    required DateTime dateTime,
  });

  Future<void> deleteProject({required int id});
}

class ProjectRemoteDatasourceImpl extends ProjectRemoteDataSource{
  ProjectRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;
  final Client _client;
  @override
  Future<void> deleteProject({required int id}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }

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
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
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
  Future<ProjectList> getProjects({required int limit, required int page,}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
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
  Future<Project?> saveProject({required Project project}) async {
    
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }

      final result = await _client.project
          .saveProject(
            project,
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
  Future<void> scheduleProject({required Project project, required DateTime dateTime,}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }
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
}