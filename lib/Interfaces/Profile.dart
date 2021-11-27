import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFieldProfile.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

enum ImageSourceType { gallery, camera }
class ImageFromGalleryEx extends StatefulWidget {
  final type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
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
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.circular(200),
                ),

                child: _image != null
                    ? Image.file(
                  _image,
                  width: 200.0,
                  height: 100.0,
                  fit: BoxFit.fitHeight,
                )
                    : Container(

                  padding:EdgeInsets.only(top: 100,left: 80),

                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://media.istockphoto.com/vectors/woman-avatar-isolated-on-white-background-vector-illustration-for-vector-id1167753373?k=20&m=1167753373&s=612x612&w=0&h=88d0JshtPmZuJO3ybxNU9P-v-IHadT8PnPDNKdAFxCU=",
                          ),
                          fit: BoxFit.cover,

                      ),
                      borderRadius: new BorderRadius.circular(200),
                  ),
                  width: 100,
                  height: 200,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black54,size: 50,
                  ),
                ),
              ),
            ),
          ),

          MyTextFieldProfile(name: "Kais Kammoun",color: Colors.black,width: 300,),
          Row(
            children: [
              MyTextFieldProfile(name: "21/01/2000",color: Colors.black,width: 205,),
              MyTextFieldProfile(name: "Place",color: Colors.white,width: 205,),
            ],
          ),
          Row(
            children: [
              MyTextFieldProfile(name: "Num Tel father/mother",color: Colors.white,width: 205,),
              MyTextFieldProfile(name: "Num Tel Mobile",color: Colors.white,width: 205,),
            ],
          ),
          MyTextFieldProfile(name: "KaisKammoun@gmail.com",color: Colors.black,width: 300,),
          MyTextFieldProfile(name: "Personal Address",color: Colors.white,width: 500,),
          MyTextFieldProfile(name: "Date of the Scouting Movement",color: Colors.white,width: 500,),
          Row(
            children: [
              MyTextFieldProfile(name: "Region",color: Colors.white,width: 205,),
              MyTextFieldProfile(name: "Group",color: Colors.white,width: 205,),
            ],
          ),
          Row(
            children: [
              MyTextFieldProfile(name: "Squad",color: Colors.white,width: 205,),
              MyTextFieldProfile(name: "vanguard",color: Colors.white,width: 205,),
            ],
          ),
          MyTextFieldProfile(name: "The current scouting plan of the squad",color: Colors.white,width: 500,),
          MyTextFieldProfile(name: "Date of joining the camping academy",color: Colors.white,width: 500,),


          SizedBox(height:30),
          button(val: "Update", onTap: (){}),
          SizedBox(height:30),


        ],
      ),
    )
    )
    );
  }
}
