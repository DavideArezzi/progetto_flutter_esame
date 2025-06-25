import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:progettino_flutter/ui/components/type_pokemon_widget.dart';

import '../../models/pokemon_list_response.dart';
import '../../router/app_router.gr.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({super.key, required this.pokemonListResults});
  final PokemonListResults pokemonListResults;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(DetailPokemonRoute(id: pokemonListResults.name ?? ''));
      },
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: getPokemonTypeColor(pokemonListResults
              .pokemonDetailResponse?.types?.first.type?.name ??
              '')
              .withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemonListResults.name ?? '',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                pokemonListResults.pokemonDetailResponse != null
                    ? TypePokemonWidget(
                    types:
                    pokemonListResults.pokemonDetailResponse!.types ?? [])
                    : const SizedBox.shrink(),
              ],
            ),
            Stack(
              alignment: Alignment.center, // Allinea perfettamente al centro
              children: [
                Opacity(
                  opacity: 0.5, // Valore tra 0.0 (trasparente) e 1.0 (opaco)
                  child: Image.asset(
                    'assets/pokeball.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                Image.network(
                  pokemonListResults.image ?? '',
                  fit: BoxFit.cover,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}