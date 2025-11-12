import 'dart:math' as math;

import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Pluggable ranking service for posts.
///
/// Starts with a deterministic heuristic (time-decay + engagement),
/// but can be extended to call an external ML service for personalized scores.
class RecommendationService {
  const RecommendationService();

  /// Optional user-centric engagement summary for personalization.
  /// Map key: postId, value: number of engagements (like/bookmark/comment) by user.
  /// This is a coarse signal; can be expanded later.
  Future<Map<int, int>> recentUserEngagementCounts({
    required Session session,
    required int userId,
    int lookbackHours = 24,
  }) async {
    final since =
        DateTime.now().toUtc().subtract(Duration(hours: lookbackHours));
    // Fetch events for the user; time filtering done in-memory due to limited query operators.
    final events = await EngagementEvent.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    final map = <int, int>{};
    for (final e in events) {
      final created = e.createdAt;
      if (created != null && created.isAfter(since)) {
        map[e.postId] = (map[e.postId] ?? 0) + 1;
      }
    }
    return map;
  }

  /// Rank the given [candidates] for [user]. Returns candidates sorted by
  /// descending relevance score. Pure function (no side effects).
  Future<List<Post>> rankPosts({
    required Session session,
    required UserRecord user,
    required List<Post> candidates,
    Map<int, int>? userEngagementCounts,
  }) async {
    if (candidates.isEmpty) return candidates;

    final now = DateTime.now().toUtc();

    double score(Post p) {
      // Recency (exponential decay). Half-life ~ 48 hours.
      final created = p.dateCreated ?? now;
      final deltaHours = now.difference(created).inMinutes / 60.0;
      final recency = math.exp(-deltaHours / 48.0);

      // Engagement: likes, comments, bookmarks with diminishing returns.
      final likes = (p.likesCount!).toDouble();
      final bookmarks = (p.bookmarksCount!).toDouble();
      final comments = (p.commentCount ?? 0).toDouble();

      // Softplus-like squashing via log1p, then squash again with 1 - exp(-x/k)
      final engRaw = math.log(1 + likes) +
          0.8 * math.log(1 + bookmarks) +
          0.7 * math.log(1 + comments);
      final engagement = 1 - math.exp(-engRaw / 5.0);

      // Light affinity: small boost if the user is tagged or mentioned.
      final isMentioned =
          (p.mentions ?? const <UserRecord>[]).any((u) => u.id == user.id);
      final isTagged =
          (p.taggedUsers ?? const <UserRecord>[]).any((u) => u.id == user.id);
      final affinity = (isMentioned || isTagged) ? 0.05 : 0.0;

      // Personal engagement reinforcement: if user interacted before, slight boost.
      final pastEng = (userEngagementCounts?[p.id] ?? 0).toDouble();
      final engagementBoost = pastEng > 0 ? 0.02 * math.log(1 + pastEng) : 0.0;

      // Weighted combination. Tunable.
      return 0.58 * recency + 0.32 * engagement + affinity + engagementBoost;
    }

    final scored = candidates.map((p) => (post: p, s: score(p))).toList()
      ..sort((a, b) => b.s.compareTo(a.s));

    return scored.map((e) => e.post).toList();
  }

  /// Placeholder for calling an external ML microservice.
  /// Implement by sending [user.id] + candidate IDs and receiving scores.
  Future<List<double>> fetchMlScores({
    required Session session,
    required UserRecord user,
    required List<Post> candidates,
  }) async {
    // Example sketch (not implemented):
    // final client = session.server.httpClient;
    // final response = await client.post(
    //   Uri.parse('<ML_SERVICE_URL>/rank'),
    //   headers: {'Authorization': 'Bearer <token>'},
    //   body: jsonEncode({
    //     'userId': user.id,
    //     'postIds': candidates.map((e) => e.id).toList(),
    //   }),
    // );
    // Parse and return scores aligned with candidates.
    return List<double>.filled(candidates.length, 0.0);
  }
}
