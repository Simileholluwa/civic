import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';

abstract class ArticleRemoteDatasource {
  Future<ArticleList> getArticles({required int page, required int limit});
  Future<Article> getArticle({required int id});
  Future<Article> saveArticle({required Article article});
  Future<void> deleteArticle({required int id});
}

class ArticleRemoteDatasourceImpl extends ArticleRemoteDatasource {
  ArticleRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;

  final Client _client;
  @override
  Future<void> deleteArticle({required int id}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }

      return await _client.article.deleteArticle(
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
  Future<Article> getArticle({required int id}) async {
    try {
      final result = await _client.article.getArticle(
        id: id,
      );
      if (result == null) {
        throw const ServerException(
          message: 'Failed to get article',
        );
      }
      return result;
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
  Future<ArticleList> getArticles({required int page, required int limit,}) async {
    try {
      return _client.article.getArticles(
        limit: limit,
        page: page,
      );
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
  Future<Article> saveArticle({required Article article}) async {
    try {
      final isConnected = await TDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        throw const ServerException(
          message: 'You are not connected to the internet.',
        );
      }

      final result = await _client.article.saveArticle(
        article,
      );

      if (result == null) {
        throw const ServerException(
          message: 'Failed to save article',
        );
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
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
