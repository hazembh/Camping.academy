import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
    return SingleChildScrollView(
      child: Container(
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
              height: 13,
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
              height: 13,
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
              height: 8,
            ),
            SfSlider(
              min: 8,
              max: 23,
              interval: 3,
              showLabels: true,
              labelPlacement: LabelPlacement.betweenTicks,
              enableTooltip: true,
              labelFormatterCallback:
                  (dynamic actualValue, String formattedText) {
                return actualValue <= 12
                    ? '$formattedText AM '
                    : (int.parse(formattedText) - 12).toStringAsFixed(0) +
                    ' PM';
              },
              onChanged: (nawRating) {
                setState(() {});
              },
              value: 10,
            ),
            SizedBox(height: 13),
            Divider(
              color: Colors.black87,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(17.0, 0.0, 0.0, 0.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('EXPAND',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[700],
                              letterSpacing: 1.1,
                            )),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}