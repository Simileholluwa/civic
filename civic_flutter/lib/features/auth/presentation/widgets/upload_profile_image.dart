import 'dart:io';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> uploadProfilePicture(
  BuildContext context,
) {
  return showModalBottomSheet<bool>(
    context: context,
    // enableDrag: true,
    // isDismissible: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final authNotifier = ref.read(authProvider.notifier);
          final imagePath = ref.watch(
            authProvider.select(
              (value) => value.imagePath,
            ),
          );
          final photoUrlLoading = ref.watch(
            authProvider.select(
              (value) => value.photoUrlLoading,
            ),
          );
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Upload profile image',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Column(
                spacing: TSizes.spaceBtwItems,
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: THelperFunctions.isDarkMode(context)
                          ? TColors.dark
                          : TColors.light,
                    ),
                    child: imagePath.isEmpty
                        ? const CircleAvatar(
                            radius: 90,
                            child: Icon(
                              CupertinoIcons.person_alt_circle,
                              size: 180,
                            ),
                          )
                        : CircleAvatar(
                            radius: 90,
                            backgroundImage: FileImage(
                              File(imagePath),
                            ),
                          ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Select an image that clearly shows your face. '
                      'An headshot preferably.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Visibility(
                        visible: imagePath.isNotEmpty,
                        child: IconButton(
                          onPressed: authNotifier.editImage,
                          icon: const Icon(
                            Iconsax.edit,
                            size: 27,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: imagePath.isEmpty,
                        child: IconButton(
                          onPressed: authNotifier.pickImage,
                          icon: const Icon(
                            Iconsax.gallery5,
                            size: 27,
                          ),
                        ),
                      ),
                      Visibility(
                        child: IconButton(
                          onPressed: authNotifier.takePicture,
                          icon: const Icon(
                            Iconsax.camera5,
                            size: 27,
                          ),
                        ),
                      ),
                      Visibility(
                        child: IconButton(
                          onPressed: authNotifier.clearImage,
                          icon: const Icon(
                            Iconsax.trash,
                            size: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.md,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                ),
                child: AppDualButton(
                  onTapSkipButton: () {
                    context.pop(true);
                  },
                  activeButtonText: 'Upload',
                  onTapActiveButton: imagePath.isEmpty
                      ? null
                      : () async {
                          final res = await authNotifier.uploadProfileImage();
                          if (res && context.mounted) {
                            context.pop(true);
                          }
                        },
                  activeButtonLoading: photoUrlLoading,
                  skipButtonLoading: false,
                  skipText: "I'll do it later",
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
