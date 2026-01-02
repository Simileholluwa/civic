import 'package:civic_client/civic_client.dart';

@immutable
class PostWithUserStateKey {
  const PostWithUserStateKey(this.value);
  final PostWithUserState value;

  int? get id => value.post.id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is PostWithUserStateKey) {
      final a = id;
      final b = other.id;
      if (a != null && b != null) return a == b;
    }
    return false;
  }

  @override
  int get hashCode => id?.hashCode ?? value.post.ownerId.hashCode;
}
