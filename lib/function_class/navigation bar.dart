import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/APImaps.dart';
import 'package:flutter_application_1/Interfaces/Menu/academy_definition.dart';
import 'package:flutter_application_1/Interfaces/Menu/membre_scout.dart';
import 'package:flutter_application_1/Interfaces/Menu/menu.dart';
import 'package:flutter_application_1/Interfaces/Profile.dart';
import 'package:flutter_application_1/Interfaces/friends.dart';
import 'package:flutter_application_1/Interfaces/objectives/objectives.dart';
import 'package:flutter_application_1/Interfaces/profiles.dart';
import 'package:flutter_application_1/Interfaces/setting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class Navigationbar extends StatefulWidget {
  Navigationbar({Key? key}) : super(key: key);

  @override
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int selectedPage = 0;
  final _pageOptions = [
    Menu(),
    Settings(),
    Profiles(),
    Friends(),
    Objective(),
    //MapSample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: TranslationWidget(
        text: "Menu*Settings*User*Message*Objectives",
        fromLanguage: globals.fromLanguage,
        toLanguage: globals.toLanguage,
        builder: (translated) => ConvexAppBar(
          color: Colors.black,
          backgroundColor: Colors.white,
          activeColor: Colors.blue,
          //cornerRadius: 30,
          items: [
            TabItem(icon: Icons.menu, title: translated!.split('*')[0]),
            TabItem(icon: Icons.settings, title: translated.split('*')[1]),
            TabItem(
                icon: Icons.supervised_user_circle,
                title: translated.split('*')[2]),
            TabItem(icon: Icons.message, title: translated.split('*')[3]),
            TabItem(icon: Icons.check, title: translated.split('*')[4]),
            //TabItem(icon: Icons.map, title: translated.split('*')[5]),
          ],
          initialActiveIndex: selectedPage, //optional, default as 0
          onTap: (int index) {
            setState(() {
              selectedPage = index;
              //print("Translated nav bar: ${translated.split('*')}");
            });
          },
        ),
      ),
    );
  }
}
