import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/teamdef.dart';

class Membrescouts extends StatefulWidget {
  const Membrescouts({Key? key}) : super(key: key);

  @override
  _MembrescoutsState createState() => _MembrescoutsState();
}

class _MembrescoutsState extends State<Membrescouts> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        SingleChildScrollView(
            child: Stack(
              children: <Widget>[

                Container(

                  height: 270,
                  decoration: BoxDecoration(
                      color:Color.fromRGBO(126, 112, 39, 0.8),
                      borderRadius: BorderRadius.vertical(bottom:Radius.circular(40))
                  ),

                ),   // Required some widget in between to float AppBar

                Positioned(
                  top: -28,// To take AppBar Size only
                  left: 0.0,

                  right: 0.0,
                  child:
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(bottom:Radius.circular(40)),
                      child: Image.asset('assets/team.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 170,// To take AppBar Size only
                  left: 100.0,

                  right: 0.0,
                  child:
                  Container(
                      child: Text("Camping Academy",style: TextStyle(fontSize: 30,color: Colors.black),)
                ),
                ),
                Positioned(
                  top: 220,// To take AppBar Size only
                  left: 40.0,

                  right: 0.0,
                    child:GestureDetector(
                    onTap: () { print("Container was tapped"); },

                  child:
                  Container(
                      child: Text("Team",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),)
                  )
                  )
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 280,
                    ),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),
                    Teamdef(path: 'assets/kais.jpg', name: "kais kammoun", post: "leader"),

                  ],
                )

              ],
            ),

          ),


      );

  }

}

