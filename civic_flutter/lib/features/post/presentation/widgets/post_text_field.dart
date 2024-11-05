import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/services/mention_hashtag_link_text_controller.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateContentPostTextField extends ConsumerWidget {
  const CreateContentPostTextField({
    super.key,
    required this.userName,
    required this.controller,
    required this.post,
  });

  final String userName;
  final MentionHashtagLinkTextEditingController controller;
  final Post post;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final postNotifier = ref.watch(
      regularPostProvider(post).notifier,
    );
    return Column(
      children: [
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 17,
              ),
          textCapitalization: TextCapitalization.sentences,
          onChanged: (text) => THelperFunctions.onTextChanged(
            ref,
            text,
            controller,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintMaxLines: 2,
            hintText: postNotifier.hintText(userName),
            counter: const SizedBox(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: TSizes.md + 2,
              vertical: TSizes.md,
            ),
          ),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLength: 2500,
          maxLines: null,
        ),
      ],
    );
  }
}
