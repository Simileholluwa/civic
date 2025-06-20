import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreateProjectScreen extends ConsumerWidget {
  const CreateProjectScreen({
    super.key,
    required this.id,
    this.project,
  });

  final int id;
  final Project? project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
            projectDetailProvider(
              id, project,
            ),
          );
    final projectCreationState = ref.watch(
      projectProviderProvider(
        data.value,
      ),
    );
    final projectNotifier = ref.watch(
      projectProviderProvider(
        data.value,
      ).notifier,
    );
    final isVisibleNotifier = ref.read(
      appBottomNavigationVisibilityProvider(
        false,
      ).notifier,
    );
    Future.delayed(
      Duration.zero,
      () => isVisibleNotifier.hide(),
    );
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool? shouldPop = projectCreationState.canSave
            ? await saveProjectDraftDialog(
                ref,
                context,
                data.value!,
              )
            : true;
        if (shouldPop ?? false) {
          if (context.mounted) {
            context.pop();
          }
        }
      },

      child: AppAndroidBottomNav(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: projectCreationState.isValid,
              title: CreateProjectAppbarTitle(),
              sendPressed: () async {
                if (!projectNotifier.validateProject()) return;
                context.pop();
                await projectNotifier.sendProject(
                  data.value?.id,
                );
              },
              onCanSendPost: () async {
                final shouldPop = projectCreationState.canSave
                    ? await saveProjectDraftDialog(
                        ref,
                        context,
                        data.value!,
                      )
                    : true;
                if (shouldPop ?? false) {
                  if (context.mounted) {
                    context.pop();
                  }
                }
              },
            ),
          ),
          body: data.when(
            data: (value) {
              return CreateProjectWidget(
                project: value,
              );
            },
            error: (error, st) {
              return LoadingError(
                retry: null,
                imageString: TImageTexts.error,
                mainAxisAlignment: MainAxisAlignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                errorMessage: error.toString(),
              );
            },
            loading: () {
              return AppLoadingWidget();
            },
          ),
          bottomNavigationBar: data.when(
            data: (_) {
              return null;
            },
            error: (err, st) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: ContentSingleButton(
                  onPressed: () {
                    ref.invalidate(projectDetailProvider);
                  },
                  text: 'Retry',
                  buttonIcon: Iconsax.refresh,
                ),
              );
            },
            loading: () {
              return null;
            },
          ),
        ),
      ),
    );
  }
}
