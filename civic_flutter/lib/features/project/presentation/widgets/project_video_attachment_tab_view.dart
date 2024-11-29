import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

class ProjectVideoAttachmentTabView extends ConsumerWidget {
  const ProjectVideoAttachmentTabView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProviderProvider(project));
    final projectNotifier =
        ref.watch(projectProviderProvider(project).notifier);
    final videoUrl = projectState.projectVideoUrl;
    final videoControl = ref.watch(
      mediaVideoPlayerProvider(
        videoUrl,
      ),
    );
    final controller = ref.watch(mediaVideoPlayerProvider(videoUrl).notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          if (videoUrl == null)
            Container(
              constraints: const BoxConstraints(
                maxWidth: 500,
                maxHeight: 500,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(
                  TSizes.md,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Iconsax.gallery5,
                            size: 60,
                            color: Colors.grey[600],
                          ),
                          onPressed: projectNotifier.pickVideo,
                        ),
                        IconButton(
                          icon: Icon(
                            Iconsax.camera5,
                            size: 60,
                            color: Colors.grey[600],
                          ),
                          onPressed: projectNotifier.takeVideo,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Center(
                        child: Text(
                          'Select or capture a video. Maximum video size allowed is 20MB.',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (videoUrl != null)
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.maxFinite,
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      TSizes.md,
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: videoControl != null
                      ? videoControl.value.isInitialized
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                TSizes.md,
                              ),
                              child: AspectRatio(
                                aspectRatio: videoControl.value.aspectRatio,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: videoControl.value.size.width,
                                    height: videoControl.value.size.height,
                                    child: GestureDetector(
                                      onTap: controller.pausePlay,
                                      child: VideoPlayer(
                                        videoControl,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 500,
                              width: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                      : const SizedBox(
                          height: 500,
                          width: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
                if (videoUrl.isNotEmpty &&
                    videoControl != null &&
                    videoControl.value.isInitialized)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ProjectAttachmentsVideoOptions(
                      project: project,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
