import 'package:flutter/material.dart';
import 'package:progettino_flutter/screens/favorite_screen.dart';
import 'package:progettino_flutter/screens/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = [HomeScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game of thrones',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        )
      )
    );
  }
}


