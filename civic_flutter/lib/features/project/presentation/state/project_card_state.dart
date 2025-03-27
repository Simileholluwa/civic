// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

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
  final String numberOfReviews;
  final String numberOfReposts;
  final String numberOfVerifies;
  final String numberOfBookmarks;
  final bool hasLiked;
  final bool hasReviewed;
  final bool hasReposted;
  final bool hasVerified;
  final UserRecord creator;
  final bool canVet;
  final bool isBookmarked;
  final String startDateISO;
  final String endDateISO;
  final double percentageElapsedInDouble;
  final String percentageElapsedInString;
  final String category;
  final String subCategory;
  final String fundingAmount;
  final String fundingCategory;
  final String fundingSubCategory;
  final Document rawDescription;
  final List<String> pdfAttachments;
  final bool hasPdf;
  final List<AWSPlaces> locations;
  final bool hasLocation;
  final bool toggleFilter;
  final bool isOwner;
  final bool isFollower;
  final bool isDeleted;
  final bool canDelete;
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
    required this.numberOfReviews,
    required this.numberOfReposts,
    required this.numberOfVerifies,
    required this.numberOfBookmarks,
    this.hasLiked = false,
    required this.hasReviewed,
    required this.hasReposted,
    required this.hasVerified,
    required this.creator,
    required this.canVet,
    this.isBookmarked = false,
    required this.startDateISO,
    required this.endDateISO,
    required this.percentageElapsedInDouble,
    required this.percentageElapsedInString,
    required this.category,
    required this.subCategory,
    required this.fundingAmount,
    required this.fundingCategory,
    required this.fundingSubCategory,
    required this.rawDescription,
    required this.pdfAttachments,
    required this.hasPdf,
    required this.locations,
    required this.hasLocation,
    required this.isOwner,
    required this.isFollower,
    this.isDeleted = false,
    this.toggleFilter = false,
    this.canDelete = false,
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
    String? numberOfReviews,
    String? numberOfReposts,
    String? numberOfVerifies,
    String? numberOfBookmarks,
    bool? hasLiked,
    bool? hasReviewed,
    bool? hasReposted,
    bool? hasVerified,
    UserRecord? creator,
    bool? canVet,
    bool? isBookmarked,
    String? startDateISO,
    String? endDateISO,
    double? percentageElapsedInDouble,
    String? percentageElapsedInString,
    String? category,
    String? subCategory,
    String? fundingAmount,
    String? fundingCategory,
    String? fundingSubCategory,
    Document? rawDescription,
    List<String>? pdfAttachments,
    bool? hasPdf,
    List<AWSPlaces>? locations,
    bool? hasLocation,
    bool? toggleFilter,
    bool? isOwner,
    bool? isFollower,
    bool? canDelete,
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
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      numberOfReposts: numberOfReposts ?? this.numberOfReposts,
      numberOfVerifies: numberOfVerifies ?? this.numberOfVerifies,
      numberOfBookmarks: numberOfBookmarks ?? this.numberOfBookmarks,
      hasLiked: hasLiked ?? this.hasLiked,
      hasReviewed: hasReviewed ?? this.hasReviewed,
      hasReposted: hasReposted ?? this.hasReposted,
      hasVerified: hasVerified ?? this.hasVerified,
      creator: creator ?? this.creator,
      canVet: canVet ?? this.canVet,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      startDateISO: startDateISO ?? this.startDateISO,
      endDateISO: endDateISO ?? this.endDateISO,
      percentageElapsedInDouble:
          percentageElapsedInDouble ?? this.percentageElapsedInDouble,
      percentageElapsedInString:
          percentageElapsedInString ?? this.percentageElapsedInString,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      fundingAmount: fundingAmount ?? this.fundingAmount,
      fundingCategory: fundingCategory ?? this.fundingCategory,
      fundingSubCategory: fundingSubCategory ?? this.fundingSubCategory,
      rawDescription: rawDescription ?? this.rawDescription,
      pdfAttachments: pdfAttachments ?? this.pdfAttachments,
      hasPdf: hasPdf ?? this.hasPdf,
      locations: locations ?? this.locations,
      hasLocation: hasLocation ?? this.hasLocation,
      toggleFilter: toggleFilter ?? this.toggleFilter,
      isOwner: isOwner ?? this.isOwner,
      isFollower: isFollower ?? this.isFollower,
      canDelete: canDelete ?? this.canDelete,
    );
  }

  @override
  String toString() {
    return 'ProjectCardState(timeAgo: $timeAgo, numberOfViews: $numberOfViews, imagesUrl: $imagesUrl, description: $description, title: $title, currency: $currency, amount: $amount, completionRate: $completionRate, duration: $duration, numberOfLikes: $numberOfLikes, numberOfReviews: $numberOfReviews, numberOfReposts: $numberOfReposts, numberOfVerifies: $numberOfVerifies, numberOfBookmarks: $numberOfBookmarks, hasLiked: $hasLiked, hasReviewed: $hasReviewed, hasReposted: $hasReposted, hasVerified: $hasVerified, creator: $creator, canVet: $canVet, isBookmarked: $isBookmarked, startDateISO: $startDateISO, endDateISO: $endDateISO, percentageElapsedInDouble: $percentageElapsedInDouble, percentageElapsedInString: $percentageElapsedInString, category: $category, subCategory: $subCategory, fundingAmount: $fundingAmount, fundingCategory: $fundingCategory, fundingSubCategory: $fundingSubCategory, rawDescription: $rawDescription, pdfAttachments: $pdfAttachments, hasPdf: $hasPdf, locations: $locations, hasLocation: $hasLocation, toggleFilter: $toggleFilter)';
  }

  factory ProjectCardState.populate(
    Project project,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');

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
      rawDescription: Document.fromJson(
        jsonDecode(
          project.description!,
        ),
      ),
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
      numberOfReviews: THelperFunctions.humanizeNumber(
        project.reviewedBy!.length,
      ),
      numberOfVerifies: THelperFunctions.humanizeNumber(
        project.verifiedBy!.length,
      ),
      numberOfBookmarks: THelperFunctions.humanizeNumber(
        project.bookmarkedBy!.length,
      ),
      hasLiked: project.likedBy!.contains(
        userId,
      ),
      hasReposted: project.repostedBy!.contains(
        userId,
      ),
      hasReviewed: project.reviewedBy!.contains(
        userId,
      ),
      hasVerified: project.verifiedBy!.contains(
        userId,
      ),
      isBookmarked: project.bookmarkedBy!.contains(
        userId,
      ),
      numberOfReposts: THelperFunctions.humanizeNumber(
        project.repostedBy!.length,
      ),
      canVet: ProjectHelperFunctions.canVet(
        project.startDate!,
        project.endDate!,
      ),
      startDateISO: project.startDate!.toIso8601String().substring(0, 10),
      endDateISO: project.endDate!.toIso8601String().substring(0, 10),
      percentageElapsedInDouble:
          ProjectHelperFunctions.percentageElapsedInDouble(
        project.startDate!,
        project.endDate!,
      ),
      percentageElapsedInString:
          ProjectHelperFunctions.percentageElapsedInString(
        project.startDate!,
        project.endDate!,
      ),
      category: project.projectCategory!,
      subCategory: project.projectSubCategory!,
      fundingAmount: '${project.currency} ${ProjectHelperFunctions.formatNumber(
        project.projectCost!,
      )}',
      fundingCategory: project.fundingCategory!,
      fundingSubCategory: project.fundingSubCategory!,
      hasPdf: project.projectPDFAttachments?.isNotEmpty ?? false,
      pdfAttachments: project.projectPDFAttachments ?? [],
      locations: project.physicalLocations ?? [],
      hasLocation: project.physicalLocations?.isNotEmpty ?? false,
      isOwner: userId == project.ownerId,
      isFollower: userId != project.ownerId &&
          project.owner!.followers!.contains(
            userId,
          ),
      isDeleted: project.isDeleted!,
    );
  }
}
