import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/testsouvenirs.dart';

class Souvenirs extends StatefulWidget {
  const Souvenirs({Key? key}) : super(key: key);

  @override
  _SouvenirsState createState() => _SouvenirsState();
}

class _SouvenirsState extends State<Souvenirs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
      child: Testsouvenir(),
    ));
  }
}
