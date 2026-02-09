import 'package:civic_client/civic_client.dart';

@immutable
class ProjectVettingWithUserStateKey {
  const ProjectVettingWithUserStateKey(this.value);
  final ProjectVettingWithUserState value;

  int? get id => value.vetting.id;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is ProjectVettingWithUserStateKey) {
      final a = id;
      final b = other.id;
      if (a != null && b != null) return a == b;
    }
    return false;
  }

  @override
  int get hashCode => id?.hashCode ?? value.vetting.ownerId.hashCode;
}
