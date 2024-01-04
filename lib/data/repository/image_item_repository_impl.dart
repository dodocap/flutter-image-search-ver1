import 'package:orm_image_search_ver1/core/result.dart';
import 'package:orm_image_search_ver1/data/data_source/api.dart';
import 'package:orm_image_search_ver1/data/dto/pixabay_dto.dart';
import 'package:orm_image_search_ver1/data/mapper/pixabay_to_image.dart';
import 'package:orm_image_search_ver1/data/model/image_item_model.dart';
import 'package:orm_image_search_ver1/data/repository/image_item_repository.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final Api _api;

  ImageItemRepositoryImpl({required Api api}) : _api = api;

  @override
  Future<Result<List<ImageItemModel>>> getImageItems(String query) async {
    final Result<PixabayDto> pixabayDtoResult = await _api.getImages(query);

    return pixabayDtoResult.when(
      success: (data) {
        if(data.hits == null) {
          return const Result.success([]);
        }
        return Result.success(data.hits!.map((hit) => hit.mapper()).toList());
      },
      error: (e) => Result.error(e),
    );
  }
}
