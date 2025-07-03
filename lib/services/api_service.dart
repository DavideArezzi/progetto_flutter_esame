import 'package:dio/dio.dart';

import '../models/character_model.dart';

class ApiService {
  final dio = Dio();

  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      final response = await dio.get('https://thronesapi.com/api/v2/Characters');
      final data = response.data as List;

      return data.map((json) => CharacterModel.fromJson(json)).toList();
    }
    catch (e) {
      print('Errore nella chiamata API: $e');
      return [];
    }
  }
}