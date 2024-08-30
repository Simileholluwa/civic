import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/providers/integer_provider.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/string_provider.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app_loading_widget.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_detail_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_send_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_bottom_navigation.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({
    super.key,
    required this.id,
    required this.isDraft,
    this.draftPost,
  });

  final int id;
  final bool isDraft;
  final DraftPost? draftPost;

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    setState(() {
      _textController.addListener(() {
        final textLength = _textController.text.length;
        ref.read(textLengthProvider.notifier).getTextLength(
              textLength,
            );
        ref.watch(postTextProvider.notifier).getPostText(
              _textController.text,
            );
      });
    });
  }

  @override
  void dispose() {
    _textController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final data = ref.watch(
      postDetailProvider(
        widget.id,
        widget.isDraft,
        widget.draftPost,
      ),
    );
    final draftsData = ref.watch(postDraftsProvider);
    final canSendPost = ref.watch(mediaProvider).isNotEmpty ||
        ref.watch(textLengthProvider) > 0;
    return AndroidBottomNav(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            60,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: context.pop,
                icon: const Icon(
                  Iconsax.arrow_left_2,
                ),
              ),
              titleSpacing: 0,
              actions: [
                TextButton(
                  onPressed: draftsData.isEmpty
                      ? null
                      : () => context.pushNamed(
                            AppRoutes.postDrafts,
                          ),
                  child: Text(
                    'DRAFTS',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: draftsData.isEmpty ? null : TColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  child: VerticalDivider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: TSizes.sm,
                  ),
                  child: TextButton(
                    onPressed: !canSendPost ? null : sendPost,
                    child: Text(
                      'POST',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: !canSendPost ? null : TColors.primary,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CreatePostBottomNavigation(
          postText: _textController.text,
        ),
        body: data.when(
          data: (post) {
            if (post == null) {
              return const Center(
                child: Text('Post not found'),
              );
            }
            return CreatePostWidget(
              post: post,
              textController: _textController,
            );
          },
          error: (error, st) {
            return Center(
              child: Text(
                error.toString(),
              ),
            );
          },
          loading: () {
            return AppLoadingWidget(
              backgroundColor: isDark ? TColors.dark : TColors.light,
            );
          },
        ),
      ),
    );
  }

  void sendPost() async {
    context.go(FeedRoutes.namespace);
    final media = ref.watch(mediaProvider);
    final videoUrl = media.isEmpty
        ? ''
        : THelperFunctions.isVideo(media.first)
            ? media.first
            : '';
    final imageUrls = media.isEmpty
        ? <String>[]
        : THelperFunctions.isImage(media.first)
            ? media
            : <String>[];
    final currentUser = await ref.read(clientProvider).userRecord.me();
    if (currentUser == null ||
        currentUser.userInfo == null ||
        currentUser.userInfo?.id == null) return;
    final post = Post(
      ownerId: currentUser.id!,
      owner: currentUser,
      text: _textController.text,
      postType: THelperFunctions.determinePostType(
        text: _textController.text,
        pickedImages: imageUrls,
        pickedVideo: videoUrl,
      ),
      imageUrls: imageUrls,
      videoUrl: videoUrl,
      taggedUsers: [],
      latitude: 0.0,
      longitude: 0.0,
    );
    await ref.read(sendPostProvider.notifier).sendPost(post);
  }
}
