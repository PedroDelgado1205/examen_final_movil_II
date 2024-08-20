import 'package:flutter/material.dart';
import 'config/theme/app_theme.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen final To-Do List',
      theme: AppTheme(selectedColor: 4).getTheme(), 
      home: const HomeScreen(),
    );
  }
}