import 'package:orm_image_search_ver1/data/model/image_item_model.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItemModel>> getImageItems(String query);
}