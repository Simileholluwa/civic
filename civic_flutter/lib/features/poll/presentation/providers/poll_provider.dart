import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/poll/presentation/state/poll_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_provider.g.dart';

@riverpod
class PollsOptions extends _$PollsOptions {
  void addUser(UserRecord userRecord) {
    if (state.taggedUsers.length < 10) {
      state = state.copyWith(
        taggedUsers: [...state.taggedUsers, userRecord],
      );
    }
  }

  void removeUser(UserRecord userRecord) {
    state = state.copyWith(
      taggedUsers: state.taggedUsers
          .where((record) => record.userInfo!.id != userRecord.userInfo!.id)
          .toList(),
    );
  }

  void clearSelections() {
    state = state.copyWith(
      taggedUsers: <UserRecord>[],
    );
  }

  void addLocation(List<AWSPlaces> locations) {
    state = state.copyWith(locations: [...state.locations, ...locations]);
  }

  void removeLocation(AWSPlaces location) {
    state = state.copyWith(
      locations:
          state.locations.where((loc) => loc.place != location.place).toList(),
    );
  }

  void removeAllLocations() {
    state = state.copyWith(locations: []);
  }

  void setQuestion(String question) {
    state = state.copyWith(question: question);
  }

  void addControllers(int length) {
    state = state.copyWith(
      controllers: [
        ...state.controllers,
        ...List.generate(
          length,
          (i) {
            return TextEditingController();
          },
        ),
      ],
    );
  }

  void addOption({required String text}) {
    final updatedControllers = [...state.controllers, TextEditingController()];
    state = state.copyWith(
      optionText: [
        ...state.optionText,
        text,
      ],
      controllers: updatedControllers,
    );
  }

  void updateOption(int index, String option) {
    final updatedOptions = [...state.optionText];
    updatedOptions[index] = option;
    state = state.copyWith(optionText: updatedOptions);
  }

  void addDraftOption(String option, int optionsLength) {
    final updatedOptions = [...state.optionText, option];
    log(updatedOptions.toString());
    if (updatedOptions.length > optionsLength) {
      state = state.copyWith(
        optionText: updatedOptions.sublist(
          0,
          optionsLength,
        ),
      );
    } else {
      state = state.copyWith(
        optionText: updatedOptions,
      );
    }
  }

  void removeOption(int index) {
    final updatedOptions = [...state.optionText]..removeAt(index);
    final updatedControllers = [...state.controllers]..removeAt(index);
    state = state.copyWith(
        optionText: updatedOptions, controllers: updatedControllers);
  }

  void setDuration(int duration) {
    state = state.copyWith(duration: duration);
  }

  @override
  PollState build(Poll? poll) {
    if (poll == null) {
      final pollState = PollState.empty();
      pollState.questionController.addListener(() {
        setQuestion(pollState.questionController.text);
      });
      return pollState;
    } else {
      final pollState = PollState.populate(poll);
      pollState.questionController.addListener(() {
        setQuestion(pollState.questionController.text);
      });
      return pollState;
    }
  }
}
