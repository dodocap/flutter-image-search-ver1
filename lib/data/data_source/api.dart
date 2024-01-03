import 'package:orm_image_search_ver1/data/dto/pixabay_dto.dart';

abstract interface class Api {
  Future<PixabayDto> getImages(String query);
}