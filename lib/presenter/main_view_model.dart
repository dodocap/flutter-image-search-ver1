import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orm_image_search_ver1/core/constants.dart';
import 'package:orm_image_search_ver1/core/result.dart';
import 'package:orm_image_search_ver1/core/ui_event.dart';
import 'package:orm_image_search_ver1/data/model/image_item_model.dart';
import 'package:orm_image_search_ver1/data/repository/image_item_repository.dart';
import 'package:orm_image_search_ver1/presenter/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  MainViewModel({required ImageItemRepository repository}) : _repository = repository;

  MainState _state = const MainState();
  MainState get state => _state;

  final StreamController<UiEvent> _eventController = StreamController();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> loadImage(String query) async {
    if (query.trim().isEmpty) {
      _eventController.add(const UiEvent.showDialog(errEmptyQuery));
      return;
    }

    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<ImageItemModel>> resultList = await _repository.getImageItems(query);
    resultList.when(
      success: (data) {
        _state = _state.copyWith(isLoading: false, imageItems: data);
      },
      error: (e) {
        _state = _state.copyWith(isLoading: false, imageItems: List.empty());
        _eventController.add(UiEvent.showSnackBar(e));
      },
    );
    notifyListeners();
  }
}
