import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateContentPostTextField extends ConsumerWidget {
  const CreateContentPostTextField({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref,) {
    final selectMediaProvider = ref.watch(mediaProvider.notifier);
    return Column(
      children: [
        TextFormField(
          controller: ref.watch(postTextProvider),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 17,
              ),
          textCapitalization: TextCapitalization.sentences,
          onChanged: (text) =>THelperFunctions.onTextChanged(ref, text,),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintMaxLines: 2,
            hintText: selectMediaProvider.hintText(userName),
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
