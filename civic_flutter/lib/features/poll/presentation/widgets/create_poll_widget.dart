import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePollWidget extends ConsumerStatefulWidget {
  const CreatePollWidget({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  ConsumerState<CreatePollWidget> createState() => _CreatePollWidgetState();
}

class _CreatePollWidgetState extends ConsumerState<CreatePollWidget> {
  late Poll poll;

  @override
  void initState() {
    super.initState();
    setState(() {
      poll = widget.poll;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pollState = ref.watch(pollsOptionsProvider(poll));

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
            userRecord: poll.owner!,
            onTap: () {},
          ),
          PollQuestionTextFormField(
            userName: poll.owner!.userInfo!.userName!,
            poll: poll,
          ),
          ...pollState.controllers.asMap().entries.map((entry) {
            final index = entry.key;
            final controller = entry.value;

            return Padding(
              padding: const EdgeInsets.fromLTRB(
                TSizes.md - 4,
                0,
                TSizes.md,
                0,
              ),
              child: PollOptionsTextField(
                index: index,
                controller: controller,
                poll: poll,
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PollDurationAndAddOptions(
                poll: poll,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
