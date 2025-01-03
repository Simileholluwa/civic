// import 'package:civic_client/civic_client.dart';
// import 'package:civic_flutter/core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class DraftPostsVideoThumbnail extends ConsumerWidget {
//   const DraftPostsVideoThumbnail({super.key, required this.post});

//   final DraftPost post;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(videoThumbnailProvider(post.videoPath)).when(
//           data: (thumbnail) {
//             if (thumbnail != null) {
//               return ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(
//                     TSizes.md,
//                   ),
//                   bottomRight: Radius.circular(
//                     TSizes.md,
//                   ),
//                 ),
//                 child: Image.memory(
//                   thumbnail,
//                   fit: BoxFit.cover,
//                   height: 350,
//                   width: double.maxFinite,
//                 ),
//               );
//             }
//             return Container();
//           },
//           loading: () => const Center(
//             child: CircularProgressIndicator(),
//           ),
//           error: (error, _) => Center(
//             child: Text(
//               'Error: $error',
//             ),
//           ),
//         );
//   }
// }
