import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ProjectEndpoint extends Endpoint {
  Future<Project?> getProject(Session session, int id) async {
    final result = await Project.db.findFirstRow(
      session,
      where: (row) => row.id.equals(id),
    );

    return result;
  }

  Future<Project?> saveProject(
    Session session,
    Project project,
  ) async {
    try {
      final authInfo = await session.authenticated;
      if (authInfo == null) {
        throw UserException(
          message: 'You must be logged in',
        );
      }
      final user = await UserRecord.db.findFirstRow(
        session,
        where: (row) => row.userInfoId.equals(authInfo.userId),
      );
      if (user == null) return null;
      if (project.id != null) {
        if (project.ownerId != user.userInfoId) {
          throw PostException(
            message: 'Unauthorised operation',
          );
        }
        return await Project.db.updateRow(
          session,
          project,
        );
      } else {
        return await Project.db.insertRow(
          session,
          project.copyWith(
            ownerId: user.id,
            owner: user,
          ),
        );
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> scheduleProject(
    Session session,
    Project project,
    DateTime dateTime,
  ) async {
    await session.serverpod.futureCallAtTime(
      'scheduleProjectFutureCall',
      project,
      dateTime,
    );
  }

  Future<ProjectList> getProjects(
    Session session, {
    int limit = 10,
    int page = 1,
  }) async {
    final count = await Project.db.count(session);
    final results = await Project.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      include: Project.include(
        owner: UserRecord.include(),
      ),
    );

    return ProjectList(
      count: count,
      limit: limit,
      page: page,
      results: results,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<void> deleteProject(
    Session session,
    int id,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw UserException(
        message: 'You must be logged in',
      );
    }
    final user = await UserRecord.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authInfo.userId),
    );
    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }

    final project = await Project.db.findFirstRow(
      session,
      where: (row) => row.id.equals(id),
    );
    if (project == null) {
      throw PostException(
        message: 'Project not found',
      );
    }
    if (project.ownerId != user.userInfoId) {
      throw PostException(
        message: 'Unauthorised operation',
      );
    }

    await Project.db.deleteRow(
      session,
      project,
    );
  }
}
