import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class ProjectVettingScreen extends ConsumerWidget {
  const ProjectVettingScreen({
    super.key,
    this.projectLocations,
    required this.projectId,
    this.fromDetails = true,
  });

  final List<AWSPlaces>? projectLocations;
  final int projectId;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyUserProximity = ref.watch(
      verifyUserProximityProvider(
        projectLocations,
        projectId,
      ),
    );
    final vettedProject = ref.watch(
      getVettedProjectDetailProvider(
        projectId,
      ),
    );
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
          margin: EdgeInsets.only(top: fromDetails ? 0 : 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            titleSpacing: 4,
            title: Text(
              'Vet Project',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: verifyUserProximity.when(data: (value) {
        if (value >= 1.0) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Text(
                    'All fields must be filled to vet a project. Kindly ensure that the information provided is accurate.',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).hintColor,
                          fontSize: 14,
                        ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed:() {}
                              ,
                          child: Text(
                            'Submit vetting',
                            style: const TextStyle().copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: TColors.textWhite,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ).withLoading(
                          loading: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Row(
            spacing: 15,
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Share project',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Copy link',
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }, error: (error, st) {
        return SizedBox(
          height: 45,
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () {
              ref.invalidate(verifyUserProximityProvider);
            },
            child: Text(
              'Refresh',
            ),
          ),
        );
      }, loading: () {
        return const SizedBox();
      }),
      body: verifyUserProximity.when(
        data: (value) {
          if (value >= 1.0) {
            return vettedProject.when(
              data: (vettedProject) {
                final vettedProjectState = ref.watch(
                  projectVetProvider(
                    vettedProject,
                  ),
                );
                final vettedProjectNotifier = ref.watch(
                  projectVetProvider(
                    vettedProject,
                  ).notifier,
                );
                if (vettedProjectState.isEditing) {
                  return Text('Will edit the reveiw');
                } else {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text(
                              'Project status',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 20,
                                  ),
                            ),
                            Text(
                              'This project has been marked completed based on the dates provided. Confirm the current status from the dropdown.',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: ProjectCategoryDropdown(
                                dropdownItems: [
                                  'Completed',
                                  'Ongoing',
                                  'Not started'
                                ],
                                value: vettedProjectState.status,
                                onChanged: (value) {
                                  vettedProjectNotifier.setStatus(
                                    value!,
                                  );
                                },
                                hintText: 'What is the status of this project?',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text(
                              'Image evidence',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 20,
                                  ),
                            ),
                            Text(
                              'Add up to five images of the current state of the project as proof.',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            vettedProjectState.images.isEmpty
                                ? Container(
                                    height: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        TSizes.md,
                                      ),
                                      color: Theme.of(context).cardColor,
                                      border: Border.all(
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Iconsax.gallery5,
                                                size: 60,
                                                color: Colors.grey[600],
                                              ),
                                              onPressed: () async {
                                                await vettedProjectNotifier
                                                    .pickImageProof();
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Iconsax.camera5,
                                                size: 60,
                                                color: Colors.grey[600],
                                              ),
                                              onPressed: () async {
                                                await vettedProjectNotifier
                                                    .captureImageProof();
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Choose from your gallery or capture one',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[600],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                                : Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 400,
                                        ),
                                        margin: const EdgeInsets.only(
                                          top: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            TSizes.md,
                                          ),
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            TSizes.md,
                                          ),
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                                scrollPhysics:
                                                    const ClampingScrollPhysics(),
                                                height: 498,
                                                enableInfiniteScroll: false,
                                                viewportFraction: 1,
                                                onPageChanged: (index, reason) {
                                                  ref
                                                      .read(pageChangedProvider
                                                          .notifier)
                                                      .carouselPageChanged(
                                                        index,
                                                        reason,
                                                      );
                                                }),
                                            items: vettedProjectState.images
                                                .map((image) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .scaffoldBackgroundColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        TSizes.md,
                                                      ),
                                                    ),
                                                    child: FadeInImage(
                                                      image: regex
                                                              .hasMatch(image)
                                                          ? CachedNetworkImageProvider(
                                                              image)
                                                          : FileImage(
                                                              File(image),
                                                            ) as ImageProvider,
                                                      placeholder: MemoryImage(
                                                        kTransparentImage,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      if (vettedProjectState.images.isNotEmpty)
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (vettedProjectState
                                                    .images.length >
                                                1)
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  bottom: TSizes.md,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: TSizes.sm,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    100,
                                                  ),
                                                  color: Colors.black54,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: vettedProjectState
                                                      .images
                                                      .asMap()
                                                      .entries
                                                      .map((entry) {
                                                    return Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8.0,
                                                          horizontal: 4.0),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white
                                                            .withValues(
                                                          alpha: 1 == entry.key
                                                              ? 0.9
                                                              : 0.4,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 20,
                                              ),
                                              child: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  color: Colors.black54,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    100,
                                                  ),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .dividerColor,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      height: 45,
                                                      width: 45,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .dividerColor,
                                                        ),
                                                      ),
                                                      child: IconButton(
                                                        onPressed:
                                                            vettedProjectNotifier
                                                                .clearImages,
                                                        icon: const Icon(
                                                          CupertinoIcons.clear,
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: TSizes.xs,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        vettedProjectNotifier
                                                            .removeImageAtIndex(
                                                          1,
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Iconsax.trash,
                                                        color:
                                                            TColors.textWhite,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Iconsax.crop,
                                                        color:
                                                            TColors.textWhite,
                                                      ),
                                                    ),
                                                    if (vettedProjectState
                                                            .images.length <
                                                        5)
                                                      IconButton(
                                                        onPressed: () {
                                                          vettedProjectNotifier
                                                              .pickImageProof();
                                                        },
                                                        icon: const Icon(
                                                          Iconsax.gallery,
                                                          color:
                                                              TColors.textWhite,
                                                        ),
                                                      ),
                                                    if (vettedProjectState
                                                            .images.length <
                                                        5)
                                                      IconButton(
                                                        onPressed: () {
                                                          vettedProjectNotifier
                                                              .captureImageProof();
                                                        },
                                                        icon: const Icon(
                                                          Iconsax.camera,
                                                          color:
                                                              TColors.textWhite,
                                                        ),
                                                      ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Iconsax.magicpen,
                                                        color:
                                                            TColors.textWhite,
                                                        size: 22,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: TSizes.xs,
                                                    ),
                                                    Container(
                                                      height: 45,
                                                      width: 45,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .dividerColor,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '1/${vettedProjectState.images.length}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                    ],
                                  ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text(
                              'Write a comment',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 20,
                                  ),
                            ),
                            Text(
                              'How do you feel about the execution of this project?',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: AppTextField(
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please write a comment';
                                  }
                                  return null;
                                },
                                textController:
                                    vettedProjectState.commentController,
                                showPrefixIcon: false,
                                onChanged: (value) {
                                  vettedProjectNotifier.setComment(value ?? '');
                                },
                                hintText: 'Write your comment here',
                                maxLength: 400,
                                maxLines: 4,
                                minLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
              error: (error, stackTrace) {
                return Center(
                  child: InfiniteListLoadingError(
                    retry: null,
                    errorMessage: error.toString(),
                    mainAxisAlignment: MainAxisAlignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                );
              },
              loading: () => AppLoadingWidget(
                textWidget: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: const Text('Verifying vetting eligibility...'),
                ),
              ),
            );
          } else {
            return CannotVetProjectWidget(
              value: value,
            );
          }
        },
        loading: () => AppLoadingWidget(
          textWidget: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: const Text('Verifying vetting eligibility...'),
          ),
        ),
        error: (error, stackTrace) {
          return Center(
            child: InfiniteListLoadingError(
              retry: null,
              errorMessage: error.toString(),
              mainAxisAlignment: MainAxisAlignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
