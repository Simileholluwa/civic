import 'dart:convert';
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/state/project_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_provider.g.dart';

@riverpod
class ProjectProvider extends _$ProjectProvider {
  void setContent(String description) {
    state = state.copyWith(
      description: description,
    );
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setStartDate(DateTime startDate) {
    state = state.copyWith(
      startDate: startDate,
    );
  }

  void setEndDate(DateTime endDate) {
    state = state.copyWith(endDate: endDate);
  }

  void setProjectStatus(String? status) {
    state = state.copyWith(status: status);
  }

  void setCompletionRate(String completionRate) {
    state = state.copyWith(completionRate: double.tryParse(completionRate));
  }

  void setProjectSubCategory(String? projectSubCategory) {
    state = state.copyWith(projectSubCategory: projectSubCategory);
  }

  void setProjectCategory(String? projectCategory) {
    state = state.copyWith(projectCategory: projectCategory);
  }

  void setCurrency(String? currency) {
    state = state.copyWith(currency: currency);
  }

  void setProjectCost(String? projectCost) {
    state = state.copyWith(projectCost: projectCost);
  }

  void setFundingCategory(String? fundingCategory) {
    state = state.copyWith(fundingCategory: fundingCategory);
  }

  void setFundingSubCategory(String? fundingSubCategory) {
    state = state.copyWith(fundingSubCategory: fundingSubCategory);
  }

  void setFundingNote(String? fundingNote) {
    state = state.copyWith(fundingNote: fundingNote);
  }

  void addPhysicalLocation(List<AWSPlaces> physicalLocations) {
    if (state.physicalLocations == null) {
      state = state.copyWith(physicalLocations: []);
    }
    
    if (physicalLocations.length > numberOfLocations()) {
      physicalLocations = physicalLocations.sublist(
        0,
        4 - numberOfLocations(),
      );
    }
    
    state = state.copyWith(
      physicalLocations: [
        ...state.physicalLocations!,
        ...physicalLocations,
      ],
    );
    canAddLocation();
  }

  void addVirtualLocations(String virtualLocation) {
    
    if (state.virtualLocations == null) {
      state = state.copyWith(virtualLocations: []);
    }
    canAddLocation();
  }

  void addManualLocation(String manualLocation) {
    
    if (state.manualLocations == null) {
      state = state.copyWith(manualLocations: []);
    }
    
    canAddLocation();
  }

  void removePhysicalLocation(AWSPlaces physicalLocation) {
    
    state = state.copyWith(
      physicalLocations: state.physicalLocations!
          .where((element) => element != physicalLocation)
          .toList(),
    );
    canAddLocation();
  }

  void removeVirtualLocation(String virtualLocation) {
    canAddLocation();
    state = state.copyWith(
      virtualLocations: state.virtualLocations!
          .where((element) => element != virtualLocation)
          .toList(),
    );
    canAddLocation();
  }

  void removeManualLocation(String manualLocation) {
    canAddLocation();
    state = state.copyWith(
      manualLocations: state.manualLocations!
          .where((element) => element != manualLocation)
          .toList(),
    );
    canAddLocation();
  }

  void canAddLocation() {
    final totalLocations = (state.manualLocations?.length ?? 0) +
        (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations?.length ?? 0);
    if (totalLocations == 3) {
      state = state.copyWith(
        canAddLocations: false,
      );
    }
    log('Total Locations: $totalLocations');
  }

  int numberOfLocations() {
    final totalLocations = (state.manualLocations?.length ?? 0) +
        (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations?.length ?? 0);
    return totalLocations;
  }

  @override
  ProjectState build(Project? project) {
    if (project == null) {
      final projectState = ProjectState.empty();
      projectState.quillController.addListener(() {
        setContent(
          jsonEncode(
            state.quillController.document.toDelta().toJson(),
          ),
        );
      });
      return projectState;
    } else {
      final projectState = ProjectState.populate(project);
      projectState.quillController.addListener(() {
        setContent(
          jsonEncode(
            state.quillController.document.toDelta().toJson(),
          ),
        );
      });
      return projectState;
    }
  }
}
