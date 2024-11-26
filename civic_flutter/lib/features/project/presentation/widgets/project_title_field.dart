import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ProjectTitleField extends ConsumerWidget {
  const ProjectTitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        hintText: 'Give your project a title...',
        counter: SizedBox(),
        contentPadding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          8,
        ),
      ),
      maxLines: null,
      controller: TextEditingController(),
      textInputAction: TextInputAction.done,
      maxLength: 100,
    );
  }
}
