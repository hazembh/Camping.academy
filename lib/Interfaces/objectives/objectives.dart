import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/objectives/mission.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/function_class/gest_detector.dart';

class Story extends StatefulWidget {
  final String image;
  final String image2;
  final double size;
  final Function function;
  final String etoile;
  Story(this.image, this.function, this.image2, this.size,this.etoile);
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 25),
              GestureDetector(
                onTap: () {
                  widget.function();
                }, // handle your image tap here
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover, // this is the solution for border
                  width: 150.0,
                  height: 120.0,
                ),
              )
            ],
          ),
          Image.asset(
            widget.image2,
            width: widget.size,
          )
        ],
      ),
    );
  }
}

class Cont extends StatefulWidget {
  final String image3;
  final String title;
  final String etoile;
  final double size;
  const Cont(this.image3, this.title, this.etoile, this.size);
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
      height: (height - 50) / 3,
      width: width,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.image3,
                  width: 130,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: 
              
              DUMMY_MISSIONS.map((e){
                return Story(e.image, (){Navigator.pushNamed(context, e.routeName);}, e.image2, e.size,e.etoile);
              }).toList()

              /*Story(
                'assets/1.png',
                () {
                  Navigator.pushNamed(context, '/mission11');


                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/2.png',
                () {
                  Navigator.pushNamed(context, '/mission12');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/3.png',
                () {
                  Navigator.pushNamed(context, '/mission13');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/4.png',
                () {
                  Navigator.pushNamed(context, '/mission14');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/5.png',
                () {Navigator.pushNamed(context, '/mission15');},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/6.png',
                () {
                  Navigator.pushNamed(context, '/mission16');

                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/7.png',
                () {
                  Navigator.pushNamed(context, '/mission17');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/8.png',
                () {
                  Navigator.pushNamed(context, '/mission18');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/9.png',
                () {
                  Navigator.pushNamed(context, '/mission19');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/10.png',
                () {
                  Navigator.pushNamed(context, '/mission110');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/11.png',
                () {
                  Navigator.pushNamed(context, '/mission111');
                },
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/12.png',
                () {
                  Navigator.pushNamed(context, '/mission112');
                },
                widget.etoile,
                widget.size,
              ),*/
            ),
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
      Cont('assets/mostakchef.png', 'Explorer Stage', 'assets/1etoile.png', 40),
      Cont('assets/mo8amer.png', 'Adventurer Stage', 'assets/2etoile.png', 70),
      Cont('assets/ra7ala.png', 'Nomadic Stage', 'assets/3etoile.png', 100),
    ]);
  }
}
