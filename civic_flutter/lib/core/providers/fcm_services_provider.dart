import 'package:civic_flutter/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fcm_services_provider.g.dart';

@Riverpod(keepAlive: true)
FcmServiceImpl fcmServiceImpl(Ref ref) {
  return FcmServiceImpl(ref: ref);
}
