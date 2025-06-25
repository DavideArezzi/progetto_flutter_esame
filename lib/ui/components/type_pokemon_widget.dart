import 'package:flutter/material.dart';
import '../../models/pokemon_detail_response.dart';

class TypePokemonWidget extends StatelessWidget {
  const TypePokemonWidget({super.key, required this.types});
  final List<Types> types;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: types
            .map((type) => Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.4)),
          child: Text(type.type?.name ?? '', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
        ))
            .toList());
  }
}


class TypePokemonWidgetRow extends StatelessWidget {
  const TypePokemonWidgetRow({super.key, required this.types});
  final List<Types> types;

  @override
  Widget build(BuildContext context) {
    return Row(

        children: types
            .map((type) => Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.4)),
          child: Text(type.type?.name ?? '', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
        ))
            .toList());
  }
}