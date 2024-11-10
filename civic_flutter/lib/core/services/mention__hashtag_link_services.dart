import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:fpdart/fpdart.dart';

class MentionHashTagLinkServices {
  MentionHashTagLinkServices({required this.client});

  final Client client;

  Future<Either<String, List<UserRecord>>> mentionUsers(
    String query,
  ) async {
    try {
      final response =
          await client.userRecord.mentionUsers(limit: 10, query: query);
      return right(response);
    } on SocketException catch (_) {
      return left('Failed to connect to server');
    } on TimeoutException catch (_) {
      return left('The request timed out.');
    } on LocationException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<String>>> fetchHashtags(
    String query,
  ) async {
    try {
      final response =
          await client.hashtag.fetchHashtags(limit: 10, query: query);
      return right(response);
    } on SocketException catch (_) {
      return left('Failed to connect to server');
    } on TimeoutException catch (_) {
      return left('The request timed out.');
    } on LocationException catch (e) {
      return left(e.message);
    } catch (e) {
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
    } catch (e) {
      log("Error fetching metadata: $e");
      return left(e.toString());
    }
  }
}
