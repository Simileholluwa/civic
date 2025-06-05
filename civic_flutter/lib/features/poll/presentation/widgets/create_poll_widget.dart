import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePollWidget extends ConsumerWidget {
  const CreatePollWidget({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollState = ref.watch(pollsOptionsProvider(poll));

    return Column(     
      children: [
        PollBottomOptions(
          poll: poll,
        ),
        const Divider(
          height: 0,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + TSizes.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                PollQuestionTextFormField(
                  userName: poll.owner!.userInfo!.userName!,
                  poll: poll,
                ),
                ...pollState.controllers.asMap().entries.map((entry) {
                  final index = entry.key;
                  final controller = entry.value;
          
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,),
                    child: PollOptionsTextField(
                      index: index,
                      controller: controller,
                      poll: poll,
                    ),
                  );
                }),
                if (pollState.taggedUsers.isNotEmpty ||
                    pollState.locations.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,),
                    child: ContentEngagementTagsAndLocations(
                      tags: pollState.taggedUsers,
                      locations: pollState.locations,
                      hasTags: pollState.taggedUsers.isNotEmpty,
                      hasLocations: pollState.locations.isNotEmpty,
                      onTaggedUsersTap: () {
                        PollHelperFunctions.selectLocationBottomSheet(
                          context: context,
                          poll: poll,
                        );
                      },
                      onLocationTap: () {
                        PollHelperFunctions.selectLocationBottomSheet(
                          context: context,
                          poll: poll,
                        );
                      },
                    ),
                  ),
                PollDurationAndAddOptions(
                  poll: poll,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
