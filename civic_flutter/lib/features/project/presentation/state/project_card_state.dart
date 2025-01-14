import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ProjectCardState {
  final String timeAgo;
  final String numberOfViews;
  final List<String> imagesUrl;
  final String description;
  final String title;
  final String currency;
  final String amount;
  final String completionRate;
  final String duration;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfReposts;
  final bool hasLiked;
  final UserRecord creator;
  final bool canVet;
  ProjectCardState({
    required this.timeAgo,
    required this.numberOfViews,
    required this.imagesUrl,
    required this.description,
    required this.title,
    required this.currency,
    required this.amount,
    required this.completionRate,
    required this.duration,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.creator,
    required this.numberOfReposts,
    this.hasLiked = false,
    required this.canVet,
  });

  ProjectCardState copyWith({
    String? timeAgo,
    String? numberOfViews,
    List<String>? imagesUrl,
    String? description,
    String? title,
    String? currency,
    String? amount,
    String? completionRate,
    String? duration,
    String? numberOfLikes,
    String? numberOfComments,
    bool? hasLiked,
    UserRecord? creator,
    String? numberOfReposts,
    bool? canVet,
  }) {
    return ProjectCardState(
      timeAgo: timeAgo ?? this.timeAgo,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      imagesUrl: imagesUrl ?? this.imagesUrl,
      description: description ?? this.description,
      title: title ?? this.title,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      completionRate: completionRate ?? this.completionRate,
      duration: duration ?? this.duration,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      hasLiked: hasLiked ?? this.hasLiked,
      creator: creator ?? this.creator,
      numberOfReposts: numberOfReposts ?? this.numberOfReposts,
      canVet: canVet ?? this.canVet,
    );
  }

  @override
  String toString() {
    return 'ProjectCardState( timeAgo: $timeAgo, numberOfViews: $numberOfViews, imagesUrl: $imagesUrl, description: $description, title: $title, currency: $currency, amount: $amount, completionRate: $completionRate, duration: $duration, numberOfLikes: $numberOfLikes, numberOfComments: $numberOfComments)';
  }

  factory ProjectCardState.populate(
    Project project,
  ) {
    return ProjectCardState(
      creator: project.owner!,
      timeAgo: THelperFunctions.humanizeDateTime(
        project.dateCreated!,
      ),
      numberOfViews: '100',
      imagesUrl: project.projectImageAttachments!,
      description: Document.fromJson(
        jsonDecode(
          project.description!,
        ),
      ).toPlainText(),
      title: project.title!,
      currency: project.currency!,
      amount: ProjectHelperFunctions.humanizeProjectCost(project.projectCost!),
      completionRate: ProjectHelperFunctions.percentageElapsed(
        project.startDate!,
        project.endDate!,
      ),
      duration: ProjectHelperFunctions.humanizeProjectDuration(
        project.startDate!,
        project.endDate!,
      ),
      numberOfLikes: THelperFunctions.humanizeNumber(
        project.likedBy!.length,
      ),
      numberOfComments: THelperFunctions.humanizeNumber(
        project.commentBy!.length,
      ),
      hasLiked: project.likedBy?.contains(
            project.owner!.id,
          ) ??
          false,
      numberOfReposts: THelperFunctions.humanizeNumber(
        project.repostBy!.length,
      ),
      canVet: ProjectHelperFunctions.canVet(
        project.startDate!,
        project.endDate!,
      ),
    );
  }
}
