import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_controller.dart';
import 'package:civic_flutter/features/post/presentation/widgets/image_post.dart';
import 'package:civic_flutter/features/post/presentation/widgets/user_info_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/video_post.dart';
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
    final controller = ref.watch(mediaProvider.notifier);
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
          UserInfoWidget(
            imageUrl:
                'https://civic-development.s3.eu-north-1.amazonaws.com/20231203_003323.jpg',
            fullName: post.owner!.userInfo!.fullName,
            userName: post.owner!.userInfo!.userName!,
            followers: post.owner!.followers.length,
            following: post.owner!.following.length,
            onTap: () {},
            isVerified: post.owner!.verifiedAccount,
          ),
          TextFormField(
            controller: ref.watch(postTextProvider),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //color: Colors.transparent,
                  fontSize: 17,
                ),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              hintMaxLines: 2,
              hintText: controller.hintText(post.owner!.userInfo!.userName!),
              counter: const SizedBox(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: TSizes.md + 2,
                vertical: TSizes.md,
              ),
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLength: 2500,
            maxLines: null,
          ),
          if (media.isNotEmpty && THelperFunctions.isImage(media.first))
            ImagePost(
              images: ref.watch(mediaProvider),
            ),
          if (media.isNotEmpty && THelperFunctions.isVideo(media.first))
            const VideoPost()
        ],
      ),
    );
  }
}
