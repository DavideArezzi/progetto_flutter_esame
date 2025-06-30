import 'package:dio/dio.dart';

import '../models/dog_breed.dart';

class DogApiService {
  final Dio _dio = Dio();

  Future<List<DogBreed>> fetchBreeds() async {
    try {
      final response = await _dio.get('https://api.thedogapi.com/v1/breeds');
      final data = response.data as List;

      return data.map((json) => DogBreed.fromJson(json)).toList();
    }
    catch (e) {
      print('Errore nella chiamata API: $e');
      return [];
    }
  }
}