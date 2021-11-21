import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/Menu/academy_definition.dart';
import 'package:flutter_application_1/Interfaces/Menu/membre_scout.dart';
import 'Interfaces/Menu/menu.dart';
import 'function_class/navigation bar.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigationbar(),
    );
  }
}
