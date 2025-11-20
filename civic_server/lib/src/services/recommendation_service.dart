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

  /// Unique impressions per post in the recent [lookbackHours]. Uses the
  /// PostImpression table's hourBucket / createdAt timestamps.
  Future<Map<int, int>> recentImpressionCounts({
    required Session session,
    required Set<int> postIds,
    int lookbackHours = 24,
  }) async {
    if (postIds.isEmpty) return const <int, int>{};
    final sinceUtc =
        DateTime.now().toUtc().subtract(Duration(hours: lookbackHours));
    // Fetch impressions for these posts; filtering time in-memory if hourBucket not indexed beyond uniqueness.
    final impressions = await PostImpression.db.find(
      session,
      where: (t) => t.postId.inSet(postIds),
    );
    final map = <int, Set<String>>{}; // track unique viewer/session composite
    for (final imp in impressions) {
      final created = imp.createdAt ?? imp.hourBucket;
      if (created == null || created.isBefore(sinceUtc)) continue;
      // uniqueness key combining nullable viewerId + sessionId
      final key =
          '${imp.viewerId}:${imp.sessionId ?? ''}:${imp.hourBucket?.toIso8601String() ?? ''}';
      map.putIfAbsent(imp.postId, () => <String>{}).add(key);
    }
    return map.map((postId, keys) => MapEntry(postId, keys.length));
  }

  /// Rank the given [candidates] for [user]. Returns candidates sorted by
  /// descending relevance score. Pure function (no side effects).
  Future<List<Post>> rankPosts({
    required Session session,
    required UserRecord user,
    required List<Post> candidates,
    Map<int, int>? userEngagementCounts,
    Map<int, int>? impressionCounts,
    int impressionLookbackHours = 24,
  }) async {
    if (candidates.isEmpty) return candidates;

    final now = DateTime.now().toUtc();
    // Populate impressionCounts if not provided.
    impressionCounts ??= await recentImpressionCounts(
      session: session,
      postIds: candidates.where((p) => p.id != null).map((p) => p.id!).toSet(),
      lookbackHours: impressionLookbackHours,
    );

    double score(Post p) {
      // Recency (exponential decay). Half-life ~ 48 hours.
      final created = p.dateCreated ?? now;
      final deltaHours = now.difference(created).inMinutes / 60.0;
      final recency = math.exp(-deltaHours / 48.0);

      // Engagement: likes, comments, bookmarks with diminishing returns.
      final likes = (p.likesCount ?? 0).toDouble();
      final bookmarks = (p.bookmarksCount ?? 0).toDouble();
      final comments = (p.commentCount ?? 0).toDouble();
      final rawInteractionSum = likes + bookmarks + comments;

      // Softplus-like squashing via log1p, then squash again.
      // Use log(1+x) manually (log1p unavailable in dart:math pre-3.0).
      double log1p(num v) => math.log(1 + v);
      final engRaw =
          log1p(likes) + 0.8 * log1p(bookmarks) + 0.7 * log1p(comments);
      final engagement = 1 - math.exp(-engRaw / 5.0);

      // Impression-aware efficiency: interactions per recent unique impression.
      final recentImpressions = (impressionCounts?[p.id] ?? 0).toDouble();
      final efficiencyRatio =
          rawInteractionSum / math.max(recentImpressions, 1.0);
      // Map ratio into bounded [0,1) via 1-exp(-r * c)
      final efficiencyScore = 1 - math.exp(-efficiencyRatio * 3.0);
      // Raw impressions (novelty / reach) diminishing returns.
      final rawImpressionsScore = 1 - math.exp(-log1p(recentImpressions) / 6.0);

      // Light affinity: small boost if the user is tagged or mentioned.
      final isMentioned =
          (p.mentions ?? const <UserRecord>[]).any((u) => u.id == user.id);
      final isTagged =
          (p.taggedUsers ?? const <UserRecord>[]).any((u) => u.id == user.id);
      final affinity = (isMentioned || isTagged) ? 0.05 : 0.0;

      // Personal engagement reinforcement: if user interacted before, slight boost.
      final pastEng = (userEngagementCounts?[p.id] ?? 0).toDouble();
      final engagementBoost = pastEng > 0 ? 0.02 * log1p(pastEng) : 0.0;

      // Penalize low-efficiency high-impression posts (seen but ignored).
      final dampen =
          (recentImpressions > 10 && efficiencyRatio < 0.01) ? 0.85 : 1.0;

      // Weighted combination (tunable).
      final base = 0.45 * recency +
          0.25 * engagement +
          0.15 * efficiencyScore +
          0.08 * rawImpressionsScore +
          affinity +
          engagementBoost;
      return base * dampen;
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
