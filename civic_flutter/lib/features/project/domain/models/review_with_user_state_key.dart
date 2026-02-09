import 'package:civic_client/civic_client.dart';

@immutable
class ProjectReviewWithUserStateKey {
  const ProjectReviewWithUserStateKey(this.value);
  final ProjectReviewWithUserState value;

  int? get id => value.review.id;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is ProjectReviewWithUserStateKey) {
      final a = id;
      final b = other.id;
      if (a != null && b != null) return a == b;
    }
    return false;
  }

  @override
  int get hashCode => id?.hashCode ?? value.review.ownerId.hashCode;
}
