import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateVettingBottomNavigation extends ConsumerWidget {
  const CreateVettingBottomNavigation({
    required this.projectVetting, required this.projectId, super.key,
  });

  final ProjectVetting? projectVetting;
  final int projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vettedProjectState = ref.watch(
      projectVetProvider(
        projectVetting,
      ),
    );
    final vettedProjectNotifier = ref.watch(
      projectVetProvider(
        projectVetting,
      ).notifier,
    );
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
                    onPressed: vettedProjectState.isValid
                        ? () async {
                            final result =
                                await vettedProjectNotifier.sendVetting(
                              projectId,
                              projectVetting?.id,
                            );
                            if (result) {
                              if (context.mounted) {
                                context.pop();
                              }
                            }
                          }
                        : null,
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
                    loading: vettedProjectState.isSending,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
