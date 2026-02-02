import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> deleteProjectBottomSheet(
  BuildContext context,
  ProjectWithUserState projectWithUserState,
  bool fromDetails,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return AppAndroidBottomNav(
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                spacing: 15,
                children: [
                  const Icon(
                    Iconsax.trash,
                    color: Colors.red,
                    size: 50,
                  ),
                  Text(
                    'Delete this Project?',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Kindly take note of the following information '
                    'associated with deleting a project.',
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      const ProjectDeleteConsequences(
                        number: '1.',
                        consequence:
                            'Deleting a project can impact your credibility '
                            "score based on users' engagement level.",
                      ),
                      const ProjectDeleteConsequences(
                        number: '2.',
                        consequence:
                            'All user engagements will be retained, '
                            'but no further interactions will be allowed.',
                      ),
                      const ProjectDeleteConsequences(
                        number: '3.',
                        consequence:
                            'Deleted projects will be visible on the feed.',
                      ),
                      const ProjectDeleteConsequences(
                        number: '4.',
                        consequence:
                            'To restore a deleted project, a fee will '
                            'be required.',
                      ),
                      const ProjectDeleteConsequences(
                        number: '5.',
                        consequence:
                            'Permanent deletion requires a fee '
                            'and a popular vote.',
                      ),
                      Text(
                        'By continuing, you understand and confirm the above.',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: TColors.secondary,
                        ),
                        
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child:
                        FilledButton(
                          onPressed: () => context.pop(true),
                          style: const ButtonStyle().copyWith(
                            backgroundColor: const WidgetStatePropertyAll(
                             Colors.red,
                            ),
                          ),
                          child: const Text(
                            'Delete',
                          ),
                        ).withLoading(
                          loading: false,
                        ),
                  ),
                  TextButton(
                    onPressed: context.pop,
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
