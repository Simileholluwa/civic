import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class HashtagEndpoint extends Endpoint {
  Future<void> sendHashTags(
    Session session,
    List<String> tags,
    int postId,
  ) async {
    try {
      for (var tag in tags) {
        var existingHashtag = await Hashtag.db.findFirstRow(
          session,
          where: (t) => t.tag.equals(tag),
        );

        int hashtagId;

        if (existingHashtag != null) {
          existingHashtag.usageCount += 1;
          await Hashtag.db.updateRow(
            session,
            existingHashtag,
          );
          hashtagId = existingHashtag.id!;
        } else {
          var newHashtag = Hashtag(
            tag: tag,
            usageCount: 1,
          );
          final sentHashtag = await Hashtag.db.insertRow(
            session,
            newHashtag,
          );
          
          hashtagId = sentHashtag.id!;
        }
        var postHashtag = PostsHashtags(
          postId: postId,
          hashtagId: hashtagId,
        );
        await PostsHashtags.db.insertRow(
          session,
          postHashtag,
        );
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<void> sendPollHashtags(
    Session session,
    List<String> tags,
    int pollId,
  ) async {
    try {
      for (var tag in tags) {
        var existingHashtag = await PollHashtag.db.findFirstRow(
          session,
          where: (t) => t.tag.equals(tag),
        );

        int hashtagId;

        if (existingHashtag != null) {
          existingHashtag.usageCount += 1;
          await PollHashtag.db.updateRow(
            session,
            existingHashtag,
          );
          hashtagId = existingHashtag.id!;
        } else {
          var newHashtag = PollHashtag(
            tag: tag,
            usageCount: 1,
          );
          final sentHashtag = await PollHashtag.db.insertRow(
            session,
            newHashtag,
          );
          
          hashtagId = sentHashtag.id!;
        }
        var pollHashtag = PollsHashtags(
          pollId: pollId,
          hashtagId: hashtagId,
        );
        await PollsHashtags.db.insertRow(
          session,
          pollHashtag,
        );
      }
    } catch (e) {
      print(e);
      return;
    }
  }

}