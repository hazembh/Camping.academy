import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';

class SignUpmember extends StatefulWidget {
  const SignUpmember({Key? key}) : super(key: key);

  @override
  _SignUpmemberState createState() => _SignUpmemberState();
}
class _SignUpmemberState extends State<SignUpmember> {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(


              child:Column(

                children: [
                  Stack(
                    children: [
                      Image.asset('assets/back1.png',fit: BoxFit.cover,
                        width: double.infinity,),
                      Positioned(
                        top: 35,
                        child:  IconButton(

                        icon: const Icon(Icons.arrow_back_sharp,size: 40,color: Colors.white,),

                        onPressed: () {

                        },
                      ),)
                    ],

                  ),



                  MyTextField(name: "Full name", obscure: false,icon: Icons.supervised_user_circle_rounded),
                  MyTextField(name: "Birthday", obscure: false,icon: Icons.date_range),
                  MyTextField(name: "Email", obscure: false,icon: Icons.email),
                  MyTextField(name: "Password", obscure: true,icon: Icons.lock),
                  SizedBox(height: 20,),
                  button(val: "register", onTap: (){}),
                  SizedBox(height: 20,),
                ],
              ),
            )


          ],

        ),

        
      ),








    );
  }
}