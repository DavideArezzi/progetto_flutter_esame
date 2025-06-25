import 'package:logger/logger.dart';
import 'package:progettino_flutter/models/pokemon_list_response.dart';

import '../services/pokedex_service.dart';
class PokedexRepository {
   final Logger logger;
   final PokedexService pokedexService;

  PokedexRepository(this.logger, this.pokedexService);

  Future<List<PokemonListResults>> getPokedexList (int offset) async {
    try {
      final PokemonListResponse pokemonListResponse = await pokedexService.getPokemonList(offset);
      logger.i('PokemonListResponse: ${pokemonListResponse.toJson()}');
      return pokemonListResponse.results!;

    }
    catch (e) {
      logger.e('Errore nel recuperare dei pokemon');
      rethrow;
    }
  }
}