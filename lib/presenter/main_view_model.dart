import 'package:flutter/material.dart';
import 'package:orm_image_search_ver1/data/model/image_item_model.dart';
import 'package:orm_image_search_ver1/data/repository/image_item_repository.dart';
import 'package:orm_image_search_ver1/presenter/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainViewModel({required ImageItemRepository repository}) : _repository = repository;

  MainState _state = const MainState();
  MainState get state => _state;

  Future<void> loadImage(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final List<ImageItemModel> imageItems = await _repository.getImageItems(query);
    _state = _state.copyWith(isLoading: false, imageItems: imageItems);
    notifyListeners();
  }
}