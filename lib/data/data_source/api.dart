import 'package:orm_image_search_ver1/core/result.dart';
import 'package:orm_image_search_ver1/data/dto/pixabay_dto.dart';

abstract interface class Api {
  Future<Result<PixabayDto>> getImages(String query);
}