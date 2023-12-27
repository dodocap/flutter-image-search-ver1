import 'package:orm_image_search_ver1/data/data_source/pixabay_api.dart';
import 'package:orm_image_search_ver1/data/dto/pixabay_dto.dart';
import 'package:orm_image_search_ver1/data/mapper/pixabay_to_image.dart';
import 'package:orm_image_search_ver1/data/model/image_item_model.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItemModel>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItemModel>> getImageItems(String query) async {
    final PixabayDto pixabayDto = await _api.getImages(query);

    if(pixabayDto.hits == null) {
      return List.empty();
    }

    return pixabayDto.hits!.map((hits) => hits.mapper()).toList();
  }
}