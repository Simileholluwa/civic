import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/civic/domain/entity/post_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

Future<Widget?> showOptions() {
    return Get.bottomSheet<Widget>(
      enableDrag: false,
      isDismissible: false,
      barrierColor: Theme.of(Get.context!).scaffoldBackgroundColor.withAlpha(
            1,
          ),
      Stack(
        children: [
          Positioned(
            bottom: Get.bottomBarHeight + 5,
            left: Get.width / 2 + 5,
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 500,
              ),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(Get.context!).scaffoldBackgroundColor,
              ),
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Iconsax.close_square5,
                    size: 40,
                  ),
                  onPressed: Get.back<dynamic>,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: TSizes.sm,
              right: TSizes.sm,
              bottom: TSizes.spaceBtwSections * 2,
            ),
            height: 447,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                TSizes.lg,
              ),
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    TSizes.lg,
                  ),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.symmetric(
                    horizontal: TSizes.md,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(Get.context!).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      TSizes.borderRadiusLg + 20,
                    ),
                    border: Border.all(
                      color: Theme.of(Get.context!).hintColor.withOpacity(.2),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final addPost = moreOptions[index];
                          return ListTile(
                            leading: Icon(
                              addPost.icon,
                            ),
                            title: Text(
                              addPost.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            trailing: const Icon(
                              Iconsax.arrow_right_3,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            onTap: addPost.onTap,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: .5,
                            indent: 20,
                            endIndent: 23,
                          );
                        },
                        itemCount: moreOptions.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }