import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class PostDetailBottomNavigation extends StatelessWidget {
  const PostDetailBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: TSizes.xs,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  maxLines: null,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    errorBorder: const UnderlineInputBorder(),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    hintText: 'Share your opinion...',
                    errorStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                    errorMaxLines: 2,
                    contentPadding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                    hintMaxLines: 1,
                  ),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
