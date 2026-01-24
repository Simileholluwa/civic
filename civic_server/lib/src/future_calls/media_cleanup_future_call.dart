import 'package:serverpod/serverpod.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:civic_server/src/services/media_service.dart';

class MediaCleanupFutureCall extends FutureCall<MediaCleanupParams> {
  @override
  Future<void> invoke(Session session, MediaCleanupParams? params) async {
    final service = MediaService();
    final h = (params?.hours == null || params!.hours <= 0) ? 24 : params.hours;
    try {
      await service.cleanupTemp(
        session,
      );
    } catch (e) {
      await session.serverpod.futureCallWithDelay(
        'mediaCleanupFutureCall',
        MediaCleanupParams(hours: h),
        const Duration(minutes: 30),
      );
      session.log('Media cleanup failed: $e');
      return;
    }

    // Schedule next run
    await session.serverpod.futureCallAtTime(
      'mediaCleanupFutureCall',
      MediaCleanupParams(hours: h),
      DateTime.now().toUtc().add(Duration(hours: h)),
    );
  }
}
