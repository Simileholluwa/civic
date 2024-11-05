import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_privacy.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_schedule.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/features/post/presentation/helpers/post_helper_functons.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_bottom_options.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_selected_locations.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_selected_tags.dart';
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
              PostBottomOptions(
                post: post,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
