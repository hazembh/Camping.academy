import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/navigation%20bar.dart';
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color.fromRGBO(239,232,232,1),
        body:
        Column(
        children: [
          SizedBox(height: 50,),
          Row(
            children: [
              SizedBox(width: 50,),
              Text("Menu",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.grey)),
            ],
          ),
          SizedBox(height: 20,),
          Row(

            children: [
              SizedBox(width: 80,),

              ClipOval(
                child: Image.asset('assets/c5.png',width: 60,),

              ),
              SizedBox(width: 20,),
              Text("Kais Kammoun", style: TextStyle(fontSize: 20),)

            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:20.0),
            child:Container(
              height:1.0,
              width:800.0,
              color:Colors.black,),),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 15,),
              Column(
                children: [
                  GestureDetector(
                    onTap: () { print("Container was tapped"); },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 45),
                      width: 185,
                      height: 120,
                      child: Text("Events",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(68, 68, 68, 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () { print("Container was tapped"); },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 25),
                      width: 185,
                      height: 80,
                      child: Text("Advantages",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(68, 68, 68, 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () { print("Container was tapped"); },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal:45,vertical:25),
                      width: 185,
                      height: 80,
                      child: Text("Weather",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(68, 68, 68, 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),


                ],
              ),
              SizedBox(width: 10,)
,              Column(
                children: [
                  GestureDetector(
                    onTap: () { print("Container was tapped"); },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 35),
                      width: 185,
                      height: 100,
                      child: Text("Friends",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(68, 68, 68, 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () { print("Container was tapped"); },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 60,vertical: 25),
                      width: 185,
                      height: 80,
                      child: Text("Team",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(68, 68, 68, 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () { print("Container was tapped"); },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal:30,vertical:35),
                      width: 185,
                      height: 100,
                      child: Text("souvenirs",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(68, 68, 68, 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),


                ],
              )

            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:20.0),
            child:Container(
              height:1.0,
              width:800.0,
              color:Colors.black,),),
          SizedBox(height: 10,),

          GestureDetector(
            onTap: () { print("Container was tapped"); },
            child:Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.logout, size: 50,),
                Text("Logout",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),







              ],
            ),
          )
          ),
          SizedBox(height: 10,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:20.0),
            child:Container(
              height:1.0,
              width:800.0,
              color:Colors.black,),),
          SizedBox(height: 10,),
        ],

      ),


    );
  }
}
