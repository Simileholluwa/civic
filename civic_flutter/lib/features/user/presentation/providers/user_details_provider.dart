import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_details_provider.g.dart';

@riverpod
Future<UserRecord> getUserDetails(Ref ref, int userId) async {
  final userDetail = ref.read(fetchUserProvider);
  final completer = Completer<UserRecord>();
  final result = await userDetail(
    GetUserParams(
      userId: userId,
    ),
  );
  
  result.fold(
    (failure) {
      TToastMessages.errorToast(
        failure.message,
      );
      completer.completeError({
        'message': failure.message,
        'action': failure.action,
      });
    },
    (user) {
      completer.complete(user);
    },
  );

  return completer.future;
}