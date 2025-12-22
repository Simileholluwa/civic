import 'package:flutter/material.dart';

class ProjectScreenState {
  ProjectScreenState({
    this.isActiveFilter = false,
    this.isStartDateExpanded = true,
    this.isEndDateExpanded = false,
    this.isPublishedDateExpanded = false,
    this.selectedCategories = const <String>[],
    this.selectedFunding = const <String>[],
    this.selectedAttachments = const <String, bool>{},
    this.costFromController,
    this.costToController,
    this.selectedCurrency,
    this.costToAndFromCurrency,
    this.costFromAmount = '',
    this.costToAmount = '',
    this.zeroCost = false,
    this.selectedState,
    this.radiusOption = '',
    this.isPhysicalLocationsExpanded = false,
    this.virtualLocation = false,
    this.status = '',
    this.statusFromController,
    this.statusToController,
    this.statusFrom = '',
    this.statusTo = '',
    this.selectedStartDate,
    this.selectedEndDate,
    this.selectedPublishedDate,
  });
  final bool isActiveFilter;
  final bool isStartDateExpanded;
  final bool isEndDateExpanded;
  final bool isPublishedDateExpanded;
  final List<String> selectedCategories;
  final List<String> selectedFunding;
  final Map<String, bool> selectedAttachments;
  final String? selectedCurrency;
  final String? costToAndFromCurrency;
  final String costFromAmount;
  final String costToAmount;
  final TextEditingController? costFromController;
  final TextEditingController? costToController;
  final bool zeroCost;
  final String? selectedState;
  final String radiusOption;
  final bool isPhysicalLocationsExpanded;
  final bool virtualLocation;
  final String status;
  final String? statusFrom;
  final String? statusTo;
  final TextEditingController? statusFromController;
  final TextEditingController? statusToController;
  final Map<String, List<DateTime?>>? selectedStartDate;
  final Map<String, List<DateTime?>>? selectedEndDate;
  final Map<String, List<DateTime?>>? selectedPublishedDate;

  ProjectScreenState copyWith({
    bool? isActiveFilter,
    bool? isStartDateExpanded,
    bool? isEndDateExpanded,
    bool? isPublishedDateExpanded,
    List<String>? selectedCategories,
    List<String>? selectedFunding,
    Map<String, bool>? selectedAttachments,
    String? selectedCurrency,
    String? costToAndFromCurrency,
    String? costFromAmount,
    String? costToAmount,
    bool? zeroCost,
    TextEditingController? costFromController,
    TextEditingController? costToController,
    String? selectedState,
    String? radiusOption,
    bool? isPhysicalLocationsExpanded,
    bool? virtualLocation,
    String? status,
    String? statusFrom,
    String? statusTo,
    TextEditingController? statusFromController,
    TextEditingController? statusToController,
    Map<String, List<DateTime?>>? selectedStartDate,
    Map<String, List<DateTime?>>? selectedEndDate,
    Map<String, List<DateTime?>>? selectedPublishedDate,
  }) {
    return ProjectScreenState(
      isActiveFilter: isActiveFilter ?? this.isActiveFilter,
      isStartDateExpanded: isStartDateExpanded ?? this.isStartDateExpanded,
      isEndDateExpanded: isEndDateExpanded ?? this.isEndDateExpanded,
      isPublishedDateExpanded:
          isPublishedDateExpanded ?? this.isPublishedDateExpanded,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      selectedFunding: selectedFunding ?? this.selectedFunding,
      selectedAttachments: selectedAttachments ?? this.selectedAttachments,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      costFromAmount: costFromAmount ?? this.costFromAmount,
      costToAmount: costToAmount ?? this.costToAmount,
      zeroCost: zeroCost ?? this.zeroCost,
      costFromController: costFromController ?? this.costFromController,
      costToController: costToController ?? this.costToController,
      selectedState: selectedState,
      radiusOption: radiusOption ?? this.radiusOption,
      isPhysicalLocationsExpanded:
          isPhysicalLocationsExpanded ?? this.isPhysicalLocationsExpanded,
      virtualLocation: virtualLocation ?? this.virtualLocation,
      status: status ?? this.status,
      statusFromController: statusFromController ?? this.statusFromController,
      statusToController: statusToController ?? this.statusToController,
      statusFrom: statusFrom ?? this.statusFrom,
      statusTo: statusTo ?? this.statusTo,
      selectedStartDate: selectedStartDate ?? this.selectedStartDate,
      selectedEndDate: selectedEndDate ?? this.selectedEndDate,
      selectedPublishedDate:
          selectedPublishedDate ?? this.selectedPublishedDate,
    );
  }
}
