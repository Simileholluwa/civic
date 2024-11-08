import 'dart:developer';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_services.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MediaPicker extends ConsumerStatefulWidget {
  const MediaPicker({
    super.key,
    required this.requestType,
    required this.maxCount,
    required this.isAddMedia,
    required this.pickedAssets,
  });

  final RequestType requestType;
  final int maxCount;
  final bool isAddMedia;
  final List<XFile> pickedAssets;

  @override
  ConsumerState<MediaPicker> createState() => _MediaPickerState();
}

class _MediaPickerState extends ConsumerState<MediaPicker> {
  bool isLoadingAsset = false;
  bool isAddingAsset = false;
  bool canAddImages = false;
  bool isLoadingTappedAlbum = false;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  List<AssetEntity> selectedAssetList = [];

  @override
  void initState() {
    load(0);
    super.initState();
  }

  void load(int index) {
    ref.read(mediaServiceProvider.notifier).loadAlbums(widget.requestType).then(
      (value) {
        setState(() {
          isLoadingAsset = true;
          albumList = value;
          selectedAlbum = value[index];
        });
        ref
            .read(mediaServiceProvider.notifier)
            .loadAssets(selectedAlbum!)
            .then((value) {
          setState(() {
            isLoadingAsset = false;
            isLoadingTappedAlbum = false;
            assetList = value;
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(
              Iconsax.arrow_left_2,
            ),
          ),
          titleSpacing: 4,
          toolbarHeight: 65,
          title: Text(
            selectedAlbum?.name == null
                ? ''
                : selectedAlbum?.name == ''
                    ? 'Unnamed folder'
                    : selectedAlbum!.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.sm,
              ),
              child: IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Iconsax.message_question,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: selectedAssetList.isEmpty ? 0 : 68,
          margin: const EdgeInsets.fromLTRB(
            TSizes.md,
            0,
            TSizes.md,
            TSizes.xs,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: selectedAssetList.asMap().entries.map((entry) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              TSizes.borderRadiusMd,
                            ),
                            child: Stack(
                              children: [
                                FadeInImage(
                                  height: 60,
                                  width: 60,
                                  image: AssetEntityImageProvider(
                                    entry.value,
                                    isOriginal: false,
                                    thumbnailSize:
                                        const ThumbnailSize.square(250),
                                  ),
                                  fit: BoxFit.cover,
                                  placeholder: MemoryImage(kTransparentImage),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedAssetList.remove(entry.value);
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                            TSizes.borderRadiusMd,
                                          ),
                                          bottomLeft: Radius.circular(
                                            TSizes.borderRadiusMd,
                                          ),
                                        ),
                                        color: TColors.secondary,
                                      ),
                                      child: const Icon(
                                        Icons.clear,
                                        size: 15,
                                        color: TColors.textWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: TSizes.xs,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.md,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isAddingAsset = true;
                  });
                  if (selectedAssetList.first.type == AssetType.video) {
                    final file = await selectedAssetList.first.file;
                    log(file!.path);
                    return;
                  } else {
                    for (final image in selectedAssetList) {
                      final file = await image.file;
                      widget.pickedAssets.add(
                        XFile(file!.path),
                      );
                    }
                    if (widget.pickedAssets.length == 10) {
                      canAddImages = true;
                    }
                  }
                  setState(() {
                    isAddingAsset = false;
                  });
                  if (context.mounted) {
                    context.goNamed(
                      AppRoutes.createPost,
                      extra: {
                        'pickedAssets': widget.pickedAssets,
                        'canAddImages': canAddImages,
                      },
                    );
                  }
                },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      TSizes.borderRadiusMd,
                    ),
                    color: TColors.primary,
                  ),
                  child: isAddingAsset == true
                      ? Center(
                          child: LoadingAnimationWidget.discreteCircle(
                            color: TColors.textWhite,
                            size: 25,
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.check,
                            size: 35,
                            color: TColors.textWhite,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        body: isLoadingAsset == true || assetList.isEmpty
            ? AppLoadingWidget(
                backgroundColor: isDark ? TColors.dark : TColors.light,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (ctx, idx) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAlbum = albumList[idx];
                                    isLoadingTappedAlbum = true;
                                  });

                                  MediaService()
                                      .loadAssets(
                                    selectedAlbum!,
                                  )
                                      .then((value) {
                                    setState(() {
                                      isLoadingTappedAlbum = false;
                                      assetList = value;
                                    });
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        isDark ? TColors.dark : TColors.light,
                                    borderRadius: BorderRadius.circular(
                                      TSizes.sm,
                                    ),
                                    border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      TSizes.sm,
                                    ),
                                    child: FadeInImage(
                                      height: 100,
                                      width: 100,
                                      image: AssetEntityImageProvider(
                                        assetList[idx],
                                        isOriginal: false,
                                        thumbnailSize:
                                            const ThumbnailSize.square(250),
                                      ),
                                      fit: BoxFit.cover,
                                      placeholder:
                                          MemoryImage(kTransparentImage),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                albumList[idx].name == ''
                                    ? 'Unnamed folder'
                                    : albumList[idx].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (ctx, idx) {
                          return const SizedBox(
                            height: TSizes.md + 4,
                          );
                        },
                        itemCount: albumList.length,
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.sm,
                    ),
                    Expanded(
                      flex: 3,
                      child: isLoadingTappedAlbum == false
                          ? GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: assetList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemBuilder: (context, index) {
                                final assetEntity = assetList[index];
                                return GridTile(
                                  child: assetWidget(
                                    assetEntity: assetEntity,
                                    maxCount: widget.maxCount,
                                    selectedAssetList: selectedAssetList,
                                    isAddMedia: widget.isAddMedia,
                                  ),
                                );
                              },
                            )
                          : AppLoadingWidget(
                              backgroundColor:
                                  isDark ? TColors.dark : TColors.light,
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget assetWidget({
    required AssetEntity assetEntity,
    required int maxCount,
    required List<AssetEntity> selectedAssetList,
    required bool isAddMedia,
  }) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              TSizes.borderRadiusSm,
            ),
            child: FadeInImage(
              image: AssetEntityImageProvider(
                assetEntity,
                isOriginal: false,
                thumbnailSize: const ThumbnailSize.square(250),
              ),
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              placeholderColor: isDark ? TColors.dark : TColors.light,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            child: InkWell(
              onTap: () => selectAsset(
                assetEntity: assetEntity,
                context: context,
                maxCount: maxCount,
                isAddMedia: isAddMedia,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedAssetList.contains(assetEntity) == true
                      ? TColors.primary.withAlpha(80)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    TSizes.borderRadiusMd,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: selectedAssetList.contains(assetEntity) == true
                    ? TColors.primary
                    : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(TSizes.borderRadiusMd),
                  bottomLeft: Radius.circular(TSizes.borderRadiusMd),
                ),
              ),
              child: Center(
                child: Text(
                  '${selectedAssetList.indexOf(assetEntity) + 1}',
                  style: TextStyle(
                    color: selectedAssetList.contains(assetEntity) == true
                        ? Colors.white
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (assetEntity.type == AssetType.video)
          const Positioned(
            bottom: 5,
            left: 5,
            child: Center(
              child: Icon(
                Iconsax.play5,
                color: TColors.textWhite,
                size: 20,
              ),
            ),
          )
        else
          Container(),
      ],
    );
  }

  void selectAsset({
    required AssetEntity assetEntity,
    required BuildContext context,
    required int maxCount,
    required bool isAddMedia,
  }) {
    if (selectedAssetList.contains(assetEntity)) {
      setState(() {
        selectedAssetList.remove(assetEntity);
      });
    } else if (selectedAssetList.length < maxCount) {
      if (assetEntity.type == AssetType.video && selectedAssetList.isNotEmpty) {
        TToastMessages.infoToast(
          'Only multiple images can be selected',
        );
      } else if (assetEntity.type == AssetType.video &&
          selectedAssetList.isEmpty) {
        setState(() {
          selectedAssetList.add(assetEntity);
        });
      } else if (assetEntity.type == AssetType.image &&
          selectedAssetList.isNotEmpty) {
        if (selectedAssetList.first.type == AssetType.image) {
          setState(() {
            selectedAssetList.add(assetEntity);
          });
        } else {
          TToastMessages.infoToast(
            'Only multiple images can be selected',
          );
        }
      } else {
        setState(() {
          selectedAssetList.add(assetEntity);
        });
      }
    } else {
      final images = maxCount == 1 ? 'image' : 'images';
      TToastMessages.infoToast(
        isAddMedia == true
            ? 'Only $maxCount more $images can be added'
            : 'Maximum number of selections reached',
      );
    }
  }
}
