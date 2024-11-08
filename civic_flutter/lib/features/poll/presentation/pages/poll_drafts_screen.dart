import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_locations_and_tagged_users.dart';
import 'package:civic_flutter/features/poll/presentation/helper/poll_helper_functions.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/poll_draft_select_option.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/draft_poll_options.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_drafts_appbar.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_darft_text.dart';
import 'package:civic_flutter/features/post/presentation/widgets/draft_post_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PollDraftsScreen extends ConsumerWidget {
  const PollDraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pollDraftsProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: CreateContentDraftsAppbar(
          actionPressed: () => PollHelperFunctions.deletePollDraftsDialog(
            context,
            ref,
          ),
          data: data,
          leadingPressed: context.pop,
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          top: TSizes.xs,
          left: TSizes.md,
          right: TSizes.md,
        ),
        itemBuilder: (context, index) {
          final poll = data[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DraftPostTitle(
                    createdAt: poll.createdAt!,
                    index: index,
                  ),
                  DraftPollOptions(
                    poll: poll,
                    index: index,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: TSizes.sm,
                ),
                child: CreateContentDraftText(
                  text: poll.question,
                ),
              ),
              CreateContentLocationsAndTaggedUsers(
                locations: poll.locations,
                taggedUsers: poll.taggedUsers,
                isPost: false,
              ),
              if (poll.taggedUsers.isNotEmpty || poll.locations.isNotEmpty)
                const SizedBox(
                  height: 12,
                ),
              ...poll.options!.option.asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final text = entry.value;
                  return PollDraftSelectOption(
                    text: text,
                    index: index,
                    optionLength: poll.options!.option.length,
                  );
                },
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
