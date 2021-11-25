import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Advantages extends StatefulWidget {
  const Advantages({Key? key}) : super(key: key);

  @override
  _AdvantagesState createState() => _AdvantagesState();
}

class _AdvantagesState extends State<Advantages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 0.0, 0.0),
            child: Row(children: <Widget>[
              Text('Advantages', style: TextStyle(fontSize: 25)),
              SizedBox(
                width: 200,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ]),
          ),

          SizedBox(
            height: 15,
          ),



        ],
      ),
    );
  }
}