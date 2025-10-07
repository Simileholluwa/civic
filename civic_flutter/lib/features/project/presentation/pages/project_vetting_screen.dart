import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectVettingScreen extends ConsumerWidget {
  const ProjectVettingScreen({
    required this.projectId,
    super.key,
    this.projectLocations,
  });

  final List<AWSPlaces>? projectLocations;
  final int projectId;

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Container(
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
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left_2),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: verifyUserProximity.when(
        data: (value) {
          if (value <= 1.0) {
            return vettedProject.when(
              data: (value) {
                final vettedProjectState = ref.watch(
                  projectVetProvider(
                    value,
                  ),
                );
                final vettedProjectNotifier = ref.watch(
                  projectVetProvider(
                    value,
                  ).notifier,
                );
                if (vettedProjectState.isEditing) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ContentDoubleButton(
                      firstButtonOnPressed: () {
                        vettedProjectNotifier.setIsEditing(false);
                      },
                      firstButtonIcon: Iconsax.edit,
                      firstButtonText: 'Edit vetting',
                      secondButtonOnPressed: () async {
                        await ProjectHelperFunctions.deleteProjectVettingDialog(
                          context,
                          vettedProjectNotifier,
                          value!.id!,
                        );
                      },
                      secondButtonColor: Colors.red,
                      secondButtonIcon: Iconsax.trash,
                      secondButtonText: 'Delete vetting',
                      seccondButtonLoading: vettedProjectState.isDeleting,
                    ),
                  );
                } else {
                  return CreateVettingBottomNavigation(
                    projectVetting: value,
                    projectId: projectId,
                  );
                }
              },
              error: (_, __) {
                return const SizedBox.shrink();
              },
              loading: () {
                return const SizedBox.shrink();
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: ContentSingleButton(
                onPressed: () {
                  ref.invalidate(verifyUserProximityProvider);
                },
                text: 'Retry',
                buttonIcon: Iconsax.refresh,
              ),
            );
          }
        },
        error: (error, st) {
          final err = error as Map<String, String>;
          if (err['action']! == 'retry') {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: ContentSingleButton(
                onPressed: () {
                  ref.invalidate(verifyUserProximityProvider);
                },
                text: 'Retry',
                buttonIcon: Iconsax.refresh,
              ),
            );
          } else if (err['action']! == 'restore') {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: ContentDoubleButton(
                firstButtonOnPressed: () {},
                firstButtonIcon: Iconsax.refresh,
                firstButtonText: 'Restore',
                secondButtonOnPressed: () {},
                secondButtonColor: Colors.red,
                secondButtonIcon: Iconsax.trash,
                secondButtonText: 'Delete forever',
              ),
            );
          } else if (err['action']! == 'share') {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: ContentDoubleButton(
                firstButtonOnPressed: () {},
                firstButtonIcon: Iconsax.share,
                firstButtonText: 'Share project',
                secondButtonOnPressed: () {},
                secondButtonColor: Colors.blue,
                secondButtonIcon: Iconsax.copy,
                secondButtonText: 'Copy link',
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
        loading: () {
          return const SizedBox.shrink();
        },
      ),
      body: verifyUserProximity.when(
        data: (value) {
          if (value <= 1.0) {
            return vettedProject.when(
              data: (vettedProject) {
                final vettedProjectState = ref.watch(
                  projectVetProvider(
                    vettedProject,
                  ),
                );
                if (vettedProjectState.isEditing) {
                  return const ModifyProjectReviewOrVetting(
                    information:
                        'You have already vetted this project. You can make changes to your vetting below.',
                  );
                } else {
                  return CreateProjectVetting(
                    projectVetting: vettedProject,
                  );
                }
              },
              error: (error, stackTrace) {
                return Center(
                  child: LoadingError(
                    retry: null,
                    errorMessage: error.toString(),
                    mainAxisAlignment: MainAxisAlignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                );
              },
              loading: () => const AppLoadingWidget(
                textWidget: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('Verifying vetting eligibility...'),
                ),
              ),
            );
          } else {
            return CannotVetProjectWidget(
              value: value,
            );
          }
        },
        loading: () => const AppLoadingWidget(
          textWidget: Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Text('Verifying vetting eligibility...'),
          ),
        ),
        error: (error, stackTrace) {
          final err = error as Map<String, String>;
          return LoadingError(
            retry: null,
            errorMessage: err['message'],
            mainAxisAlignment: MainAxisAlignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          );
        },
      ),
    );
  }
}
