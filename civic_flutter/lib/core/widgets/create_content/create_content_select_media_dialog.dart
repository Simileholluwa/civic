import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_media_option.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_media_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> createContentSelectMediaDialog(
  BuildContext context,
) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final selectMediaProvider = ref.watch(mediaProvider.notifier);
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
                  const Divider(height: 0,),
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
                                selectMediaProvider.pickPicture(
                                  context,
                                );
                              },
                              text: 'Image',
                            ),
                            const Divider(
                              height: 0,
                            ),
                            CreateContentMediaOptions(
                              onTap: () {
                                context.pop();
                                selectMediaProvider.pickVideo(context);
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
                                selectMediaProvider.takePicture();
                              },
                              text: 'Image',
                            ),
                            const Divider(
                              height: 0,
                            ),
                            CreateContentMediaOptions(
                              onTap: () {
                                context.pop();
                                selectMediaProvider.takeVideo();
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
        }
      );
    },
  );
}
