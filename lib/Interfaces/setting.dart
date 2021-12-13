import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/translations.dart';
//import 'package:flutter_application_1/function_class/buttons.dart';
//import 'package:flutter_application_1/function_class/gest_detector_language.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/widget/drop_down_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 820,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(249, 249, 249, 1),
            Color.fromRGBO(186, 186, 186, 1),
            Color.fromRGBO(255, 207, 207, 1),
            Color.fromRGBO(107, 107, 107, 1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.language,
                size: 60,
                color: Colors.grey[800],
              ),
              SizedBox(
                width: 75,
              ),
              Container(
                child: TranslationWidget(
                  text: "Language",
                  fromLanguage: globals.fromLanguage,
                  toLanguage: globals.toLanguage,
                  builder: (translated) => Text(
                    translated!,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Center(
            child: TranslationWidget(
              text: 'Please select a language from the list',
              fromLanguage: globals.fromLanguage,
              toLanguage: globals.toLanguage,
              builder: (translated) => Text(
                translated!,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.translate, color: Colors.black87),
                SizedBox(width: 12),
                DropDownWidget(
                  value: globals.toLanguage,
                  onChangedLanguage: (newLanguage) => setState(() {
                    globals.fromLanguage =
                        Translations.languages.first; //globals.toLanguage;
                    globals.toLanguage = newLanguage;
                    print('from language: ${globals.fromLanguage}');
                    print('to language: ${globals.toLanguage}');
                  }),
                ),
                SizedBox(width: 12),
                Icon(Icons.translate, color: Colors.black87),
              ],
            ),
          ),
          /*GestDetLan("English", () {}, 'assets/eng.png'),
          GestDetLan("French ", () {}, 'assets/fr.png'),
          GestDetLan("Arabic ", () {}, 'assets/tn.png'),
          SizedBox(
        height: 50,
          ),
          button(val: "Change", onTap: () {})*/
        ],
      ),
    ));
  }
}
