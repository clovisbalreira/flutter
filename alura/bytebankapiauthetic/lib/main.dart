import 'package:flutter/material.dart';
import 'package:bytebankbancodedados/screens/dashbords.dart';


void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blueAccent[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent[700], // Cor de fundo do botão
            foregroundColor: Colors.white, // Cor do texto do botão
          ),
        ),
      ),
      home: Dashboard(),
    );
  }
}



