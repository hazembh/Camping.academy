import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFieldProfile.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:image_picker/image_picker.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late UserCredential userCredential;
  TextEditingController place = TextEditingController();
  TextEditingController Telparent = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController Dateofscoot = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController group = TextEditingController();
  TextEditingController vanguard = TextEditingController();
  TextEditingController squad = TextEditingController();
  TextEditingController dateofjoining = TextEditingController();
  TextEditingController plan = TextEditingController();
  TextEditingController birthday = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  late File images = File("https://via.placeholder.com/150");
  late String imgUrl ;
  var user = FirebaseAuth.instance.currentUser;
  sendData() async {
    var user = FirebaseAuth.instance.currentUser;
    // bool hasException = false;
    var storageimage = FirebaseStorage.instance.ref().child(images.path);
    var task = await storageimage.putFile(images);
    imgUrl = await (task).ref.getDownloadURL();
    if (user != null) {
      var a = await FirebaseFirestore.instance
          .collection("userData")
          .doc(user.uid.toString()).get();
      if (a.exists) {
        final DocumentReference documentReference = FirebaseFirestore.instance
            .collection("userData")
            .doc(user.uid.toString());
        return await documentReference.update({
          "place": place.text.trim(),
          "Telparent": Telparent.text.trim(),
          "tel": tel.text.trim(),
          "adress": adress.text.trim(),
          "Dateofscoot": Dateofscoot.text.trim(),
          "region": region.text.trim(),
          "group": group.text.trim(),
          "vanguard": vanguard.text.trim(),
          "dateofjoining": dateofjoining.text.trim(),
          "plan": plan.text.trim(),
          "birthday": birthday.text.trim(),
          'image':imgUrl,

        });
      } else {
        final DocumentReference documentReference = FirebaseFirestore.instance
            .collection("userData")
            .doc(user.uid.toString());
        return await documentReference.set({
          "place": place.text.trim(),
          "Telparent": Telparent.text.trim(),
          "tel": tel.text.trim(),
          "adress": adress.text.trim(),
          "Dateofscoot": Dateofscoot.text.trim(),
          "region": region.text.trim(),
          "group": group.text.trim(),
          "vanguard": vanguard.text.trim(),
          "dateofjoining": dateofjoining.text.trim(),
          "plan": plan.text.trim(),
          "birthday": birthday.text.trim(),
          'image':imgUrl,
        });
      }
    }
  }


  void validation() {
    if (birthday.text.trim().isEmpty || birthday.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Birthday !',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if ((!RegExp(r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$").hasMatch(birthday.text)))
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please enter a valid Birthday',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    }
    else {
      return sendData();
    }

  }


  _imgFromCamera() async {
    var img = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      images = File(img!.path);
    });
  }


  _imgFromGallery() async {
    var img = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      images = File(img!.path);
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(222, 237, 249, 1),
                    Color.fromRGBO(169, 116, 116, 1),
                    Color.fromRGBO(129, 143, 141, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),

              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: ()=>_showPicker,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: CircleAvatar(
                          radius: 100,
                         //backgroundColor: Color(0xffFDCF09),
                          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                          child: images != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              images,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                              : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 200,
                            height: 200,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MyTextFieldProfile(
                        name: "Birthday", color: Colors.white, width: 205,controller: birthday,),
                      MyTextFieldProfile(
                        name: "Place", color: Colors.white, width: 205, controller: place,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      MyTextFieldProfile(name: "Num Tel father/mother",
                        color: Colors.white,
                        width: 205,controller: Telparent,),
                      MyTextFieldProfile(
                        name: "Num Tel", color: Colors.white, width: 205,controller: tel),
                    ],
                  ),
                Container(
                  padding: EdgeInsets.only(left: 40,right: 30,top:15),
                  width:300,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1,color: Colors.orange),
                      ),
                      hintText: user!.email!,
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                  MyTextFieldProfile(
                    name: "Personal Address", color: Colors.white, width: 500,controller: adress,),
                  MyTextFieldProfile(name: "Date of the Scouting Movement",
                    color: Colors.white,
                    width: 500,controller: Dateofscoot),
                  Row(
                    children: [
                      MyTextFieldProfile(
                        name: "Region", color: Colors.white, width: 205,controller: region),
                      MyTextFieldProfile(
                        name: "Group", color: Colors.white, width: 205,controller: group),
                    ],
                  ),
                  Row(
                    children: [
                      MyTextFieldProfile(
                        name: "Squad", color: Colors.white, width: 205,controller: squad,),
                      MyTextFieldProfile(
                        name: "vanguard", color: Colors.white, width: 205,controller: vanguard,),
                    ],
                  ),
                  MyTextFieldProfile(
                    name: "The current scouting plan of the squad",
                    color: Colors.white,
                    width: 500,controller: plan,),
                  MyTextFieldProfile(
                    name: "Date of joining the camping academy",
                    color: Colors.white,
                    width: 500,controller: dateofjoining,),

                  SizedBox(height: 30),
                  button(val: "Update", onTap: () {
                    validation();
                  }),
                  SizedBox(height: 30),
                ],

              ),
            )
        )
    );
  }
}
