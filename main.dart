import 'package:flutter/material.dart';
import 'package:hw1/widgets/random_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(          // Remove the const from here
      title: ' פעילות מבצעית דצמבר',
      theme: ThemeData(          // Add the 5 lines from here... 
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 84, 115, 90),
          foregroundColor: Colors.white,
        ),
      ),                         // ... to here.
      home: const RandomWords(), // And add the const back here.
    );
  }
}