import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'dart:core';

class SignUpmember extends StatefulWidget {

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpmemberState createState() => _SignUpmemberState();
}
  class _SignUpmemberState extends State<SignUpmember> {
  late UserCredential userCredential;
  TextEditingController fullName = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool loading = false;


  sendData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      loading = true;

      await FirebaseFirestore.instance
          .collection('userData')
          .add({
        'FullName': fullName.text.trim(),
        'email': email.text.trim(),
        //'userid': userCredential.user!.uid,
        'password': password.text.trim(),
      });
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('weak password !!!',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));

      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('The account is already exist ! ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));
      }



    } catch (e) {
      print(e);

      setState(() {
        loading = false;
      });
    }

  }
  void validation() {
    if (fullName.text
        .trim()
        .isEmpty || fullName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Full Name !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    }
    if (birthday.text
        .trim()
        .isEmpty || birthday.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Birthday !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    }
    if (email.text
        .trim()
        .isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter your Email !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("New Notification"),
      ));
      return;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter a valid Email !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("New Notification"),
      ));
    }

    if (password.text
        .trim()
        .isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Please Enter your Password !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    }
    else {
        setState(() {
        loading = false;
      });
      sendData();

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/back1.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        //top: 35,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                  MyTextField(
                      name: "Full name",
                      obscure: false,
                      icon: Icons.supervised_user_circle_rounded,controller: fullName,),
                  MyTextField(
                      name: "Birthday", obscure: false, icon: Icons.date_range,controller: birthday,),
                  MyTextField(name: "Email", obscure: false, icon: Icons.email,controller: email,),
                  MyTextField(
                      name: "Password", obscure: true, icon: Icons.lock,controller: password,),
                  SizedBox(
                    height: 20,
                  ),
                  loading
                      ? CircularProgressIndicator(
                      color:Colors.black

                  ):
                  button(
                      val: "register",
                      onTap: () {
                        validation();
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
