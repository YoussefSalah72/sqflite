import 'package:flutter/material.dart';
import 'package:sqflite__departement/view/home_screen.dart';

class SqfliteApp extends StatelessWidget {
  const SqfliteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
