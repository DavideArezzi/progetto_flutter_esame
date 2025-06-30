import 'package:flutter/material.dart';
import 'package:progettino_flutter/models/dog_breed.dart';
import 'package:progettino_flutter/services/dog_api_service.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DogBreed> breeds = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBreeds();
  }

  Future<void> loadBreeds() async {
    final api = DogApiService();
    final result = await api.fetchBreeds();
    setState(() {
      breeds = result;
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
        itemCount: breeds.length,
        itemBuilder: (context, index) {
          final breed = breeds[index];
          print('URL immagine: ${breed.imageUrl}');
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
                    ? Image.network(
                  breed.imageUrl!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                )
                    : const Icon(Icons.pets),
                title: Text(breed.name),
                subtitle: Text(breed.description),
              ),
            ),
          );
        },
      ),
    );
  }
}