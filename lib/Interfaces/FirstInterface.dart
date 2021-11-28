import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/buttons.dart';

class FirstInterface extends StatefulWidget {
  const FirstInterface({Key? key}) : super(key: key);

  @override
  _FirstInterfaceState createState() => _FirstInterfaceState();
}

class _FirstInterfaceState extends State<FirstInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 120, // To take AppBar Size only
            left: 0.0,
            right: 0.0,
            child: Image.asset('assets/logo.png'),
          ),
          Positioned(
              top: 350, // To take AppBar Size only
              left: 0.0,
              right: 0.0,
              child: button(
                  val: "Sign In",
                  onTap: () {
                    Navigator.pushNamed(context, '/signin');
                  })),
          Positioned(
              top: 425, // To take AppBar Size only
              left: 0.0,
              right: 0.0,
              child: button(
                  val: "Sign Up",
                  onTap: () {
                    Navigator.pushNamed(context, '/choose');
                  })),
          Positioned(
              top: 700, // To take AppBar Size only
              left: 130.0,
              right: 0.0,
              child: Text(
                "Sign Up with",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Positioned(
              top: 740, // To take AppBar Size only
              left: 140.0,
              right: 0.0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook),
                    iconSize: 50,
                    color: Colors.blue[800],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                      iconSize: 50,
                      color: Colors.green),
                ],
              )),
        ],
      ),
    );
  }
}
