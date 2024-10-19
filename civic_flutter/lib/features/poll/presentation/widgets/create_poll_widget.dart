import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app/app_user_info_widget.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/poll_duration_and_add_options.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/poll_options_text_field.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/poll_question_textfield.dart';
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
    final pollState = ref.watch(pollsOptionsProvider);

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
          ),
          ...pollState.controllers.asMap().entries.map((entry) {
            final index = entry.key;
            final controller = entry.value;

            return Padding(
              padding: const EdgeInsets.fromLTRB(
                TSizes.md - 4,
                0,
                TSizes.md,
                TSizes.sm,
              ),
              child: PollOptionsTextField(
                index: index,
                controller: controller,
              ),
            );
          }),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PollDurationAndAddOptions(),
            ],
          ),
        ],
      ),
    );
  }
}
