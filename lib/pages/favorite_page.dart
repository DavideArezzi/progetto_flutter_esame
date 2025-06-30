import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dog_breed.dart';
import 'detail_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<DogBreed> favorites = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('favorites') ?? [];

    final list = data.map((item) {
      final map = jsonDecode(item);
      return DogBreed.fromMap(map);
    }).toList();

    setState(() {
      favorites = list;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    if (favorites.isEmpty) {
      return const Center(child: Text('Nessun preferito salvato.'));
    }

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final breed = favorites[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(breed: breed),
              ),
            );
          },
          child: Card(
            child: ListTile(
              leading: breed.imageUrl != null
                  ? Image.network(breed.imageUrl!, width: 60, fit: BoxFit.cover)
                  : const Icon(Icons.pets),
              title: Text(breed.name),
              subtitle: Text(breed.description),
            ),
          ),
        );
      },
    );
  }
}
