import 'package:civic_server/src/generated/endpoints.dart';
import 'package:serverpod/serverpod.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:civic_server/src/services/media_service.dart';

class MediaCleanupFutureCall extends FutureCall<MediaCleanupParams> {
  Future<void> cleanUpMedia(Session session, MediaCleanupParams? object) async {
    final service = MediaService();
    final h = (object?.hours == null || object!.hours <= 0) ? 24 : object.hours;
    try {
      await service.cleanupTemp(session);
    } catch (e) {
      await session.serverpod.futureCalls
          .callWithDelay(const Duration(minutes: 30))
          .mediaCleanup
          .cleanUpMedia(object);
      session.log('Media cleanup failed: $e');
      return;
    }

    // Schedule next run
    await session.serverpod.futureCalls
        .callAtTime(DateTime.now().toUtc().add(Duration(hours: h)))
        .mediaCleanup
        .cleanUpMedia(object);
  }
}
