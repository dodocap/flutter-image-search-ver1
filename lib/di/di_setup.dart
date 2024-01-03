import 'package:get_it/get_it.dart';
import 'package:orm_image_search_ver1/data/data_source/api.dart';
import 'package:orm_image_search_ver1/data/data_source/pixabay_api.dart';
import 'package:orm_image_search_ver1/data/repository/image_item_repository.dart';
import 'package:orm_image_search_ver1/data/repository/image_item_repository_impl.dart';
import 'package:orm_image_search_ver1/presenter/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<Api>(PixabayApi());

  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl(api: getIt<Api>()));

  getIt.registerFactory<MainViewModel>(() => MainViewModel(repository: getIt<ImageItemRepository>()));
}