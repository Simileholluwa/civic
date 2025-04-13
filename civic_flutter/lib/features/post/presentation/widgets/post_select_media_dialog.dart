import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> postSelectMediaDialog(
  BuildContext context,
  Post post,
) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Consumer(builder: (context, ref, _) {
        final postNotifier = ref.watch(
          regularPostProvider(post).notifier,
        );
        
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              TSizes.sm,
            ),
          ),
          elevation: 8,
          content: SizedBox(
            height: 341,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload media',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    GestureDetector(
                      onTap: context.pop,
                      child: const Icon(
                        Icons.clear,
                        color: TColors.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.sm + 4,
                ),
                const Divider(
                  height: 0,
                ),
                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    right: TSizes.xs - 2,
                    top: TSizes.sm + 4,
                  ),
                  children: [
                    CreateContentMediaOption(
                      mediaTile: 'Gallery',
                      mediaOptionsList: Column(
                        children: [
                          CreateContentMediaOptions(
                            onTap: () {
                              context.pop();
                              postNotifier.pickPicture();
                            },
                            text: 'Image',
                          ),
                          const Divider(
                            height: 0,
                          ),
                          CreateContentMediaOptions(
                            onTap: () {
                              context.pop();
                              postNotifier.pickVideo();
                            },
                            text: 'Video',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.sm + 4,
                    ),
                    CreateContentMediaOption(
                      mediaOptionsList: Column(
                        children: [
                          CreateContentMediaOptions(
                            onTap: () {
                              context.pop();
                              postNotifier.takePicture();
                            },
                            text: 'Image',
                          ),
                          const Divider(
                            height: 0,
                          ),
                          CreateContentMediaOptions(
                            onTap: () {
                              context.pop();
                              postNotifier.takeVideo();
                            },
                            text: 'Video',
                          ),
                        ],
                      ),
                      mediaTile: 'Live',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
