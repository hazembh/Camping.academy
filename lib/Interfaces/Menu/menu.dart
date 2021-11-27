import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/souvenirs.dart';
import 'package:flutter_application_1/function_class/Weather.dart';
import 'package:flutter_application_1/function_class/advantages.dart';
import 'package:flutter_application_1/function_class/gest_detector.dart';
import 'package:flutter_application_1/function_class/navigation%20bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 232, 232, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text("Menu",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600])),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/c5.png',
                    width: 60,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Kais Kammoun",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                width: 800.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Gest_detector("Event", () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Gest_detector(
                        "Advantages",
                        () => showModalBottomSheet(
                              //expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Advantages(),
                            )),
                    SizedBox(
                      height: 10,
                    ),
                    Gest_detector(
                        "Weather",
                        () => showModalBottomSheet(
                              //expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Weather(),
                            )),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Gest_detector("Friends", () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Gest_detector("Team", () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Gest_detector(
                        "Souvenirs",
                        () => showModalBottomSheet(
                              //expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Souvenirs(),
                            )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                width: 800.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  print("Container was tapped");
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 50,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                width: 800.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
