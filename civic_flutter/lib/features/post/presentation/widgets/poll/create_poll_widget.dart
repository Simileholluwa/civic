import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePollWidget extends ConsumerWidget {
  const CreatePollWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(regularPostProvider(post));

    return Column(     
      children: [
        PostBottomOptions(
          post: post,
          showMedia: false,
          maxLength: 400,
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
              spacing: 10,
              children: [
                PostTextField(
                  userName: post.owner!.userInfo!.userName!,
                  post: post,
                  controller: postState.controller,
                ),
                ...postState.controllers.asMap().entries.map((entry) {
                  final index = entry.key;
                  final controller = entry.value;
          
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,),
                    child: PollOptionsTextField(
                      index: index,
                      controller: controller,
                      post: post,
                    ),
                  );
                }),
                if (postState.taggedUsers.isNotEmpty ||
                    postState.locations.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,),
                    child: ContentEngagementTagsAndLocations(
                      tags: postState.taggedUsers,
                      locations: postState.locations,
                      hasTags: postState.taggedUsers.isNotEmpty,
                      hasLocations: postState.locations.isNotEmpty,
                      onTaggedUsersTap: () {
                        PostHelperFunctions.selectLocationBottomSheet(
                          context: context,
                          post: post,
                        );
                      },
                      onLocationTap: () {
                        PostHelperFunctions.selectLocationBottomSheet(
                          context: context,
                          post: post,
                        );
                      },
                    ),
                  ),
                PollDurationAndAddOptions(
                  post: post,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
