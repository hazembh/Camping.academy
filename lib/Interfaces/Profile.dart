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
import 'package:flutter_application_1/widget/translation_widget.dart';
import 'package:flutter_application_1/globals.dart' as globals;

class Profile extends StatefulWidget {
  late String places = 'Place';
  late String birthday = 'Birthday';
  late String telparent = 'Home Tel';
  late String tel = 'Tel';
  late String adress = 'Home adress';
  late String Dateofscoot = 'Date of scoot Movement ';
  late String region = 'Region';
  late String group = 'Group';
  late String squad = 'Squad';
  late String vanguard = 'vanguard';
  late String The_current_scouting_plan_of_the_squad =
      'The current scouting plan of the squad';
  late String Date_of_joining_the_camping_academy =
      'Date of joining the camping academy';
  //late String image;

  Profile({
    required this.places,
    required this.birthday,
    required this.telparent,
    required this.tel,
    required this.adress,
    required this.Dateofscoot,
    required this.region,
    required this.group,
    required this.squad,
    required this.vanguard,
    required this.The_current_scouting_plan_of_the_squad,
    required this.Date_of_joining_the_camping_academy,
  });

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
  late String imgUrl;
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
          .doc(user.uid.toString())
          .get();
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
          "squad": squad.text.trim(),
          'image': imgUrl,
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
          "squad": squad.text.trim(),
          'image': imgUrl,
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
    if ((!RegExp(
            r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
        .hasMatch(birthday.text))) {
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
    if (place.text.trim().isEmpty || place.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter the place !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (birthday.text.trim().isEmpty || birthday.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Home Tel !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (tel.text.trim().isEmpty || tel.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Telephone !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (adress.text.trim().isEmpty || adress.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your adress !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (Dateofscoot.text.trim().isEmpty || Dateofscoot.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Date of scoot mouvement !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (region.text.trim().isEmpty || region.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Region !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (group.text.trim().isEmpty || group.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your group !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (squad.text.trim().isEmpty || squad.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your squad !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (vanguard.text.trim().isEmpty || vanguard.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your vanguard !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (plan.text.trim().isEmpty || plan.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your plan !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (dateofjoining.text.trim().isEmpty ||
        dateofjoining.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your date of joining scoot !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    } else {
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
                      title: new TranslationWidget(
                        text: "Photo Library",
                        fromLanguage: globals.fromLanguage,
                        toLanguage: globals.toLanguage,
                        builder: (translated) => Text(translated!),
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new TranslationWidget(
                      text: "Camera",
                      fromLanguage: globals.fromLanguage,
                      toLanguage: globals.toLanguage,
                      builder: (translated) => Text(translated!),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
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
            onTap: () => _showPicker,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 100,
                  //backgroundColor: Color(0xffFDCF09),
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
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
                name: widget.birthday,
                color: Colors.white,
                width: 205,
                controller: birthday,
              ),
              MyTextFieldProfile(
                name: widget.places,
                color: Colors.white,
                width: 205,
                controller: place,
              ),
            ],
          ),
          Row(
            children: [
              MyTextFieldProfile(
                name: widget.telparent,
                color: Colors.white,
                width: 205,
                controller: Telparent,
              ),
              MyTextFieldProfile(
                name: widget.tel,
                color: Colors.white,
                width: 205,
                controller: tel,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 40, right: 30, top: 15),
            width: 300,
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.orange),
                ),
                hintText: user!.email!,
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          MyTextFieldProfile(
            name: widget.adress,
            color: Colors.white,
            width: 500,
            controller: adress,
          ),
          MyTextFieldProfile(
              name: widget.Dateofscoot,
              color: Colors.white,
              width: 500,
              controller: Dateofscoot),
          Row(
            children: [
              MyTextFieldProfile(
                  name: widget.region,
                  color: Colors.white,
                  width: 205,
                  controller: region),
              MyTextFieldProfile(
                  name: widget.group,
                  color: Colors.white,
                  width: 205,
                  controller: group),
            ],
          ),
          Row(
            children: [
              MyTextFieldProfile(
                name: widget.squad,
                color: Colors.white,
                width: 205,
                controller: squad,
              ),
              MyTextFieldProfile(
                name: widget.vanguard,
                color: Colors.white,
                width: 205,
                controller: vanguard,
              ),
            ],
          ),
          MyTextFieldProfile(
            name: widget.The_current_scouting_plan_of_the_squad,
            color: Colors.white,
            width: 500,
            controller: plan,
          ),
          MyTextFieldProfile(
            name: widget.Date_of_joining_the_camping_academy,
            color: Colors.white,
            width: 500,
            controller: dateofjoining,
          ),
          SizedBox(height: 30),
          button(
              val: "Update",
              onTap: () {
                validation();
              }),
          SizedBox(height: 30),
        ],
      ),
    )));
  }
}
