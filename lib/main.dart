import 'package:flutter/material.dart';
import 'package:smartdex/pages/dexhome/dexhome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartdex: Pokedex for You',
      theme: ThemeData(
        primaryColor: Color(0xFFFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      home: DexHome(),
    );
  }
}
