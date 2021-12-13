import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class TextFieldMission extends StatelessWidget {
  final String name;
  final double size;
  final int line;
  //final TextEditingController controller;
  TextFieldMission({
    required this.name,
    required this.size,
    required this.line,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: TranslationWidget(
        text: name,
        fromLanguage: globals.fromLanguage,
        toLanguage: globals.toLanguage,
        builder: (translated) => TextFormField(
          maxLines: line,
          textAlign: TextAlign.center,
          //controller: controller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: translated,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
