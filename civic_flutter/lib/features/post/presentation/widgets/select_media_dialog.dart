import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/features/post/presentation/widgets/media_option_widget.dart';
import 'package:civic_flutter/features/post/presentation/widgets/media_options.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> showUploadMediaDialog(
  BuildContext context,
  Media controller,
) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
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
                  MediaOptionWidget(
                    controller: controller,
                    mediaTile: 'Gallery',
                    mediaOptionsList: Column(
                      children: [
                        MediaOptions(
                          onTap: () {
                            context.pop();
                            controller.pickPicture(
                              context,
                            );
                          },
                          text: 'Image',
                        ),
                        const Divider(
                          height: 0,
                        ),
                        MediaOptions(
                          onTap: () {
                            context.pop();
                            controller.pickVideo(context);
                          },
                          text: 'Video',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.sm + 4,
                  ),
                  MediaOptionWidget(
                    controller: controller,
                    mediaOptionsList: Column(
                      children: [
                        MediaOptions(
                          onTap: () {
                            context.pop();
                            controller.takePicture();
                          },
                          text: 'Image',
                        ),
                        const Divider(
                          height: 0,
                        ),
                        MediaOptions(
                          onTap: () {
                            context.pop();
                            controller.takeVideo();
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
    },
  );
}
