import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectCardState {
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
    required this.numberOfVettings,
    required this.numberOfBookmarks,
    required this.hasReviewed,
    required this.hasVetted,
    required this.creator,
    required this.canVet,
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
    this.hasLiked = false,
    this.isBookmarked = false,
    this.isSubscribed = false,
    this.canEdit = false,
    this.isDeleted = false,
    this.toggleFilter = false,
    this.canDelete = false,
  });

  factory ProjectCardState.empty() {
    return ProjectCardState(
      timeAgo: null,
      numberOfViews: null,
      imagesUrl: null,
      description: null,
      title: null,
      currency: null,
      amount: null,
      completionRate: null,
      duration: null,
      numberOfLikes: null,
      numberOfReviews: null,
      numberOfReposts: null,
      numberOfVettings: null,
      numberOfBookmarks: null,
      hasReviewed: null,
      hasVetted: null,
      creator: null,
      canVet: null,
      startDateISO: null,
      endDateISO: null,
      percentageElapsedInDouble: null,
      percentageElapsedInString: null,
      category: null,
      subCategory: null,
      fundingAmount: null,
      fundingCategory: null,
      fundingSubCategory: null,
      rawDescription: null,
      pdfAttachments: null,
      hasPdf: null,
      locations: null,
      hasLocation: null,
      isOwner: null,
      isFollower: null,
    );
  }

  factory ProjectCardState.populate(
    ProjectWithUserState projectWithUserState,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    final project = projectWithUserState.project;
    return ProjectCardState(
      creator: project.owner,
      timeAgo: THelperFunctions.humanizeDateTime(
        project.dateCreated!,
      ),
      numberOfViews: '100',
      imagesUrl: project.projectImageAttachments,
      description: Document.fromJson(
        jsonDecode(
          project.description!,
        ) as List,
      ).toPlainText(),
      rawDescription: Document.fromJson(
        jsonDecode(
          project.description!,
        ) as List,
      ),
      canEdit: DateTime.now().difference(project.dateCreated!).inMinutes < 30 &&
          userId == project.ownerId,
      title: project.title,
      currency: project.currency,
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
        project.likesCount!,
      ),
      isSubscribed: projectWithUserState.isSubscribed!,
      numberOfReviews: THelperFunctions.humanizeNumber(
        project.reviewsCount!,
      ),
      numberOfVettings: THelperFunctions.humanizeNumber(
        project.vettingsCount!,
      ),
      numberOfBookmarks: THelperFunctions.humanizeNumber(
        project.bookmarksCount!,
      ),
      hasLiked: projectWithUserState.hasLiked,
      hasReviewed: projectWithUserState.hasReviewed,
      hasVetted: projectWithUserState.hasVetted,
      isBookmarked: projectWithUserState.hasBookmarked,
      numberOfReposts: THelperFunctions.humanizeNumber(
        project.quotesCount!,
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
      category: project.projectCategory,
      subCategory: project.projectSubCategory,
      fundingAmount: '${project.currency} ${ProjectHelperFunctions.formatNumber(
        project.projectCost!,
      )}',
      fundingCategory: project.fundingCategory,
      fundingSubCategory: project.fundingSubCategory,
      hasPdf: project.projectPDFAttachments?.isNotEmpty ?? false,
      pdfAttachments: project.projectPDFAttachments ?? [],
      locations: project.physicalLocations ?? [],
      hasLocation: project.physicalLocations?.isNotEmpty ?? false,
      isOwner: userId == project.ownerId,
      isFollower: projectWithUserState.isFollower,
      isDeleted: project.isDeleted,
    );
  }

  final String? amount;
  final bool? canDelete;
  final bool canEdit;
  final bool? canVet;
  final String? category;
  final String? completionRate;
  final UserRecord? creator;
  final String? currency;
  final String? description;
  final String? duration;
  final String? endDateISO;
  final String? fundingAmount;
  final String? fundingCategory;
  final String? fundingSubCategory;
  final bool? hasLiked;
  final bool? hasLocation;
  final bool? hasPdf;
  final bool? hasReviewed;
  final bool? hasVetted;
  final List<String>? imagesUrl;
  final bool? isBookmarked;
  final bool? isDeleted;
  final bool? isFollower;
  final bool? isOwner;
  final bool isSubscribed;
  final List<AWSPlaces>? locations;
  final String? numberOfBookmarks;
  final String? numberOfLikes;
  final String? numberOfReposts;
  final String? numberOfReviews;
  final String? numberOfVettings;
  final String? numberOfViews;
  final List<String>? pdfAttachments;
  final double? percentageElapsedInDouble;
  final String? percentageElapsedInString;
  final Document? rawDescription;
  final String? startDateISO;
  final String? subCategory;
  final String? timeAgo;
  final String? title;
  final bool? toggleFilter;

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
    String? numberOfVettings,
    String? numberOfBookmarks,
    bool? hasLiked,
    bool? hasReviewed,
    bool? hasReposted,
    bool? hasVetted,
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
      numberOfVettings: numberOfVettings ?? this.numberOfVettings,
      numberOfBookmarks: numberOfBookmarks ?? this.numberOfBookmarks,
      hasLiked: hasLiked ?? this.hasLiked,
      hasReviewed: hasReviewed ?? this.hasReviewed,
      hasVetted: hasVetted ?? this.hasVetted,
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
}
