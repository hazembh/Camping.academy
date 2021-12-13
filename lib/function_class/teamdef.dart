import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

Widget Teamdef(
    {required String path, required String name, required String post}) {
  return ListTile(
    dense: true,
    minLeadingWidth: 30,
    leading: ClipOval(
      child: Image.asset(
        path,
        // width: 55, height: 100
      ),
    ),
    title: Text(
      name,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    ),
    subtitle: TranslationWidget(
      text: post,
      fromLanguage: globals.fromLanguage,
      toLanguage: globals.toLanguage,
      builder: (translated) => Text(translated!,
          style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(126, 112, 68, 1),
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.left),
    ),
  );
}
