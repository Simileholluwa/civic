import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class PoliticalStatusOptions extends ConsumerWidget {
  const PoliticalStatusOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final authState = ref.watch(authProvider);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              TSizes.borderRadiusLg,
            ),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: ListView.separated(
            itemCount: PoliticalStatus.values.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 2,
              );
            },
            itemBuilder: (context, index) {
              final status = allStatus[index];
              final isSelected =
                  authState.politicalStatus == status.politicalStatus;
              return Container(
                decoration: BoxDecoration(
                  border: index == 0
                      ? Border(
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        )
                      : index == allStatus.length - 1
                          ? Border(
                              top: BorderSide(
                                color: isSelected
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).dividerColor,
                              ),
                            )
                          : Border(
                              top: BorderSide(
                                color: isSelected
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).dividerColor,
                              ),
                              bottom: BorderSide(
                                color: isSelected
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).dividerColor,
                              ),
                            ),
                  borderRadius: index == 0
                      ? const BorderRadius.only(
                          topRight: Radius.circular(
                            TSizes.borderRadiusLg,
                          ),
                          topLeft: Radius.circular(
                            TSizes.borderRadiusLg,
                          ),
                        )
                      : index == allStatus.length - 1
                          ? const BorderRadius.only(
                              bottomRight: Radius.circular(
                                TSizes.borderRadiusLg,
                              ),
                              bottomLeft: Radius.circular(
                                TSizes.borderRadiusLg,
                              ),
                            )
                          : BorderRadius.zero,
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Colors.transparent,
                ),
                child: ListTile(
                  onTap: () {
                    authNotifier.setPoliticalStatus(status.politicalStatus);
                  },
                  title: Text(
                    status.title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    status.subTitle,
                    style: Theme.of(context).textTheme.labelLarge!,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        FilledButton(
          onPressed: () {
            context.pushNamed(
              AppRoutes.chooseUsername,
            );
          },
          child: const Text(
            TTexts.tContinue,
          ),
        ).withLoading(
          loading: false,
        ),
      ],
    );
  }
}
