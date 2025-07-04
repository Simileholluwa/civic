import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectOverviewWidget extends ConsumerWidget {
  const ProjectOverviewWidget({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 5,
                ),
                left: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                right: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withAlpha(30),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProjectDetailTitleAndSubtitle(
                            title: 'Start Date',
                            subtitle: projectCardState.startDateISO!,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                child: VerticalDivider(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    child: CircularProgressIndicator(
                                      value: projectCardState
                                          .percentageElapsedInDouble,
                                      strokeWidth: 4,
                                      color: Theme.of(context).primaryColor,
                                      backgroundColor: Theme.of(context)
                                          .primaryColor
                                          .withAlpha(
                                            50,
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        projectCardState
                                            .percentageElapsedInString!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                      Text(
                                        'complete',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              fontSize: 9,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ProjectDetailTitleAndSubtitle(
                            title: 'End Date',
                            subtitle: projectCardState.endDateISO!,
                          ),
                        ],
                      ),
                      const Divider(
                        height: 0,
                      ),
                    ],
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Category',
                    subtitle: projectCardState.category!,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Sub-Category',
                    subtitle: projectCardState.subCategory!,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding',
                    subtitle: projectCardState.fundingAmount!,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding Category',
                    subtitle: projectCardState.fundingCategory!,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding Sub-Category',
                    subtitle: projectCardState.fundingSubCategory!,
                  ),
                  if (projectCardState.hasPdf!)
                    const Divider(
                      height: 0,
                    ),
                  if (projectCardState.hasPdf!)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        ProjectDetailTitleAndSubtitle(
                          title: 'Attachments',
                          subtitle:
                              '${projectCardState.pdfAttachments!.length} PDF ${projectCardState.pdfAttachments!.length == 1 ? 'Attachment' : 'Attachments'} ',
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10,
                            children: projectCardState.pdfAttachments!
                                .asMap()
                                .entries
                                .map(
                              (entry) {
                                final index = entry.key;
                                return GestureDetector(
                                  onTap: () async {
                                    await launchUrl(
                                      Uri.parse(
                                        projectCardState.pdfAttachments![index],
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        height: 70,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .82,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 10, 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            TSizes.sm,
                                          ),
                                          border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            FadeInImage(
                                              image: AssetImage(
                                                'assets/images/pdf.png',
                                              ),
                                              placeholder: MemoryImage(
                                                kTransparentImage,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    projectCardState
                                                        .pdfAttachments![index]
                                                        .split('/')
                                                        .last,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(
                                              TSizes.sm,
                                            ),
                                            topLeft: Radius.circular(
                                              TSizes.sm,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}/${projectCardState.pdfAttachments!.length}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
