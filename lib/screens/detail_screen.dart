import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progettino_flutter/models/character_model.dart';

class DetailScreen extends StatefulWidget {
  final CharacterModel character;
  const DetailScreen({super.key, required this.character});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
 bool isFavorite = false;

 @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
 }

  Future<void> checkFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favoriteList') ?? [];
    setState(() {
      isFavorite = favoriteList.any((item ) {
        final map= jsonDecode(item);
        return map['id'] == widget.character.id;
      });
    });
  }

  Future<void> toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favoriteList') ?? [];
    final  characterJson = jsonEncode(widget.character.toJson());
    if (isFavorite) {
      favoriteList.removeWhere((item) {
        final map = jsonDecode(item);
        return map['id'] == widget.character.id;
      });
    } else {
      favoriteList.add(characterJson);
    }
    await prefs.setStringList('favoriteList', favoriteList);
    setState(() {
      isFavorite = !isFavorite;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(widget.character.fullName ?? 'Mario'),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.bookmark : Icons.bookmark_border),
            onPressed: toggleFavorite,
          ),
        ],
        ),
      body: Column(
        children: [
          if (widget.character.imageUrl != null)
            Image.network(widget.character.imageUrl!),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
              Text('Nome: ${widget.character.firstName ?? 'Mario'}',
                style: const TextStyle(fontSize: 24),
              ),
              Text('Cognome: ${widget.character.lastName ?? 'Audibussio'}',
                style: const TextStyle(fontSize: 24),
              ),
              Text('Nome Completo: ${widget.character.fullName ?? 'Mario Audibussio'}',
                style: const TextStyle(fontSize: 24),
              ),
                Text('Famiglia: ${widget.character.family ?? 'Negro'}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text('Titolo: ${widget.character.title ?? 'Dittatore'}',
                  style: const TextStyle(fontSize: 24),
                ),
              ]
            )
          )
        ]
      )
      );
  }




}


