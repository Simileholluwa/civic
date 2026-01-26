import 'package:civic_server/src/generated/endpoints.dart';
import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ScheduleProjectFutureCall extends FutureCall<Project> {
  Future<void> sendProjectInFuture(Session session, Project? object) async {
    if (object != null) {
      try {
        if (object.id != null) {
          await Project.db.updateRow(session, object);
        } else {
          await Project.db.insertRow(session, object);
        }
      } catch (e) {
        await session.serverpod.futureCalls
            .callWithDelay(const Duration(seconds: 60))
            .scheduleProject
            .sendProjectInFuture(object);
        print(e.toString());
      }
    }
  }
}
