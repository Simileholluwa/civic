import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateProjectScreen extends ConsumerWidget {
  const CreateProjectScreen({
    super.key,
    required this.id,
  });

  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      projectDetailProvider(
        id,
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
    final isVisibleNotifier = ref.watch(
      appScrollVisibilityProvider(
        true,
      ).notifier,
    );
    return AppAndroidBottomNav(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            60,
          ),
          child: CreateContentAppbar(
            canSend: projectCreationState.isValid,
            draftData: const [],
            title: CreateProjectAppbarTitle(),
            sendPressed: () {
              if (!projectNotifier.validateProject()) return;
              context.pop();
              isVisibleNotifier.show();
              ProjectHelperFunctions.sendProject(
                ref,
                projectCreationState,
                id,
                data.value!.ownerId,
              );
            },
            onCanSendPost: () {
              context.pop();
            },
            draftPressed: () {},
          ),
        ),
        body: data.when(
          data: (project) {
            return CreateProjectWidget(
              project: project,
            );
          },
          error: (error, st) {
            return InfiniteListLoadingError(
                retry: () {
                  ref.invalidate(projectDetailProvider);
                },
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
      ),
    );
  }
}
