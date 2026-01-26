import 'dart:io' show File;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

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
    final postState = ref.watch(postCreationProvider(post));
    final postNotifier = ref.read(postCreationProvider(post).notifier);
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
                  controller: postState.controller,
                  post: post,
                  isComment: isComment,
                  isReply: isReply,
                ),
                if (postState.imageUrls.isNotEmpty)
                  SizedBox(
                    height: 500,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: postState.imageUrls.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final url = postState.imageUrls[index];
                        bool isUrl(String v) {
                          final lower = v.toLowerCase();
                          return lower.startsWith('http://') ||
                              lower.startsWith('https://');
                        }

                        return ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(
                            16,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * .9,
                                  maxHeight: 500,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16,
                                  ),
                                ),
                                child: (isUrl(url) || kIsWeb)
                                    ? CachedNetworkImage(
                                        imageUrl: url,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        File(url),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 16,
                                  bottom: 16,
                                ),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                    border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: postNotifier.clearMedia,
                                          icon: const Icon(
                                            CupertinoIcons.clear,
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          postNotifier.removeImageAtIndex(
                                            index,
                                          );
                                        },
                                        icon: const Icon(
                                          Iconsax.trash,
                                          color: TColors.textWhite,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Iconsax.crop,
                                          color: TColors.textWhite,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Iconsax.magicpen,
                                          color: TColors.textWhite,
                                          size: 22,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: TSizes.xs,
                                      ),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}/${postState.imageUrls.length}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
