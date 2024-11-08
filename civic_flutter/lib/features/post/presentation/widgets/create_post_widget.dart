import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_text_field.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_image_post.dart';
import 'package:civic_flutter/core/widgets/app/app_user_info_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_video_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostWidget extends ConsumerStatefulWidget {
  const CreatePostWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  ConsumerState<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends ConsumerState<CreatePostWidget> {
  late Post post;

  @override
  void initState() {
    super.initState();
    setState(() {
      post = widget.post;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
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
             )
        ],
      ),
    );
  }
}
