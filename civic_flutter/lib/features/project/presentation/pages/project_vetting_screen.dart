import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

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
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 25,
                  ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Iconsax.arrow_left_2),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: verifyUserProximity.when(data: (value) {
        if (value <= 1.0) {
          return vettedProject.when(data: (value) {
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
                  secondButtonOnPressed: () {
                    ProjectHelperFunctions.deleteProjectVettingDialog(
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
          }, error: (_, __) {
            return SizedBox.shrink();
          }, loading: () {
            return SizedBox.shrink();
          });
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
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
      }, error: (error, st) {
        final err = error as Map<String, String>;
        if (err['action']! == 'retry') {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
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
            padding: EdgeInsets.symmetric(
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
            padding: EdgeInsets.symmetric(
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
      }, loading: () {
        return const SizedBox.shrink();
      }),
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
                  return ModifyProjectReviewOrVetting(
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
          final err = error as Map<String, String>;
          return LoadingError(
            retry: null,
            errorMessage: err['message']!,
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
