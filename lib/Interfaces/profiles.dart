import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Profile.dart';


class Profiles extends StatefulWidget {


  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  late String place='';
  //late String age;
  //late String userName;

  _fetch() async {
    final user =  FirebaseAuth.instance.currentUser;
    final id = user!.uid;
    if (user!=null){
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(id)
          .get()
          .then((value){
        place = value.data()!['place'];
       // userName = value.data()['username'];
        //age = value.data()['age'];

        //print(email);
      }).catchError((e){
        print(e);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot){
            if (snapshot.connectionState != ConnectionState.done){
              return Text('data');
            }else{
              return Profile(places:place);
            }
          }
      ),
    );
  }
}