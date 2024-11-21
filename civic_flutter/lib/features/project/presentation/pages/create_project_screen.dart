// ignore_for_file: use_build_context_synchronously

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_appbar.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_detail_provider.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
// import 'package:civic_flutter/features/project/presentation/widgets/create_project_bottom_navigation_bar.dart';
import 'package:civic_flutter/features/project/presentation/widgets/create_project_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final projectState = ref.watch(projectProviderProvider(data.value));
    return PopScope(
      canPop: true,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        ref
            .read(
                mediaVideoPlayerProvider(projectState.projectVideoUrl).notifier)
            .dispose();
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: true,
              draftData: const [],
              sendPressed: () {},
              onCanSendPost: () async {},
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
              return AppLoadingWidget(
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.light,
              );
            },
          ),
        ),
      ),
    );
  }
}
