import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'impressions_provider.g.dart';

@Riverpod(keepAlive: true)
class FeedImpressions extends _$FeedImpressions {
  @override
  int build() {
    ref.onDispose(flush);
    return 0;
  }

  Future<void> record(int postId, {String source = 'feed'}) async {
    final usecase = ref.read(recordPostImpressionProvider);
    final result = await usecase(
      RecordPostImpressionParams(postId: postId, source: source),
    );
    result.match(
      (l) => null,
      (_) => state = state + 1,
    );
  }

  Future<void> flush({String source = 'feed'}) async {
    final usecase = ref.read(flushPostImpressionsProvider);
    final result = await usecase(
      FlushPostImpressionsParams(source: source),
    );
    result.match(
      (l) => null,
      (_) => state = 0,
    );
  }
}
