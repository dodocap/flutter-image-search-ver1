import 'package:flutter/material.dart';
import 'package:orm_image_search_ver1/domain/model/image_item_model.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageItemModel _imageItemModel;

  const ImageItemWidget({
    super.key,
    required ImageItemModel imageItem,
  }) : _imageItemModel = imageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.network(
            _imageItemModel.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(bottom: 10, left: 10, child: Row(
            children: [
              const Icon(Icons.star),
              Text('${_imageItemModel.likes}')
            ],
          ),),
        ],
      ),
    );
  }
}
