import 'package:flutter/material.dart';
import 'views.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartões Virtuais',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: "/",
      routes: {
        "/":(context) => HomePage(),
        "/banco":(context) => PageBanco(),
        "/virtual":(context) => PageVirtual(),
        "/sus":(context) => PageSus(),
      },

    );
  }
}
