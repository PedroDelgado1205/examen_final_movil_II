import 'package:flutter/material.dart';

// Lista de colores predefinidos para elegir el tema.
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

// Clase que define el tema de la aplicación.
class AppTheme {
  final int selectedColor; // Índice del color seleccionado de la lista.

  // Constructor que inicializa el tema con un color seleccionado. El valor predeterminado es el índice 5 (deepPurple).
  AppTheme({this.selectedColor = 5})
      : assert(selectedColor >= 0, 'El color seleccionado debe ser mayor o igual a 0'),
        assert(selectedColor < colorList.length,
            'El color seleccionado debe ser menor que ${colorList.length}');

  // Devuelve un objeto ThemeData configurado con el color y estilos definidos.
  ThemeData getTheme() => ThemeData(
        useMaterial3: true, // Usa el diseño Material 3.
        brightness: Brightness.dark, // Configura el brillo del tema como oscuro.
        colorSchemeSeed: colorList[selectedColor], // Usa el color seleccionado para el esquema de color.
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white), // Color del texto grande.
          titleSmall: TextStyle(color: Color(0xFF919191)), // Color del texto pequeño.
          bodyMedium: TextStyle(color: Color(0xFFD4009F)), // Color del texto medio.
          bodySmall: TextStyle(color: Color(0xFF44003B)), // Color del texto pequeño.
        ),
      );
}
