import 'package:dio/dio.dart';
import 'package:progettino_flutter/models/pokemon_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
part 'pokedex_service.g.dart';

@RestApi()
abstract class PokedexService {
  factory PokedexService(Dio dio, {String baseUrl}) = _PokedexService;

  @GET('/pokemon?limit=100&offset={offset}')
  Future<PokemonListResponse> getPokemonList(@Path('offset') int offset);
}