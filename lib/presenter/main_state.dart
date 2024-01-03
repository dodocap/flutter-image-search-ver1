import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orm_image_search_ver1/data/model/image_item_model.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
  @Default(false) bool isLoading,
  @Default([]) List<ImageItemModel> imageItems
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) => _$MainStateFromJson(json);
}