import 'package:orm_image_search_ver1/core/constants.dart';
import 'package:orm_image_search_ver1/core/result.dart';
import 'package:orm_image_search_ver1/core/ui_event.dart';
import 'package:orm_image_search_ver1/domain/model/image_item_model.dart';
import 'package:orm_image_search_ver1/domain/repository/image_item_repository.dart';

class QueryImageUseCase {
  final ImageItemRepository _imageItemRepository;

  QueryImageUseCase({
    required ImageItemRepository imageItemRepository,
  }) : _imageItemRepository = imageItemRepository;

  Future<Result<List<ImageItemModel>>> execute(String query) async {
    final Result<List<ImageItemModel>> result = await _imageItemRepository.getImageItems(query);

    if (result is Success<List<ImageItemModel>> && result.data.isEmpty) {
      return const Result.error(emptyData);
    }

    return result;
  }
}
