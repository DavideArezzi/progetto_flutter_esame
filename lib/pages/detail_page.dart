import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progettino_flutter/models/dog_breed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  final DogBreed breed;

  const DetailPage({super.key, required this.breed});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  Future<void> checkIfFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];

    setState(() {
      isFavorite = favorites.any((item) {
        final map = jsonDecode(item);
        return map['id'] == widget.breed.id;
      });
    });
  }

  Future<void> toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];

    final breedJson = jsonEncode(widget.breed.toJson());

    if (isFavorite) {
      favorites.removeWhere((item) {
        final map = jsonDecode(item);
        return map['id'] == widget.breed.id;
      });
    } else {
      favorites.add(breedJson);
    }
    await prefs.setStringList('favorites', favorites);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.bookmark : Icons.bookmark_border,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: Column(
        children: [
          if (widget.breed.imageUrl != null)
            Image.network(widget.breed.imageUrl!),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.breed.description,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
