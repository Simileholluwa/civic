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
    final projectCreationState = ref.watch(projectProviderProvider(data.value));
    final projectNotifier =
        ref.watch(projectProviderProvider(data.value).notifier);
    final isVisibleNotifier = ref.watch(appScrollVisibilityProvider.notifier,);
    return PopScope(
      canPop: true,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        isVisibleNotifier.show();
        context.pop();
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: true,
              draftData: const [],
              sendPressed: () {
                if (!projectNotifier.validateProject()) return;
                ProjectHelperFunctions.sendProject(
                  ref,
                  projectCreationState,
                  id,
                  data.value!.ownerId,
                );                     
                isVisibleNotifier.show();
                context.pop();
              },
              onCanSendPost: () async {
                
              },
              draftPressed: () {},
            ),
          ),
          body: data.when(
            data: (project) {
              if (project == null) {
                return const Center(
                  child: Text(
                    'Project not found',
                  ),
                );
              }
              return CreateProjectWidget(
                project: project,
              );
            },
            error: (error, st) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
            loading: () {
              return AppLoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
