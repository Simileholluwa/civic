import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PollOptionsTextField extends ConsumerWidget {
  const PollOptionsTextField({
    super.key,
    required this.index,
    required this.controller,
    required this.post,
  });

  final int index;
  final TextEditingController controller;
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(regularPostProvider(post));
    final postNotifier = ref.read(regularPostProvider(post).notifier);
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 8, 4, 8),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        maxLength: 35,
        decoration: InputDecoration(
          hintText: 'Option ${index + 1}',
          suffix: Padding(
            padding: const EdgeInsets.only(
              left: TSizes.sm + 4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3,),
                    child: Text(
                      '${35 - controller.text.length}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                if (postState.controllers.length > 2)
                  const SizedBox(
                    width: 4,
                  ),
                if (postState.controllers.length > 2)
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
                      postNotifier.removeOption(index);
                    },
                  ),
              ],
            ),
          ),
          counter: const SizedBox(),
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 17,
            ),
        onChanged: (value) {
          postNotifier.updateOption(index, value);
        },
        controller: controller,
      ),
    );
  }
}
