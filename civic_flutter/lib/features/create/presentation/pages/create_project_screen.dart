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
    final state = ref.watch(
      createProjectNotifProvider(
        data.value,
      ),
    );
    final notifier = ref.read(
      createProjectNotifProvider(
        data.value,
      ).notifier,
    );

    final hasDraft = ref.watch(hasProjectDraftProvider);

    Future<void> handlePop() async {
      if (!state.isDirty) {
        if (context.mounted) {
          context.pop();
        }
        return;
      }
      final shouldSave = await saveProjectDraftDialog(context);
      if (shouldSave == null) {
        return;
      } else if (shouldSave) {
        await notifier.saveProjectDraft();
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
              canSend: state.isValid,
              title: const CreateProjectAppbarTitle(),
              hasDraft: hasDraft.value ?? false,
              draftPressed: () async {
                final draft = await loadProjectDrafts(context);
                if (draft is Project) {
                  notifier.loadDraft(draft);
                }
              },
              sendPressed: () async {
                if (!notifier.validateProject()) return;
                context.pop();
                await notifier.sendProject(
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
