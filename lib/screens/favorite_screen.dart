import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/character_model.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<CharacterModel> characters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favoriteList') ?? [];
    final list = favoriteList.map((item) {
      final map = jsonDecode(item);
      return CharacterModel.fromMap(map);
    }).toList();
    setState(() {
      characters = list;
      isLoading = false;

    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (characters.isEmpty) {
      return const Center(child: Text('Nessun elemento trovato'));
    }
    return SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              DetailScreen(character: character)
                      ),
                    );
                  },
                  child: Card(
                      child: ListTile(
                        leading: character.imageUrl != null
                            ? Image.network(character.imageUrl!,
                            width: 60, height: 60, fit: BoxFit.cover)
                            : const Icon(Icons.person),
                        title: Text(character.fullName ?? 'Mario'),
                        subtitle: Text(character.title ?? 'Audibussio'),
                      )
                  )
                  );
            },
        )
    );

}}
