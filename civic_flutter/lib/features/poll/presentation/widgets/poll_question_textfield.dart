import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PollQuestionTextFormField extends ConsumerWidget {
  const PollQuestionTextFormField({
    super.key,
    required this.userName,
    required this.poll,
  });

  final String userName;
  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref,) {
    final pollNotifier = ref.read(pollsOptionsProvider(poll).notifier);
    final pollState = ref.read(pollsOptionsProvider(poll));
    return Column(
      children: [
        TextFormField(
          controller: pollState.questionController,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 17,
              ),
          textCapitalization: TextCapitalization.sentences,
          onChanged: (text){
            pollNotifier.setQuestion(text);
            THelperFunctions.onTextChanged(ref, text, pollState.questionController);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintText: '$userName, ask a question. Tap here to start typing.',
            hintMaxLines: null,
            counter: const SizedBox(),
            contentPadding: const EdgeInsets.fromLTRB(
              TSizes.md + 2,
              TSizes.md,
              TSizes.md + 2,
              0,
            ),
          ),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLength: 300,
          maxLines: null,
        ),
      ],
    );
  }
}
