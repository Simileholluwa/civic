import 'package:civic_client/civic_client.dart';

@immutable
class ProjectWithUserStateKey {
  const ProjectWithUserStateKey(this.value);
  final ProjectWithUserState value;

  int? get id => value.project.id;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is ProjectWithUserStateKey) {
      final a = id;
      final b = other.id;
      if (a != null && b != null) return a == b;
    }
    return false;
  }

  @override
  int get hashCode => id?.hashCode ?? value.project.ownerId.hashCode;
}
