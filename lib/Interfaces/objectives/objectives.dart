import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Story extends StatefulWidget {
  final String image;
  final String image2;
  final double size;
  final Function function;
  Story(this.image, this.function, this.image2, this.size);
  @override
  _StoryState createState() => _StoryState();
}
class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.function;
        });
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 25),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      //fit: BoxFit.cover,
                    ),
                  ),
                  height: 120,
                  width: 150,
                ),
              ],
            ),
            Image.asset(
              widget.image2,
              width: widget.size,
            )
          ],
        ),
      ),
    );
  }
}
class Cont extends StatefulWidget {
  final String image3;
  final String title;
  final String etoile;
  final double size;
  const Cont(this.image3,this.title,this.etoile,this.size);
  @override
  _ContState createState() => _ContState();
}

class _ContState extends State<Cont> {
  @override
  Widget build(BuildContext context) {
    final double width =MediaQuery.of(context).size.width;
    final double height =MediaQuery.of(context).size.height;
    return  Container(
      color:Colors.black.withOpacity(0.1),
      height: (height-100)/3,
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
                Image.asset(widget.image3,width: 130,),
                Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Story(
                'assets/1.png',
                    () {},
               widget.etoile,
                widget.size,
              ),
              Story(
                'assets/2.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/3.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/4.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/5.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/6.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/7.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/8.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/9.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/10.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/11.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
              Story(
                'assets/12.png',
                    () {},
                widget.etoile,
                widget.size,
              ),
            ]),
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
     Container(height: 50 ,color:Colors.black.withOpacity(0.1),),
      Cont('assets/mostakchef.png', 'Explorer Stage','assets/1etoile.png',40),
      Cont('assets/mo8amer.png', 'Adventurer Stage','assets/2etoile.png',70),
      Cont('assets/ra7ala.png', 'Nomadic Stage','assets/3etoile.png',100),
    ]);
  }
}
