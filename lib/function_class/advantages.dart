import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/paneladv.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class Advantages extends StatefulWidget {
  const Advantages({Key? key}) : super(key: key);

  @override
  _AdvantagesState createState() => _AdvantagesState();
}

class _AdvantagesState extends State<Advantages> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TranslationWidget(
              text:
                  "Spiritual side*A direct confrontation between the individual and the miracle of the Creator. He experiences it through nature, to know through it God's ability to create, the beauty of creatures, and the greatness of the Creator.",
              fromLanguage: globals.fromLanguage,
              toLanguage: globals.toLanguage,
              builder: (translated) => Panel(translated!.split('*')[0],
                  translated.split('*')[1], Color.fromRGBO(255, 246, 246, 1)),
            ),
            TranslationWidget(
              text:
                  "Emotional side*Scouts learn to rely more on themselves and thus enhance their self-confidence.",
              fromLanguage: globals.fromLanguage,
              toLanguage: globals.toLanguage,
              builder: (translated) => Panel(translated!.split('*')[0],
                  translated.split('*')[1], Color.fromRGBO(247, 223, 223, 1)),
            ),
            TranslationWidget(
              text:
                  "Physical side*The outdoor life imposes on the Scout activities in the open air, which depend mainly on a strong physical structure full of health and activity, which makes him a healthy person with strength and health.",
              fromLanguage: globals.fromLanguage,
              toLanguage: globals.toLanguage,
              builder: (translated) => Panel(translated!.split('*')[0],
                  translated.split('*')[1], Color.fromRGBO(230, 185, 185, 1)),
            ),
            TranslationWidget(
              text:
                  "Social side*Getting acquainted with external societies and their systems, forming lasting friendships and starting out, in addition to consolidating the foundations of work in the spirit of the group.",
              fromLanguage: globals.fromLanguage,
              toLanguage: globals.toLanguage,
              builder: (translated) => Panel(translated!.split('*')[0],
                  translated.split('*')[1], Color.fromRGBO(210, 142, 142, 1)),
            ),
            TranslationWidget(
              text:
                  "Mental side*Challenge abilities and acquire new skills and knowledge in the application of outdoor life.",
              fromLanguage: globals.fromLanguage,
              toLanguage: globals.toLanguage,
              builder: (translated) => Panel(translated!.split('*')[0],
                  translated.split('*')[1], Color.fromRGBO(190, 102, 102, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
