import 'package:orm_image_search_ver1/core/result.dart';
import 'package:orm_image_search_ver1/domain/model/image_item_model.dart';

abstract interface class ImageItemRepository {
  Future<Result<List<ImageItemModel>>> getImageItems(String query);
}