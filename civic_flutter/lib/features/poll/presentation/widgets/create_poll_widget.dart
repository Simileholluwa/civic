import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/poll_duration_dialog.dart';
import 'package:civic_flutter/core/widgets/user_info_widget.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/poll/presentation/widgets/poll_question_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

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
    final pollNotifier = ref.read(pollsOptionsProvider.notifier);

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
          UserInfoWidget(
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
                TSizes.md - 2,
                0,
                TSizes.md,
                TSizes.sm,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        maxLength: 80,
                        decoration: InputDecoration(
                          hintText: 'Option ${index + 1}',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          suffix: Padding(
                            padding: const EdgeInsets.only(
                              left: TSizes.sm + 4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4,),
                                  child: Text(
                                    '${80 - controller.text.length}',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                if (pollState.controllers.length > 2)
                                  const SizedBox(width: 4,),
                                if (pollState.controllers.length > 2)
                                  GestureDetector(
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                        left: TSizes.sm,
                                      ),
                                      child: Icon(
                                        Iconsax.trash,
                                        color: TColors.secondary,
                                        size: 20,
                                      ),
                                    ),
                                    onTap: () {
                                      pollNotifier.removeOption(index);
                                    },
                                  ),
                              ],
                            ),
                          ),
                          counter: const SizedBox(),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: TColors.primary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 17,
                            ),
                        onChanged: (value) {
                          pollNotifier.updateOption(index, value);
                        },
                        controller: controller,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: TSizes.md + 4,
                  vertical: TSizes.md + 4,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md + 4,
                  vertical: TSizes.sm,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    TSizes.sm,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: pollState.controllers.length < 5
                          ? () => pollNotifier.addOption(text: 'Hello')
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 8,
                        ),
                        child: Icon(
                          Icons.add,
                          color: pollState.controllers.length < 5
                              ? TColors.primary
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    InkWell(
                      onTap: () => pollDurationDialog(context: context),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.calendar_month,
                                color: TColors.primary),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '${pollState.duration.inDays} ${pollState.duration.inDays == 1 ? 'Day' : 'Days'}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
