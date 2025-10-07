import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_screen_provider.g.dart';

@riverpod
class ProjectScreenWidgets extends _$ProjectScreenWidgets {
  void toggleFilter() {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      isActiveFilter: !state.isActiveFilter,
      selectedCurrency: selectedCurrecy,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void toggleStartDate() {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      isStartDateExpanded: !state.isStartDateExpanded,
      selectedCurrency: selectedCurrecy,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void toggleEndDate() {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      isEndDateExpanded: !state.isEndDateExpanded,
      selectedCurrency: selectedCurrecy,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void togglePublishedDate() {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      isPublishedDateExpanded: !state.isPublishedDateExpanded,
      selectedCurrency: selectedCurrecy,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void toggleCategorySelections(String category) {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    if (state.selectedCategories.contains(category)) {
      state = state.copyWith(
        selectedCategories: List.from(state.selectedCategories)
          ..remove(category),
        selectedCurrency: selectedCurrecy,
        costToAndFromCurrency: costToAndFromCurrency,
        selectedState: selectedState,
      );
    } else {
      state = state.copyWith(
        selectedCategories: List.from(state.selectedCategories)..add(category),
        selectedCurrency: selectedCurrecy,
        costToAndFromCurrency: costToAndFromCurrency,
        selectedState: selectedState,
      );
    }
  }

  void toggleFundingSelections(String source) {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    if (state.selectedFunding.contains(source)) {
      state = state.copyWith(
        selectedFunding: List.from(state.selectedFunding)..remove(source),
        selectedCurrency: selectedCurrecy,
        costToAndFromCurrency: costToAndFromCurrency,
        selectedState: selectedState,
      );
    } else {
      state = state.copyWith(
        selectedFunding: List.from(state.selectedFunding)..add(source),
        selectedCurrency: selectedCurrecy,
        costToAndFromCurrency: costToAndFromCurrency,
        selectedState: selectedState,
      );
    }
  }

  void selectAttachment(Map<String, bool> attachment) {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      selectedAttachments: attachment,
      selectedCurrency: selectedCurrecy,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void setSelectedCurrency(String currency) {
    final selectedState = state.selectedState;
    state = state.copyWith(
      selectedCurrency: currency,
      zeroCost: false,
      selectedState: selectedState,
    );
  }

  void setCostToAndFromCurrency(String currency) {
    final selectedState = state.selectedState;
    state = state.copyWith(
      costToAndFromCurrency: currency,
      zeroCost: false,
      selectedState: selectedState,
    );
  }

  void setCostFromAmount(String amount) {
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      costFromAmount: amount,
      zeroCost: false,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void setCostToAmount(String amount) {
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      costToAmount: amount,
      zeroCost: false,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void toggleZeroCost() {
    final selectedState = state.selectedState;
    state = state.copyWith(
      zeroCost: !state.zeroCost,
      selectedState: selectedState,
    );
    if (state.zeroCost) {
      state.costFromController!.clear();
      state.costToController!.clear();
      state = state.copyWith(
        costFromAmount: '',
        costToAmount: '',
        selectedState: selectedState,
      );
    }
  }

  void setSelectedState(String chosenState) {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    state = state.copyWith(
      selectedState: chosenState,
      selectedCurrency: selectedCurrecy,
      costToAndFromCurrency: costToAndFromCurrency,
      radiusOption: '',
      virtualLocation: false,
    );
  }

  void setRadiusOption(String radius) {
    final selectedCurrecy = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    state = state.copyWith(
      radiusOption: radius,
      selectedCurrency: selectedCurrecy,
      costToAndFromCurrency: costToAndFromCurrency,
      virtualLocation: false,
    );
  }

  void togglePhysicalLocations() {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      isPhysicalLocationsExpanded: !state.isPhysicalLocationsExpanded,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void toggleVirtualLocation() {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    state = state.copyWith(
      virtualLocation: !state.virtualLocation,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      radiusOption: '',
    );
  }

  void setStatus(String status) {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      status: status,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
    state.statusFromController!.clear();
    state.statusToController!.clear();
  }

  void setStatusFromAmount(String amount) {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      statusFrom: amount,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
      status: '',
    );
  }

  void setStatusToAmount(String amount) {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      statusTo: amount,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
      status: '',
    );
  }

  void setStartDate(Map<String, List<DateTime?>> selectedStartDate) {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      selectedStartDate: selectedStartDate,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void setEndDate(Map<String, List<DateTime?>> selectedEndDate) {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      selectedEndDate: selectedEndDate,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  void setPublishedDate(Map<String, List<DateTime?>> selectedPublishedDate) {
    final selectedCurrency = state.selectedCurrency;
    final costToAndFromCurrency = state.costToAndFromCurrency;
    final selectedState = state.selectedState;
    state = state.copyWith(
      selectedPublishedDate: selectedPublishedDate,
      selectedCurrency: selectedCurrency,
      costToAndFromCurrency: costToAndFromCurrency,
      selectedState: selectedState,
    );
  }

  @override
  ProjectScreenState build() {
    return ProjectScreenState(
      costFromController: TextEditingController(),
      costToController: TextEditingController(),
      statusFromController: TextEditingController(),
      statusToController: TextEditingController(),
    );
  }
}

class _VSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

@riverpod
TickerProvider projectVsync(Ref ref) => _VSync();

@riverpod
TickerProvider projectCardVsync(Ref ref) => _VSync();

@riverpod
Raw<TabController> projectScreenTab(Ref ref) {
  return TabController(
    length: selectedFilters.keys.length,
    vsync: ref.watch(projectVsyncProvider),
  );
}
