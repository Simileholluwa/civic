import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetPostDraftUseCase
    implements UseCase<Post, GetPostDraftParams> {
  GetPostDraftUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post>> call(GetPostDraftParams params) {
    final result = _feedRepository.getDraft(
      draftType: params.draftType,
    );
    return result;
  }
}

class GetPostDraftParams {
  GetPostDraftParams(
    this.draftType,
  );
  final String draftType;
}
