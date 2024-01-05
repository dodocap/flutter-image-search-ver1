import 'package:orm_image_search_ver1/data/dto/pixabay_dto.dart';
import 'package:orm_image_search_ver1/domain/model/image_item_model.dart';

extension PixabayToImageMappger on Hits {
  ImageItemModel mapper() {
    return ImageItemModel(
      imageUrl: previewURL ?? 'http://rooprekorea.co.kr/wp-content/uploads/2022/03/placeholder-4.png',
      tag: tags ?? '',
      likes: likes?.toInt() ?? 0,
    );
  }
}
