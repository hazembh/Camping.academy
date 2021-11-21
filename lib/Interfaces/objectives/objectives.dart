import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  _ObjectivesState createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panel: Center(
          child: Column(
            children: [

            ],
          ),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Text(
              "Category selection",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          

        ),
      ),
    );
  }
}
