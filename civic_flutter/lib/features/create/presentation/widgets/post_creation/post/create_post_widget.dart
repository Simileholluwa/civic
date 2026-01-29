import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostWidget extends ConsumerWidget {
  const CreatePostWidget({
    required this.post,
    required this.isReply,
    required this.isComment,
    super.key,
    this.project,
    this.postToQuote,
    this.isQuote = false,
  });

  final Post post;
  final Project? project;
  final Post? postToQuote;
  final bool isReply;
  final bool isComment;
  final bool isQuote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoUrl = ref.watch(
      postCreationProvider(post).select(
        (s) => s.videoUrl,
      ),
    );
    final taggedUsers = ref.watch(
      postCreationProvider(post).select(
        (s) => s.taggedUsers,
      ),
    );
    final locations = ref.watch(
      postCreationProvider(post).select(
        (s) => s.locations,
      ),
    );
    final controller = ref.watch(
      postCreationProvider(post).select(
        (s) => s.controller,
      ),
    );
    final postNotifier = ref.read(postCreationProvider(post).notifier);
    final imagesUrl = ref.read(
      postCreationProvider(post).select(
        (s) => s.imageUrls,
      ),
    );
    final authState = ref.watch(authUserProvider);
    final safeUsername =
        post.owner?.userInfo?.userName ??
        (authState is AuthUserStateSuccess
            ? authState.userRecord.userInfo!.userName!
            : 'Hey');

    return Column(
      children: [
        if (!isQuote)
          PostBottomOptions(
            post: post,
            isReplyOrComment: isReply || isComment,
          ),
        if (!isQuote)
          const Divider(
            height: 0,
          ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + TSizes.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostTextField(
                  userName: safeUsername,
                  controller: controller,
                  post: post,
                  isComment: isComment,
                  isReply: isReply,
                ),
                if (imagesUrl.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ContentCreationImageViewer(
                      imageLength: imagesUrl.length,
                      maxLength: 5,
                      takeImage: postNotifier.takePicture,
                      pickImage: postNotifier.pickPicture,
                      current: ref.watch(
                        postImageAttachmentPageChangedProvider,
                      ),
                      imageUrls: imagesUrl,
                      removeAllImages: postNotifier.removeAllImages,
                      removeImageAtIndex: postNotifier.removeImageAtIndex,
                      onPageChanged: (index, reason) {
                        ref
                            .read(
                              postImageAttachmentPageChangedProvider.notifier,
                            )
                            .carouselPageChanged(
                              index,
                              reason,
                            );
                      },
                      pageIndex:
                          ref.watch(postImageAttachmentPageChangedProvider) + 1,
                    ),
                  ),
                if (videoUrl.isNotEmpty)
                  PostVideoPost(
                    post: post,
                  ),
                if (project != null)
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        TSizes.md,
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: ProjectCard(
                      projectWithUserState: ProjectWithUserState(
                        project: project!,
                      ),
                      canTap: false,
                      showInteractions: false,
                      maxHeight: 200,
                    ),
                  ),
                if (postToQuote != null)
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        TSizes.md,
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: postToQuote!.postType == PostType.poll
                        ? PollCard(
                            postWithUserState: PostWithUserState(
                              post: postToQuote!,
                            ),
                            showInteractions: false,
                          )
                        : postToQuote!.postType == PostType.article
                        ? ArticleCard(
                            postWithUserState: PostWithUserState(
                              post: postToQuote!,
                            ),
                            fromDetails: true,
                          )
                        : PostCardDetail(
                            postWithUserState: PostWithUserState(
                              post: postToQuote!,
                            ),
                            onTap: null,
                            showInteractions: false,
                          ),
                  ),
                if (taggedUsers.isNotEmpty || locations.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: ContentEngagementTagsAndLocations(
                      tags: taggedUsers,
                      locations: locations,
                      hasTags: taggedUsers.isNotEmpty,
                      hasLocations: locations.isNotEmpty,
                      onTaggedUsersTap: () async {
                        await CreateHelperFunctions.selectLocationBottomSheet(
                          context: context,
                          post: post,
                        );
                      },
                      onLocationTap: () async {
                        await CreateHelperFunctions.selectLocationBottomSheet(
                          context: context,
                          post: post,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
