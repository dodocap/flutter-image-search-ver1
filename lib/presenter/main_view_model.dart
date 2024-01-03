import 'package:flutter/material.dart';
import 'package:orm_image_search_ver1/data/model/image_item_model.dart';
import 'package:orm_image_search_ver1/data/repository/image_item_repository.dart';
import 'package:orm_image_search_ver1/data/repository/image_item_repository_impl.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository = ImageItemRepositoryImpl();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ImageItemModel> _imageItems = [];
  List<ImageItemModel> get imageItems => List.unmodifiable(_imageItems);

  Future<void> loadImage(String query) async {
    _isLoading = true;
    notifyListeners();
    _imageItems = await _repository.getImageItems(query);
    _isLoading = false;
    notifyListeners();
  }
}