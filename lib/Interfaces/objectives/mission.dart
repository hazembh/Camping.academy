import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
class Mission extends StatefulWidget {
  const Mission({Key? key}) : super(key: key);

  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  @override
  Widget build(BuildContext context) {
    final double width =MediaQuery.of(context).size.width;
    final double height =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        //centerTitle: true,
        title:
        Text("Paramedic badge",style: TextStyle(fontSize: 28,color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,size: 40,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Column(
            children: [
              SizedBox(height: 20,),
              Image.asset('assets/4.png',width: 70,),
              Image.asset('assets/1etoile.png',width: 30,),

            ],
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 20,left: 40,right: 40),
                child: Text("The candidate shall have the following requi rements to obtain the Bronze Star",style: TextStyle(
                  fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red
                ),
                  textAlign: TextAlign.justify,
              )
              ),
              SizedBox(height: 20,),
              Container(
                width: width-100/2,
                height: (height-250)/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0)), //
                    color: Colors.white,
                    border: Border.all(color: Colors.black,),


                ),
                child: Column(
              children: [
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ), //SizedBox
                  Container(
                    width:width-250/2,
                    child: Text(
                      'Prepares research on Scout first aid',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text

                  Checkbox(value: true, onChanged: (bool? value) {  },
                 

                  ),

                ],
              ),
                /*Row(
                  children:<Widget> [
                    MyTextField(icon:Icons.menu, name: 'Squad leader', obscure: true,),
                    MyTextField(icon:Icons.menu, name: 'Squad leader', obscure: true,)


                  ],
                ),*/
            ],
          ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
