import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class MyTextFieldProfile extends StatelessWidget {
  final String name;
  final Color color;
  final double width;

  final TextEditingController controller;
  MyTextFieldProfile({
    required this.name,
    required this.color,
    required this.width,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 30, top: 25),
      width: width,
      child: Column(
        children: [
          /*TranslationWidget(
            text: name,
            fromLanguage: globals.fromLanguage,
            toLanguage: globals.toLanguage,
            builder: (translated) => */
          TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: name, //translated!,
              hintStyle: TextStyle(color: color),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.orange),
              ),
            ),
          ),
          //),
        ],
      ),
    );
  }
}
