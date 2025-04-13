import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostWidget extends ConsumerWidget {
  const CreatePostWidget({
    super.key,
    required this.post,
    this.project,
  });

  final Post post;
  final Project? project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(
      regularPostProvider(post),
    );

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + TSizes.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: TSizes.md,
          ),
          AppUserInfoWidget(
            userRecord: post.owner!,
            onTap: (){},
          ),
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
              margin: const EdgeInsets.fromLTRB(
                16, 8, 16, 16
              ),
              padding: const EdgeInsets.only(bottom: 16,),
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
        ],
      ),
    );
  }
}
