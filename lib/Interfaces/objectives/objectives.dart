import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Objective extends StatefulWidget {
  const Objective({Key? key}) : super(key: key);

  @override
  _ObjectiveState createState() => _ObjectiveState();
}

class _ObjectiveState extends State<Objective> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("objective"),
    );
  }
}
