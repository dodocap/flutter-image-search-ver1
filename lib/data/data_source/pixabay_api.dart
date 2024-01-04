import 'dart:convert';
import 'package:orm_image_search_ver1/core/constants.dart';
import 'package:orm_image_search_ver1/core/result.dart';
import 'package:orm_image_search_ver1/data/data_source/api.dart';
import 'package:orm_image_search_ver1/data/dto/pixabay_dto.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements Api {
  @override
  Future<Result<PixabayDto>> getImages(String query) async {
    try {
      final http.Response response =
      await http.get(Uri.parse('https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));

      return Result.success(PixabayDto.fromJson(jsonDecode(response.body)));
    } catch (e) {
       return const Result.error(errNetwork);
    }
  }
}
