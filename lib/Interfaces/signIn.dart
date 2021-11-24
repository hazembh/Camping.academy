
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            Image.asset('assets/back2.png',fit: BoxFit.cover,
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

        MyTextField(name: "Email", obscure: false,icon: Icons.email),
                    MyTextField(name: "Password", obscure: true,icon: Icons.lock),
                    SizedBox(height: 20,),
                    button(val: "Sign In", onTap: (){}),
                    SizedBox(height: 20,),





            ],

          ),


        ),








    ]
    )
    )
      );



  }
}
