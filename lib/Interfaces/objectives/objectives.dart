import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/objectives/mission.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/function_class/gest_detector.dart';
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class Story extends StatefulWidget {
  final String image;
  final String image2;
  final double size;
  late var missiondata;
  final int id;
  Story(this.image, this.missiondata, this.image2, this.size, this.id);
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Hero(
      tag: TranslationWidget(
        text: "mission",
        fromLanguage: globals.fromLanguage,
        toLanguage: globals.toLanguage,
        builder: (translated) => Text(translated!),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 25),
                  Container(
                    width: width / 3,
                    height: height / 7.6,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover, // this is the solution for border
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                widget.image2,
                width: widget.size,
              )
            ],
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () async {
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return new Mission(
                            widget.missiondata['badge'],
                            widget.image,
                            widget.image2,
                            widget.missiondata['obj'][widget.id]);
                      },
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cont extends StatefulWidget {
  final String image3;
  final String title;
  final String etoile;
  final double taille;
  final int id;

  Cont(this.image3, this.title, this.etoile, this.taille, this.id);
  @override
  _ContState createState() => _ContState();
}

class _ContState extends State<Cont> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black.withOpacity(0.1),
      height: (height - 73) / 3,
      width: width,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.image3,
                  width: height / 5.7,
                ),
                TranslationWidget(
                    text: widget.title,
                    fromLanguage: globals.fromLanguage,
                    toLanguage: globals.toLanguage,
                    builder: (translated) => Text(
                          translated!,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: DUMMY_MISSIONS.map((e) {
              return Story(e.image, e.missiondata, widget.etoile, widget.taille,
                  widget.id);
            }).toList()),
          ),
        ],
      ),
    );
  }
}

class Objective extends StatefulWidget {
  const Objective({Key? key}) : super(key: key);
  @override
  _ObjectiveState createState() => _ObjectiveState();
}

class _ObjectiveState extends State<Objective> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      Cont('assets/mostakchef.png', 'Explorer Stage', 'assets/1etoile.png', 40,
          0),
      Cont('assets/mo8amer.png', 'Adventurer Stage', 'assets/2etoile.png', 70,
          1),
      Cont('assets/ra7ala.png', 'Nomadic Stage', 'assets/3etoile.png', 100, 2),
    ]);
  }
}
