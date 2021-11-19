import 'package:flutter/material.dart';
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
