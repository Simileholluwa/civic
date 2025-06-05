//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
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
    if (state.controllers.length == 4) return;
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
    if (state.optionText.length == 4) return;
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

  void removeOption(int index) {
    final updatedOptions = [...state.optionText]..removeAt(index);
    final updatedControllers = [...state.controllers]..removeAt(index);
    state = state.copyWith(
        optionText: updatedOptions, controllers: updatedControllers);
  }

  void setExpiration(DateTime expiresAt) {
    state = state.copyWith(
      expiresAt: expiresAt,
    );
  }

  Future<void> savePollAsDraft(int? id, String? errorMesage) async {
    List<PollOption> pollOptions =
        state.optionText.asMap().entries.map((entry) {
      final text = entry.value;
      return PollOption(
        option: text,
        pollId: 0,
      );
    }).toList();
    final poll = Poll(
      id: id,
      ownerId: ref.read(localStorageProvider).getInt('userId')!,
      question: state.question.trim(),
      imagesUrl: state.images,
      taggedUsers: state.taggedUsers,
      options: pollOptions,
      locations: state.locations,
      mentions: state.mentions,
      expiresAt: state.expiresAt,
      tags: state.tags,
    );
    final savePoll = ref.read(savePollDraftProvider);
    final result = await savePoll(
      SavePollDraftParams(
        poll,
      ),
    );
    result.fold((error) {
      log(error.message);
    }, (data) {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      errorMesage != null
          ? TToastMessages.errorToast(
              '$errorMesage. Your poll was saved to draft.',
            )
          : TToastMessages.successToast(
              'Your poll was saved to draft.',
            );
    });
  }

  Future<bool> sendMediaImages(int? id) async {
    var existingUpload = <String>[];
    var newUpload = <String>[];
    if (state.images.isNotEmpty) {
      for (final image in state.images) {
        final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
        if (regex.hasMatch(image)) {
          existingUpload.add(image);
        } else {
          newUpload.add(image);
        }
      }
      if (newUpload.isEmpty) return true;
      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
            newUpload,
            'polls',
            'images',
          );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        await savePollAsDraft(
          id,
          error,
        );
        return false;
      }, (mediaUrls) {
        state = state.copyWith(
          images: [...existingUpload, ...mediaUrls],
        );
        return true;
      });
    } else {
      return true;
    }
  }

  Future<void> sendPoll(
    Poll poll,
  ) async {
    final savePoll = ref.read(savePollProvider);

    final result = await savePoll(
      SavePollParams(
        poll,
      ),
    );
    return result.fold((error) async {
      log(error.message);
      await savePollAsDraft(
        null,
        error.message,
      );

      return;
    }, (data) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      if (data == null) {
        await savePollAsDraft(
          poll.id,
          'Something went wrong',
        );
        return;
      }
      ref.read(paginatedPollListProvider.notifier).addPoll(
            data,
          );
      TToastMessages.successToast(
        'Your poll was sent.',
      );
      return;
    });
  }

  Future<void> savePollInFuture(
    Poll poll,
    DateTime dateTime,
  ) async {
    final saveInFuture = ref.read(schedulePollProvider);
    final scheduledDateTimeProvider = ref.read(
      postScheduledDateTimeProvider.notifier,
    );
    final result = await saveInFuture(
      SchedulePollParams(poll, dateTime),
    );
    return result.fold(
      (error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        await savePollAsDraft(
          poll.id,
          error.message,
        );
      },
      (r) {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        TToastMessages.successToast(
          'Your poll will be sent on ${scheduledDateTimeProvider.humanizeDateTimeForSend()}',
        );
      },
    );
  }

  Future<void> send(
    int? id,
  ) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final scheduledDateTime = ref.watch(postScheduledDateTimeProvider);
    final scheduledDateTimeProvider = ref.read(
      postScheduledDateTimeProvider.notifier,
    );

    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    int? pollId;
    if (id != null) {
      if (id == 0) {
        pollId = null;
      } else {
        pollId = id;
      }
    }

    final uploadedImages = await sendMediaImages(pollId);
    if (!uploadedImages) return;
    List<PollOption> pollOptions =
        state.optionText.asMap().entries.map((entry) {
      final text = entry.value;
      return PollOption(
        option: text,
        pollId: 0,
      );
    }).toList();
    final poll = Poll(
      id: pollId,
      ownerId: ownerId,
      question: state.question.trim(),
      options: pollOptions,
      imagesUrl: state.images,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: state.mentions,
      tags: state.tags,
      expiresAt: state.expiresAt,
    );
    if (scheduledDateTime == null &&
        !scheduledDateTimeProvider.canSendLater()) {
      await sendPoll(
        poll,
      );
    } else {
      await savePollInFuture(
        poll,
        scheduledDateTime!,
      );
    }
    return;
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
