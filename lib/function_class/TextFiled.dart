import 'package:flutter/material.dart';
import 'package:flutter_application_1/globals.dart' as globals;
import 'package:flutter_application_1/widget/translation_widget.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;
  MyTextField({
    required this.name,
    required this.obscure,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 30, top: 15),
      child: TranslationWidget(
        text: name,
        fromLanguage: globals.fromLanguage,
        toLanguage: globals.toLanguage,
        builder: (translated) => TextFormField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            hintText: translated,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
