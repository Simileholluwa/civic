import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ScheduleProjectFutureCall extends FutureCall<Project> {
  @override
  Future<void> invoke(Session session, Project? object) async {
    if (object != null) {
      try {
        if (object.id != null) {
          await Project.db.updateRow(
            session,
            object,
          );
        } else {
          await Project.db.insertRow(
            session,
            object,
          );
        }
      } catch (e) {
        await session.serverpod.futureCallWithDelay(
          'scheduleProjectFutureCall',
          object,
          Duration(
            seconds: 60,
          ),
        );
        print(e.toString());
      }
    }
  }
}
