import 'dart:convert';
import 'package:alimentacion/models/CardDTO.dart';
import 'package:http/http.dart' as http;

import 'package:alimentacion/models/author.dart';

Future<Author> fetchAuthors() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // Si el servidor devuelve una repuesta OK, parseamos el JSON

    var jsonDecoded = json.decode(response.body);
    return Author.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<List<CardDTO>> fechtCards(int page) async {
  final response = await http.get('https://api.magicthegathering.io/v1/cards?pageSize=5&page=$page');

  if (response.statusCode == 200) {

    var jsonDecoded = json.decode(response.body)['cards'];
    var result = CardDTOList.fromJson(jsonDecoded).cards;

    return result;
  } else {
    throw Exception('Failed to load cards');
  }
}