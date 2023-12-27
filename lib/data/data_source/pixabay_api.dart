import 'dart:convert';

import 'package:orm_image_search_ver1/data/dto/pixabay_dto.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  Future<PixabayDto> getImages(String query) async {
    final http.Response response =
        await http.get(Uri.parse('https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));

    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}
