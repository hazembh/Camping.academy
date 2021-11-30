import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/FirstInterface.dart';
import 'package:flutter_application_1/Interfaces/objectives/mission.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_application_1/Interfaces/Menu/membre_scout.dart';
import 'package:flutter_application_1/Interfaces/choose.dart';
import 'package:flutter_application_1/Interfaces/signIn.dart';
import 'package:flutter_application_1/Interfaces/signUp_Admin.dart';
import 'package:flutter_application_1/Interfaces/signUp_member.dart';
import 'package:flutter_application_1/Interfaces/testsouvenirs.dart';
import 'package:flutter_application_1/testWeather.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/navigation%20bar.dart';
import 'Interfaces/Menu/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (index, sncpshot) {
              if (sncpshot.hasData) {
                return Navigationbar();
              }
              return Navigationbar();
            }
    ),

        /*AnimatedSplashScreen(
                  duration: 3000,
                  splashIconSize: 200,
                  splash: Image.asset('assets/logo.png',),
                  nextScreen: Navigationbar(),
                  splashTransition: SplashTransition.scaleTransition,
              ),*/


      /*home: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 200,
        splash: Image.asset(
          'assets/logo.png',
        ),
        nextScreen: FirstInterface(),
        /*Mission('Roaming Badge', 'assets/1.png', 'assets/1etoile.png', [
          'Prepares a list of the equipment necessary to perform a cellular output',
          'Prepares report on a trip or a trip to another city is prepared with pictures',
          'Participates in a cellular trip in which he travels at least 4 km on foot',
          'Prepares a special notebook for scouting trips and camps'
        ]),*/
        splashTransition: SplashTransition.scaleTransition,
      ),*/
      initialRoute: '/',
      routes: {
        //'/': (context) => const FirstInterface(),
        '/choose': (context) => const Choose(),
        //'/signin': (context) => const SignIn(),
        '/signup_member': (context) => SignUpmember(),
        //'/signup_admin': (context) => const SignUpAdmin(),
        '/navigation': (context) => Navigationbar(),
        //'/logout': (context) => SignIn(),
      },
    );
  }
}
