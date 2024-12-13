import 'package:flutter/material.dart';
import 'package:starwhat/screens/people_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star What?'),
      ),
      body: MaterialApp(
        title: 'Star What?',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PeopleScreen(),
      ),
    );
  }
}
