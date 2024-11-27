import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostDraftsScreen extends ConsumerWidget {
  const PostDraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDraftsProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: CreateContentDraftsAppbar(
          actionPressed: () => PostHelperFunctions.deletePostDraftsDialog(
            context,
            ref,
          ),
          data: data,
          leadingPressed: () {
            context.pop();
          },
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: TSizes.sm,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DraftPostsWidget(
            draftPost: data[index],
            index: index,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: TSizes.sm,
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
