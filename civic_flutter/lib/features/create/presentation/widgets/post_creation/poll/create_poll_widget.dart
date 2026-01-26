import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePollWidget extends ConsumerWidget {
  const CreatePollWidget({
    required this.post,
    required this.isEditing,
    super.key,
  });

  final Post post;
  final bool isEditing;

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
        PostBottomOptions(
          post: post,
          showMedia: false,
          maxLength: 400,
          tagLoc: true,
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
                  userName: safeUsername,
                  post: post,
                  controller: postState.controller,
                  isComment: false,
                  isReply: false,
                ),
                ...postState.controllers.asMap().entries.map((entry) {
                  final index = entry.key;
                  final controller = entry.value;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: PollOptionsTextField(
                      index: index,
                      controller: controller,
                      post: post,
                      isEditing: isEditing,
                    ),
                  );
                }),
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
                const SizedBox(
                  height: 10,
                ),
                PollDurationAndAddOptions(
                  post: post,
                  isEditing: isEditing,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
