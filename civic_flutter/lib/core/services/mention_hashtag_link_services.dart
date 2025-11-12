import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

class MentionHashTagLinkServices {
  MentionHashTagLinkServices({required this.client});

  final Client client;

  Future<Either<String, List<UserRecord>>> mentionUsers(
    String query,
  ) async {
    try {
      final response = await client.userRecord.mentionUsers(
        limit: 10,
        query: query,
      );
      return right(response);
    } on SocketException catch (_) {
      return left(TTexts.failedToConnectToServer);
    } on TimeoutException catch (_) {
      return left(TTexts.requestTimedOut);
    } on LocationException catch (e) {
      return left(e.message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<String>>> fetchHashtags(
    String query,
  ) async {
    try {
      final response = await client.hashtag.fetchHashtags(
        limit: 10,
        query: query,
      );
      return right(response);
    } on SocketException catch (_) {
      return left(TTexts.failedToConnectToServer);
    } on TimeoutException catch (_) {
      return left(TTexts.requestTimedOut);
    } on LocationException catch (e) {
      return left(e.message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, LinkMetadata>> fetchLinkMetadata(String url) async {
    try {
      // var data = {};

      // if (data == null) return left('No data received');

      final result = LinkMetadata(
        title: '',
        description: '',
        image: '',
        url: url,
      );
      return right(result);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
