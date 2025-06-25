import 'package:flutter/material.dart';

import '../../models/pokemon_detail_response.dart';

class PokemonMovesWidget extends StatelessWidget {
  const PokemonMovesWidget({super.key, required this.moves});
  final List<Moves> moves;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: moves.map((move) {
        // Prendo il primo metodo di apprendimento disponibile
        final versionDetail = move.versionGroupDetails?.first;
        final levelLearned = versionDetail?.levelLearnedAt ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Nome della mossa
              Text(
                move.move?.name ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Livello in cui è stata appresa
              Text(
                'Lv. $levelLearned',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}