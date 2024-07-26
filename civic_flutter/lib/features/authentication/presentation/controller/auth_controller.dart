// import 'dart:async';
// import 'dart:io';

// import 'package:civic_flutter/core/device/device_utility.dart';
// import 'package:civic_flutter/core/helpers/image_helper.dart';
// import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
// import 'package:civic_flutter/features/authentication/domain/usecases/upload_profile_image_use_case.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';

// class AuthController {}

//   void cancelTimer() {
//     state.timer?.cancel();
//   }

//   void startTimer(int timerSeconds) {
//     const duration = Duration(
//       seconds: 1,
//     );
//     state
//       ..secondsLeft = timerSeconds
//       ..timer = Timer.periodic(
//         duration,
//         (Timer timer) {
//           if (state.secondsLeft == 1) {
//             cancelTimer();
//             state.canRetry.value = true;
//           } else {
//             state.canRetry.value = false;
//             final minutes = state.secondsLeft ~/ 60;
//             final seconds = state.secondsLeft % 60;
//             state.time.value = "${minutes.toString().padLeft(
//                   2,
//                   '0',
//                 )}:${seconds.toString().padLeft(
//                   2,
//                   '0',
//                 )}";
//             state.secondsLeft--;
//           }
//         },
//       );
//   }


//   void removeImage() {
//     state.profileImage.clear();
//   }

//   Future<void> takeImage() async {
//     final imageHelper = ImageHelper();
//     final image = await imageHelper.takeImage();
//     if (image != null) {
//       final cropImage = await imageHelper.crop(
//         file: File(
//           image.path,
//         ),
//         cropStyle: CropStyle.circle,
//       );
//       if (cropImage != null) {
//         if (state.profileImage.isNotEmpty) {
//           state.profileImage.clear();
//         }
//         state.profileImage.add(
//           File(cropImage.path),
//         );
//       } else {
//         state.profileImage.add(
//           File(image.path),
//         );
//       }
//     }
//   }

//   Future<void> cropImage() async {
//     final imageHelper = ImageHelper();
//     final cropImage = await imageHelper.crop(
//       file: state.profileImage[0],
//       cropStyle: CropStyle.circle,
//     );
//     if (cropImage != null) {
//       if (state.profileImage.isNotEmpty) {
//         state.profileImage.clear();
//       }
//       state.profileImage.add(
//         File(cropImage.path),
//       );
//     }
//   }

//   Future<void> selectImage() async {
//     final imageHelper = ImageHelper();
//     final file = await imageHelper.pickImage();
//     if (file == null) {
//       return;
//     } else {
//       final cropImage = await imageHelper.crop(
//         file: File(
//           file.first!.path,
//         ),
//         cropStyle: CropStyle.circle,
//       );
//       if (cropImage != null) {
//         if (state.profileImage.isNotEmpty) {
//           state.profileImage.clear();
//         }
//         state.profileImage.add(
//           File(cropImage.path),
//         );
//       } else {
//         state.profileImage.add(
//           File(file[0]!.path),
//         );
//       }
//     }
//   }

//   Future<void> uploadProfileImageToFirebase() async {
//     if (state.profileImage.isEmpty) {
//       TToastMessages.errorToast(
//         'Please select an image from your gallery',
//       );
//       return;
//     }
//     final isConnected = await TDeviceUtils.hasInternetConnection();
//     if (!isConnected) {
//       TToastMessages.infoToast(
//         'No internet connection',
//       );
//       return;
//     }
//     state.isLoadingUploadImage.value = true;
//     final result = await _profileImageUseCase(
//       UploadProfileImageParams(
//         state.profileImage.first.path,
//       ),
//     );
//     state.isLoadingUploadImage.value = false;
//     result.fold((l) {
//       TToastMessages.errorToast(
//         l.message,
//       );
//     }, (r) {
//       Get.back<dynamic>();
//       TToastMessages.successToast(
//         'Profile image successfully uploaded.',
//       );
//     });
//   }
// }
