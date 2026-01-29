import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/presentation/widgets/project_creation/pdf_attacments_detail.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectOverviewWidget extends StatelessWidget {
  const ProjectOverviewWidget({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    final pdfs = project.projectPDFAttachments;
    final hasPdfs = pdfs != null && pdfs.isNotEmpty;
    final startDateIso = project.startDate!.toIso8601String().substring(0, 10);
    final endDateIso = project.endDate!.toIso8601String().substring(0, 10);
    final fundingAmount =
        '${project.currency!} ${ProjectHelperFunctions.formatNumber(
          project.projectCost!,
        )}';
    final percentageElapsedInString =
        ProjectHelperFunctions.percentageElapsedInString(
          project.startDate!,
          project.endDate!,
        );
    final percentageElapsedInDouble =
        ProjectHelperFunctions.percentageElapsedInDouble(
          project.startDate!,
          project.endDate!,
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
                            subtitle: startDateIso,
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
                                      color: Theme.of(
                                        context,
                                      ).scaffoldBackgroundColor,
                                    ),
                                    child: CircularProgressIndicator(
                                      value: percentageElapsedInDouble,
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
                                        percentageElapsedInString,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineLarge,
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
                            subtitle: endDateIso,
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
                    subtitle: project.projectCategory!,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Sub-Category',
                    subtitle: project.projectSubCategory!,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding',
                    subtitle: fundingAmount,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding Category',
                    subtitle: project.fundingCategory!,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding Sub-Category',
                    subtitle: project.fundingSubCategory!,
                  ),
                  if (hasPdfs)
                    const Divider(
                      height: 0,
                    ),
                  if (hasPdfs)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        ProjectDetailTitleAndSubtitle(
                          title: 'Attachments',
                          subtitle:
                              '${pdfs.length} PDF '
                              '${pdfs.length == 1 ? 'Attachment' : 'Attachments'} ',
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10,
                            children: pdfs.asMap().entries.map(
                              (entry) {
                                final index = entry.key;
                                return GestureDetector(
                                  onTap: () async {
                                    await launchUrl(
                                      Uri.parse(
                                        pdfs[index],
                                      ),
                                    );
                                  },
                                  child: PdfAttacmentsDetail(
                                    pdfPaths: pdfs,
                                    index: index,
                                    showRemove: false,
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
