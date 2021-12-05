import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/FirstInterface.dart';
import 'package:flutter_application_1/Interfaces/objectives/mission.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/function_class/googlesignin.dart';
import 'package:flutter_application_1/home.dart';
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
import 'package:provider/provider.dart';
import 'Interfaces/Menu/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List availablMission = DUMMY_MISSIONS;
  @override
  Widget build(BuildContext context)
    => ChangeNotifierProvider( create: (context)=>GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: Home(),
        initialRoute: '/',
        routes: {
          //'/': (context) => const FirstInterface(),
          '/choose': (context) => const Choose(),
          '/signin': (context) => const SignIn(),
          '/signup_member': (context) => SignUpmember(),
          '/signup_admin': (context) => const SignUpAdmin(),
          '/navigation': (context) => Navigationbar(),
          '/logout': (context) => SignIn(),
          '/mission11': (context) => Mission('Roaming badge','assets/1.png','assets/1etoile.png',['Prepares a list of the equipment necessary to carry out a cell output.', 'Prepares a report on a trip or a trip to another city is prepared with pictures.', 'Participates in a cellular trip in which he travels at least 4 km on foot.', 'Prepares a special notebook for scouting trips and camps.']),
          '/mission12': (context) => Mission('Observer badge','assets/2.png','assets/1etoile.png',['He submits a written report on his activity includes a full description of the people involved.', 'Describes the camping location accurately.', 'A memory exercise that reviews 24 of the 30 things presented in front of it for one minute.', 'You can distinguish 8 different sounds out of the 10 sounds he listens to.']),
          '/mission13': (context) => Mission('Eco badge','assets/3.png','assets/1etoile.png',['Researches the meaning of nature conservation.', 'It is a record that includes pictures and descriptions of each other animals and plants in their natural surroundings.', 'Some of the waste is used to make useful things.', 'Participate in the campaign of trees and planting plants.']),
          '/mission14': (context) => Mission('Paramedic badge','assets/4.png','assets/1etoile.png',['Prepares a research on the importance of first aid in a scouting trip.', 'Makes a list of the essential contents of the Vanguard First Aid kit And a personal first aid kit.', 'First aid methods for bruises or scrapes.', 'First aid methods for a person exposed to a fever, animal bite, or poisonous insect bite.']),

        },
      ),
    );

}
