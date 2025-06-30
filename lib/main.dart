import 'package:flutter/material.dart';
import 'package:progettino_flutter/pages/favorite_page.dart';
import 'package:progettino_flutter/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final pages = [HomePage(), FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dog Breed App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Preferiti',
                ),
              ],
              onTap: (index) => setState(() => currentIndex = index),
            )));
  }
}
