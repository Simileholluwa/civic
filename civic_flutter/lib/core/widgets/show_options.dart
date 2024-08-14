import 'package:civic_flutter/core/entity/post_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:civic_flutter/core/constants/sizes.dart';

class ShowOptions extends StatelessWidget {
  const ShowOptions({
    super.key,
    required this.isExpanded,
  });
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(
        milliseconds: 300,
      ),
      opacity: isExpanded == true ? 1 : 0,
      child: Container(
        margin: const EdgeInsets.only(
          left: TSizes.md,
          right: TSizes.sm,
          bottom: TSizes.sm,
        ),
        width: 75,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(
            100,
          ),
          border: Border.all(
            color: Theme.of(Get.context!).hintColor.withOpacity(.2),
            width: 0.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 20,
              ),
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final addPost = moreOptions[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(addPost.icon),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    Text(
                      addPost.text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: .5,
                  indent: 10,
                  endIndent: 13,
                );
              },
              itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}
