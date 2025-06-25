import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/pokedetail_bloc/pokedetail_bloc.dart';
import '../components/pokemon_moves_widget.dart';
import '../components/type_pokemon_widget.dart';


@RoutePage()
class DetailPokemonPage extends StatelessWidget implements AutoRouteWrapper {
  const DetailPokemonPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
        builder: (context, state) {
          if (state is FetchingPokemonDetailState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchedPokemonDetailState) {
            final pokemonDetail = state.pokemonDetail;
            return Stack(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: double.infinity,
                    color: getPokemonTypeColor(
                        pokemonDetail.types?.first.type?.name ?? '')
                        .withOpacity(0.6),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () => context.maybePop(),
                              child: Icon(CupertinoIcons.arrow_left,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  pokemonDetail.name ?? '',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "#${pokemonDetail.id.toString()}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          TypePokemonWidgetRow(
                              types: pokemonDetail.types ?? []),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Opacity(
                                  opacity:
                                  0.2, // Valore tra 0.0 (trasparente) e 1.0 (opaco)
                                  child: Image.asset(
                                    'assets/pokeball.png',
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Image.network(
                                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${pokemonDetail.id}.gif",
                                  fit: BoxFit.cover,
                                  scale: 0.3,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              height: 420,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mosse',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Expanded(
                                    // Rende il contenuto flessibile
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: pokemonDetail.moves?.length ?? 0,
                                        itemBuilder:(context, index) => PokemonMovesWidget(moves: pokemonDetail.moves?? []),)),
                                ],
                              ),
                            ),
                          )
                        ])),
              ],
            );
          } else if (state is ErrorPokemonDetailState) {
            return const Text('Errore nel recupero del pokemon');
          } else {
            return const Text('Errore nel recupero del pokemon');
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
        PokemonDetailBloc(pokemonRepository: context.read())
          ..fetchPokemonDetail(id),
      ),
    ],
    child: this,
  );
}