import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_post_text_field.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_image_post.dart';
import 'package:civic_flutter/core/widgets/app/app_user_info_widget.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_video_post.dart';
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
    final media = ref.watch(mediaProvider);
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
          CreateContentPostTextField(
            userName: post.owner!.userInfo!.userName!,
          ),
          if (media.isNotEmpty && THelperFunctions.isImage(media.first))
            ImagePost(
              images: ref.watch(mediaProvider),
            ),
          if (media.isNotEmpty && THelperFunctions.isVideo(media.first))
            const CreateContentVideoPost()
        ],
      ),
    );
  }
}
