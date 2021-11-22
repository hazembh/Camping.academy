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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/signupmemberback.png",fit: BoxFit.cover,),
            MyTextField(name: "Full name", obscure: false,icon: Icons.supervised_user_circle_rounded),
            MyTextField(name: "Birthday", obscure: false,icon: Icons.date_range),
            MyTextField(name: "Email", obscure: true,icon: Icons.email),
            MyTextField(name: "Password", obscure: false,icon: Icons.lock),
            button(val: "Register", onTap: (){})
          ],
        ),
        
      ),








    );
  }
}
