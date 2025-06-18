import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostWidget extends ConsumerWidget {
  const CreatePostWidget({
    super.key,
    required this.post,
    required this.isReplyOrComment,
    this.project,
    this.parent,
  });

  final Post post;
  final Project? project;
  final Post? parent;
  final bool isReplyOrComment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(
      feedProvider(post),
    );

    return Column(
      children: [
        PostBottomOptions(
          post: post,
          isReplyOrComment: isReplyOrComment, 
        ),
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
                  userName: post.owner!.userInfo!.userName!,
                  controller: postState.controller,
                  post: post,
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
                if (postState.taggedUsers.isNotEmpty ||
                    postState.locations.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10,),
                    child: ContentEngagementTagsAndLocations(
                      tags: postState.taggedUsers,
                      locations: postState.locations,
                      hasTags: postState.taggedUsers.isNotEmpty,
                      hasLocations: postState.locations.isNotEmpty,
                      onTaggedUsersTap: () {
                        FeedHelperFunctions.selectLocationBottomSheet(
                          context: context,
                          post: post,
                        );
                      },
                      onLocationTap: () {
                        FeedHelperFunctions.selectLocationBottomSheet(
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
