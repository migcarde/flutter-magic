import 'dart:convert';

import 'package:alimentacion/models/pictureDTO.dart';
import 'package:http/http.dart' as http;

Future<List<PictureDto>> fetchPictures(int page) async {
  final response =
      await http.get('https://picsum.photos/v2/list?page=$page&limit=5');

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body).cast<Map<String, dynamic>>();
    var result = parsedJson.map<PictureDto>((json) => PictureDto.fromJson(json)).toList();

    return result;
  } else {
    throw Exception('Failed to load pictures');
  }
}
