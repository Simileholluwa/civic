import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateProjectScreen extends ConsumerWidget {
  const CreateProjectScreen({
    required this.id,
    super.key,
    this.project,
  });

  final int id;
  final Project? project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      projectDetailProvider(
        id,
        project,
      ),
    );
    final projectCreationState = ref.watch(
      projectProviderProvider(
        data.value,
      ),
    );
    final projectNotifier = ref.read(
      projectProviderProvider(
        data.value,
      ).notifier,
    );

    final hasDraft = ref.watch(hasProjectDraftProvider);

    Future<void> handlePop() async {
      if (!projectCreationState.canSave) {
        if (context.mounted) {
          context.pop();
        }
        return;
      }
      final shouldSave = await saveProjectDraftDialog(context);
      if (shouldSave ?? false) {
        await projectNotifier.saveProjectDraft();
        TToastMessages.successToast(
          'Your project has been saved as draft.',
        );
        if (context.mounted) {
          context.pop();
        }
      } else {
        if (context.mounted) {
          context.pop();
        }
      }
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) async {
        if (didPop) return;
        await handlePop();
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
              title: const CreateProjectAppbarTitle(),
              hasDraft: hasDraft.value ?? false,
              draftPressed: () async {
                await loadProjectDrafts(context);
              },
              sendPressed: () async {
                if (!projectNotifier.validateProject()) return;
                context.pop();
                await projectNotifier.sendProject(
                  data.value?.id,
                );
              },
              onCanSendPost: handlePop,
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
                retry: () {
                  ref.invalidate(projectDetailProvider);
                },
                imageString: TImageTexts.error,
                mainAxisAlignment: MainAxisAlignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                showRefresh: true,
                errorMessage: error.toString(),
              );
            },
            loading: () {
              return const AppLoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
