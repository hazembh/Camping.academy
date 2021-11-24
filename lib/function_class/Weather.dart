import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0),
            child: Text('Mon, 12:30 PM, Mostly Sunny',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 15)),
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0)),
            Text('20 °C',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 95)),
            SizedBox(
              width: 40,
            ),
            Icon(
              Icons.wb_sunny_rounded,
              color: Colors.yellowAccent,
              size: 95.0,
            ),
          ]),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0)),
            Icon(
              Icons.wb_cloudy_rounded,
              color: Colors.lightBlueAccent,
              size: 30.0,
            ),
            SizedBox(
              width: 15,
            ),
            Text('2% Precipitation',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 16)),
            SizedBox(
              width: 50,
            ),
            Icon(
              Icons.wb_auto_rounded,
              color: Colors.lightBlueAccent,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Text('5 km/h Winds',
                textAlign: TextAlign.start, style: TextStyle(fontSize: 16)),
          ]),
          SizedBox(
            width: 25,
          ),
          SfRangeSlider(
            min: 8,
            max: 12,
            interval: 2,
            showLabels: true,
            enableTooltip: true,
            onChanged: (nawRating) {
              setState(() {});
            },
            values: SfRangeValues('8AM', '10AM'),
          )
        ],
      ),
    );
  }
}