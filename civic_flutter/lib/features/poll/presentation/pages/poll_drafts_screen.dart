import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
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
                  CreateContentDraftTitle(
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
