import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final videoThumbnailProvider = FutureProvider.family<Uint8List?, String>((ref, videoPath) async {
  try {
    
    final Uint8List? thumbnail = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG, 
      maxHeight: 200,  
      quality: 100,
    );
    return thumbnail;
  } catch (e) {
    return null;
  }
});
