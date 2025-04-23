import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostBottomNavigation extends ConsumerWidget {
  const PostBottomNavigation({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduledDateTimeState = ref.watch(postScheduledDateTimeProvider);
    final postState = ref.watch(
      regularPostProvider(
        post,
      ),
    );
    final bottomHeight = PostHelperFunctions.getBottomNavigationBarHeight(
      scheduledDateTimeState,
      postState.locations,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: postState.taggedUsers.isEmpty ? bottomHeight : bottomHeight + 50,
          child: Column(
            children: [
              postState.taggedUsers.isNotEmpty
                  ? PostSelectedTags(
                      tags: postState.taggedUsers,
                      post: post,
                    )
                  : const SizedBox.shrink(),
              postState.locations.isNotEmpty
                  ? PostSelectedLocations(
                      locations: postState.locations,
                      post: post,
                    )
                  : const SizedBox.shrink(),
              scheduledDateTimeState == null
                  ? const SizedBox.shrink()
                  : const CreateContentSchedule(),
              const CreateContentPrivacy(),
            ],
          ),
        ),
      ],
    );
  }
}
