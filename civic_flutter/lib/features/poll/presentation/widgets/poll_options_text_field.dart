import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PollOptionsTextField extends ConsumerWidget {
  const PollOptionsTextField({
    super.key,
    required this.index,
    required this.controller,
    required this.poll,
  });

  final int index;
  final TextEditingController controller;
  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollState = ref.watch(pollsOptionsProvider(poll));
    final pollNotifier = ref.read(pollsOptionsProvider(poll).notifier);
    return Padding(
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
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Text(
                    '${80 - controller.text.length}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                if (pollState.controllers.length > 2)
                  const SizedBox(
                    width: 4,
                  ),
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
    );
  }
}
