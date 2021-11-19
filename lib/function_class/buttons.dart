import 'package:flutter/material.dart';

Widget button(
    {required String val,
      required Function onTap } ) {
  // ignore: deprecated_member_use
  return Container(
    height: 50.0,
    width: 200,
    child: RaisedButton(
      onPressed: () { onTap();},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromRGBO(227, 189, 202, 1), Color.fromRGBO(190, 189,209,1)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            val,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                    fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
