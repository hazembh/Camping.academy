import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:flutter_application_1/testWeather.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:expandable/expandable.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:time_slider/time_slider.dart';

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
  var resultCurrent;
  int index1 = 0;
  final String localisation = 'Sfax';
  late Position _currentPosition;
  late String _currentAddress = '';

  Future<void> getWeather(String localisation) async {
    String url = "http://192.168.1.108:8000/api";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        jsonResponse = response.body;
        result = json.decode(jsonResponse);
        resultCurrent = result['json_current'];
        resultDays = result['json'];
        //_itemCount = jsonResponse.length;
      });
      print(resultCurrent['4']['time_slider'].substring(2, 4));
//      jsonResponse[0]["json"]; = author name
//      jsonResponse[0]["json_current"]; = quotes text
      print("Number of quotes found : $_itemCount.");
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality},  ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  SendLocation(String localisation) async {
    String url = "http://192.168.1.108:8000/receive";
    try {
      var request = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Content-type": "application/json",
          },
          body: '{"localisation": "$localisation"}');
      print("request: " + request.headers.toString());
      print(request.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather('');
  }

  @override
  Widget build(BuildContext context) {
    final double height2 = MediaQuery.of(context).size.height - 230;
    // ignore: non_constant_identifier_names
    String sup_zero(tim) {
      return tim.substring(0, 1) == '0' ? tim.substring(1, 5) : tim;
    }

    List<RadioModel> hourList = [
      RadioModel(false, sup_zero(resultCurrent['0']['time_slider'])),
      RadioModel(false, sup_zero(resultCurrent['1']['time_slider'])),
      RadioModel(false, sup_zero(resultCurrent['2']['time_slider'])),
      RadioModel(false, sup_zero(resultCurrent['3']['time_slider'])),
      RadioModel(false, sup_zero(resultCurrent['4']['time_slider'])),
    ];
    /*double get_index(radio){

    }*/
    hourlyForecast(resultForecast) {
      return Card(
          elevation: 5.0,
          margin: EdgeInsets.all(8),
          child: Column(children: [
            Container(
              child: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 50,
                automaticallyImplyLeading: false,
                elevation: 0,
                leading: GestureDetector(
                    onTap: () => {_getCurrentLocation()},
                    child: Icon(Icons.location_on_outlined,
                        size: 30, color: Colors.black)),
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
                        SendLocation(localisation);
                      },
                      child: Text('data')),
                  // ignore: unnecessary_null_comparison
                  if (_currentAddress != null) Text(_currentAddress),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(15.0, 4.0, 0.0, 0.0),
              child: Text(
                  "${resultForecast['time']}, ${resultForecast['description']}",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15)),
            ),
            SizedBox(
              height: 13,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 0.0)),
              Text('${resultForecast["temp"]} °C',
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 95)),
              SizedBox(
                width: 40,
              ),
              ClipRect(
                child: Align(
                  heightFactor: 1,
                  child: Image.network(
                    'http://openweathermap.org/img/w/${resultForecast["icon"]}.png',
                    scale: 0.5,
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 45.0)),
              Icon(
                Icons.wb_cloudy_outlined,
                color: Colors.lightBlueAccent,
                size: 30.0,
              ),
              SizedBox(
                width: 17,
              ),
              Text("${resultForecast['humidity']}",
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 17)),
              SizedBox(
                width: 60,
              ),
              Icon(
                Icons.air_rounded,
                color: Colors.lightBlueAccent,
                size: 30,
              ),
              SizedBox(
                width: 17,
              ),
              Text("${resultForecast['wind']}",
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 17)),
            ]),
          ]));
    }

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(5.0)),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5.0,
          child: jsonResponse == null
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    hourlyForecast(resultCurrent['$index1']),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      child: TimeSlider(
                        onPressed: () {
                          //print('Changed!');
                          for (var i = 0; i < hourList.length; i++) {
                            if (hourList[i].isSelected == true) {
                              //print(i);
                              setState(() {
                                index1 = i;
                                print('index1: $index1');
                              });
                            }
                            print('$i ${hourList[i].isSelected}');
                          }
                        },
                        separation: 10,
                        hoursList: hourList,
                        height: 37,
                        width: MediaQuery.of(context).size.width / 5 - 14,
                        textColor: Colors.white,
                        selectedTextColor: Colors.blue,
                        color: Colors.blue,
                        selectedColor: Colors.white,
                      ),
                    ),
                    Card2(resultDays, () => getWeather(''))
                  ],
                ),
        ),
      ),
    );
  }
}
