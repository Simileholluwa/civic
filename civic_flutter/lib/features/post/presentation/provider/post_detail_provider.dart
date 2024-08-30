import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/post/domain/usecases/retrieve_post_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_detail_provider.g.dart';

@riverpod
Future<Post?> postDetail(
    PostDetailRef ref, int id, bool isDraft, DraftPost? draftPost) async {
  if (id == 0) {
    final currentUser = await ref.read(clientProvider).userRecord.me();
    if (currentUser == null ||
        currentUser.userInfo == null ||
        currentUser.userInfo?.id == null) return null;

    if (isDraft && draftPost != null) {
      return Post(
        ownerId: currentUser.userInfo!.id!,
        postType: draftPost.postType,
        owner: currentUser,
        text: draftPost.text,
        imageUrls: draftPost.imageUrls,
        videoUrl: draftPost.videoUrl,
        taggedUsers: draftPost.taggedUsers,
        latitude: draftPost.latitude,
        longitude: draftPost.longitude,
      );
    }
    return Post(
      ownerId: currentUser.userInfo!.id!,
      postType: PostType.none,
      owner: currentUser,
      text: '',
      imageUrls: [],
      videoUrl: '',
      taggedUsers: [],
      latitude: 0.0,
      longitude: 0.0,
    );
  } else {
    final retrievePost = ref.read(retrievePostProvider);
    final result = await retrievePost(
      RetrievePostParams(
        id,
      ),
    );

    return result.fold(
      (error) => null,
      (post) {
        return post;
      },
    );
  }
}
