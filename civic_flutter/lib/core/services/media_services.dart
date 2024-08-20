import 'package:photo_manager/photo_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'media_services.g.dart';

@Riverpod(keepAlive: true)
class MediaService extends _$MediaService {
  @override
  bool build() {
    return true;
  }

  Future<List<AssetPathEntity>> loadAlbums(RequestType requestType) async {
    await PhotoManager.requestPermissionExtend();

    return PhotoManager.getAssetPathList(
      type: requestType,
    );
  }

  Future<List<AssetEntity>> loadAssets(AssetPathEntity selectedAlbum) async {
    return selectedAlbum.getAssetListRange(
      start: 0,
      end: await selectedAlbum.assetCountAsync,
    );
  }
}
