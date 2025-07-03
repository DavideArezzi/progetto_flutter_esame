import 'package:flutter/material.dart';
import 'package:progettino_flutter/services/api_service.dart';

import '../models/character_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CharacterModel> characters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    final api = ApiService();
    final result = await api.fetchCharacters();
    setState(() {
      characters = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
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
            }
            )
    );
  }
}
