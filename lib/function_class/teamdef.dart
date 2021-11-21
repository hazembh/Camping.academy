import 'package:flutter/material.dart';

Widget Teamdef(
    {required String path, required String name, required String post}) {
  return Column(
    children: [
      SizedBox(
        height: 32,
      ),
      Row(
        children: [
          SizedBox(
            width: 10,
          ),
          ClipOval(
            child: Image.asset(
              path,
              width: 55,

            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                post,
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(126, 112, 68, 1),fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    ],
  );
}
