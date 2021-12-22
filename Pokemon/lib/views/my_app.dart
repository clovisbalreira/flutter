import 'package:flutter/material.dart';
import 'views.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokemon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.lightBlue[100],
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        "/":(context) => HomePage(),
        "/lista":(context) => ListaPokemon(),
      },
    );
  }
}
