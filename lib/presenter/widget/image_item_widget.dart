import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  final String _imageItem;

  const ImageItemWidget({
    super.key,
    required String imageItem,
  }) : _imageItem = imageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        _imageItem,
        fit: BoxFit.cover,
      ),
    );
  }
}
