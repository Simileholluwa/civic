import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

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
      final user = await authUser(session);
      if (project.id != null) {
        if (project.ownerId != user.userInfoId) {
          throw PostException(
            message: 'Unauthorised operation',
          );
        }
        return await Project.db.updateRow(
          session,
          project.copyWith(
            updatedAt: DateTime.now(),
          ),
        );
      } else {
        return await Project.db.insertRow(
          session,
          project.copyWith(
            ownerId: user.id,
            owner: user,
            dateCreated: DateTime.now(),
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
    String? projectCategory,
    String? fundingCategory,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    double? projectCostFrom,
    double? projectCostTo,
    bool? zeroCost,
    String? location,
    double? completionRateFrom,
    double? completionRateTo,
  }) async {
    final count = await Project.db.count(session);
    final results = await Project.db.find(
      session,
      limit: limit,
      // where: (t) => [
      //   if (projectCategory != null) t.projectCategory.equals(projectCategory),
      //   if (fundingCategory != null) t.fundingCategory.equals(fundingCategory),
      //   if (projectCostFrom != null && projectCostTo != null)
      //     (t.projectCost >= projectCostFrom) & (t.projectCost <= projectCostTo),
      //   if (currency != null) t.fundingCategory.equals(currency),
      //   if (zeroCost != null) t.zeroCost.equals(zeroCost),
      //   if (startDate != null && endDate != null)
      //     (t.startDate >= startDate) & (t.endDate <= endDate),
      //   if (status != null) t.status.equals(status),
      //   if (completionRateFrom != null && completionRateTo != null)
      //     (t.completionRate >= completionRateFrom) &
      //         (t.completionRate <= completionRateTo),
      // ].reduce((value, element) => value & element),
      offset: (page * limit) - limit,
      include: Project.include(
        owner: UserRecord.include(
          userInfo: UserInfo.include(),
        ),
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
    final user = await authUser(session);
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

  Future<void> updateCommentCount(
    Session session,
    int projectId,
    bool isAdding,
  ) async {
    final project = await Project.db.findById(session, projectId);

    if (project == null) {
      throw Exception('Project not found');
    }

    project.commentsCount = (project.commentsCount ?? 0) + (isAdding ? 1 : -1);
    if (project.commentsCount! < 0) project.commentsCount = 0;

    await Project.db.updateRow(session, project);
  }

  Future<void> updateRepostCount(
    Session session,
    int projectId,
    bool isAdding,
  ) async {
    final project = await Project.db.findById(session, projectId);

    if (project == null) {
      throw Exception('Project not found');
    }

    project.repostCount = (project.repostCount ?? 0) + (isAdding ? 1 : -1);
    if (project.repostCount! < 0) project.repostCount = 0;

    await Project.db.updateRow(session, project);
  }

  Future<int> addRemoveLike(
    Session session,
    int id,
  ) async {
    
    if (await hasLiked(
      session,
      id,
    )) {
      final user = await authUser(session);
      final like = await ProjectLikes.db.findFirstRow(
        session,
        where: (t) =>
            t.projectId.equals(id) &
            t.ownerId.equals(
              user.userInfoId,
            ),
      );
      await ProjectLikes.db.deleteRow(session, like!);
      final project = await Project.db.findById(session, id);
      if (project != null && (project.likesCount ?? 0) > 0) {
        project.likesCount = project.likesCount! - 1;
        await Project.db.updateRow(session, project);
        return project.likesCount ?? 0;
      }
    } else {
      final user = await authUser(session);
      await ProjectLikes.db.insertRow(
        session,
        ProjectLikes(
          projectId: id,
          ownerId: user.userInfoId,
          dateCreated: DateTime.now(),
        ),
      );
      final project = await Project.db.findById(
        session,
        id,
      );
      if (project != null) {
        project.likesCount = (project.likesCount ?? 0) + 1;
        await Project.db.updateRow(session, project);
        return project.likesCount ?? 0;
      }
      return 0;
    }
    return 0;
  }

  Future<bool> hasLiked(
    Session session,
    int id,
  ) async {
    final user = await authUser(session);
    final like = await ProjectLikes.db.findFirstRow(
      session,
      where: (t) => t.projectId.equals(id) & t.ownerId.equals(user.id),
    );
    return like != null;
  }

  Future<UserRecord> authUser(
    Session session,
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
      include: UserRecord.include(
        userInfo: UserInfo.include(),
      ),
    );
    if (user == null) {
      throw UserException(
        message: 'User not found',
      );
    }
    return user;
  }
}
