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
    required this.isReplyOrComment,
    super.key,
    this.project,
    this.postToQuote,
    this.isQuote = false,
  });

  final Post post;
  final Project? project;
  final Post? postToQuote;
  final bool isReplyOrComment;
  final bool isQuote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postCreationProvider(post));
    final authState = ref.watch(authUserProvider);
    final safeUsername = post.owner?.userInfo?.userName ??
        (authState is AuthUserStateSuccess
            ? authState.userRecord.userInfo!.userName!
            : 'Hey');

    return Column(
      children: [
        if (!isQuote)
          PostBottomOptions(
            post: post,
            isReplyOrComment: isReplyOrComment,
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
                  controller: postState.controller,
                  post: post,
                  isCommentOrReply: isReplyOrComment,
                ),
                if (postState.imageUrls.isNotEmpty)
                  PostImagePost(
                    post: post,
                  ),
                if (postState.videoUrl.isNotEmpty)
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
                      project: project!,
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
                if (postState.taggedUsers.isNotEmpty ||
                    postState.locations.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: ContentEngagementTagsAndLocations(
                      tags: postState.taggedUsers,
                      locations: postState.locations,
                      hasTags: postState.taggedUsers.isNotEmpty,
                      hasLocations: postState.locations.isNotEmpty,
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
