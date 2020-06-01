import 'dart:convert';

import 'package:alimentacion/models/pictureDTO.dart';
import 'package:http/http.dart' as http;

Future<List<PictureDto>> fetchPictures(int page) async {
  final response =
      await http.get('https://picsum.photos/v2/list?page=$page&limit=5');

  if (response.statusCode == 200) {
    var result = json.decode(response.body).cast<PictureDto>();

    return result;
  } else {
    throw Exception('Failed to load pictures');
  }
}
