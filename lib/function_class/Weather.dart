import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Weather extends StatefulWidget {
  static const IconData wb_sunny_outlined =
      IconData(0xf4bc, fontFamily: 'MaterialIcons');

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
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
              Text('Hong Kong', style: TextStyle(fontSize: 25)),
              SizedBox(
                width: 280.0,
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
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0),
            child: Text('Mon, 12:30 PM, Mostly Sunny',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 12)),
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0)),
            Text('20 °C',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 100)),
            SizedBox(
              width: 100,
            ),
            Icon(
              Icons.wb_sunny_outlined,
              color: Colors.yellowAccent,
              size: 100.0,
            ),
          ]),
        ],
      ),
    );
  }
}
