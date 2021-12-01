import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:flutter_application_1/testWeather.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:expandable/expandable.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  static const IconData wb_sunny_outlined =
      IconData(0xf4bc, fontFamily: 'MaterialIcons');

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int _itemCount = 0;

  var jsonResponse;
  var result;
  var resultDays;
  final String localisation = 'Ariana';

  Future<void> getWeather() async {
    String url = "http://10.0.2.2:8000/api";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {

      setState(() {
        jsonResponse = response.body;
        result = json.decode(response.body)['json_current']['0'];
        resultDays = json.decode(response.body)['json'];
        //_itemCount = jsonResponse.length;
      });
      print(result);
//      jsonResponse[0]["json"]; = author name
//      jsonResponse[0]["json_current"]; = quotes text
      print("Number of quotes found : $_itemCount.");
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height2 = MediaQuery.of(context).size.height - 230;
    return SingleChildScrollView(
      child: Container(
        height: height2,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(5.0)),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5.0,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: AppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 50,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  title: Text("$localisation",
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          getWeather();
                        },
                        child: Text('data'))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0),
                child: Text("${result['time']}, ${result['description']}",
                    textAlign: TextAlign.start, style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0)),
                    Text('${result["temp"]} °C',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 95)),
                    SizedBox(
                      width: 40,
                    ),
                    /*Icon(
                      Icons.wb_sunny_rounded,
                      color: Colors.yellowAccent,
                      size: 95.0,
                    )*/ClipRect(
                      child: Align(

                        heightFactor: 1,
                        child: Image.network('http://openweathermap.org/img/w/${result["icon"]}.png',scale: 0.5,),
                      ),
                    )


                  ]),
              SizedBox(
                height: 13,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0)),
                    Icon(
                      Icons.wb_cloudy_outlined,
                      color: Colors.lightBlueAccent,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("${result['humidity']}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.air_rounded,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("${result['wind']}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16)),
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
              Card2(resultDays)
            ],
          ),
        ),
      ),
    );
  }
}
