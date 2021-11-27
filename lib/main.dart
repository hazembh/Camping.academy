import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/FirstInterface.dart';
import 'package:flutter_application_1/Interfaces/objectives/mission.dart';
import 'package:page_transition/page_transition.dart';

import 'Interfaces/Menu/menu.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 3000,
            splashIconSize: 200,
            splash: Image.asset('assets/logo.png',),
            nextScreen: Mission(),
            splashTransition: SplashTransition.scaleTransition,
        )
    );
  }
}
