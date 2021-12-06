import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/testeventor.dart';
import 'package:flutter_application_1/Interfaces/testsouvenirs.dart';
import 'package:flutter_application_1/function_class/FieldTextMission.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:flutter_application_1/function_class/eventtextfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import'dart:io';

import 'Menu/menu.dart';

class EventOur extends StatefulWidget {
  const EventOur({Key? key}) : super(key: key);

  @override
  _EventOurState createState() => _EventOurState();
}

class _EventOurState extends State<EventOur> {
  late UserCredential userCredential;
TextEditingController title = TextEditingController();
TextEditingController Date = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController image = TextEditingController();
GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
bool loading = false;
late File images;
late String imgUrl;

sendData() async {
  bool hasException = false;
  try {
    var storageimage = FirebaseStorage.instance.ref().child(images.path);
    var task= await storageimage.putFile(images);
    imgUrl =await (await task).ref.getDownloadURL();
    await FirebaseFirestore.instance.collection('Events').add({
      'title': title.text.trim(),
      'Date': Date.text.trim(),
      'description': description.text.trim(),
      'image':imgUrl,

    });
  } catch (e) {
    hasException = true;

  } finally {
    if (!hasException) {
      setState(() {
        loading = false;
      });

      Navigator.pop(context);

    } else {
      setState(() {
        loading = false;
      });
    }
  }
}

void validation() {
  if (title.text.trim().isEmpty || title.text.trim() == null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey[200],
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please Enter The Title!',
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
          ],
        )));
    return;
  }
  if (Date.text.trim().isEmpty || Date.text.trim() == null)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey[200],
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please enter the date',
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
          ],
        )));

    return;
  }
  if (description.text.trim().isEmpty || description.text.trim() == null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey[200],
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' Please Enter your Description !',
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
          ],
        )));

    return;
  } else {
    setState(() {
      loading = true;
      Text("Please few seconds");
    });
    sendData();
  }
}

 Future getImage() async {
  var img = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  setState(() {

      images= File(img!.path);

  });

 }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final user = FirebaseAuth.instance.currentUser;
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('Events');




    return Scaffold(
      body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
            children: [ ListTile(
              tileColor: Colors.white70,
              //toolbarHeight: 50,
              //elevation: 3.0,
              leading: Icon(Icons.event_note_rounded,
                  color: Colors.indigo[900], size: 30),
              title: Text('Events',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.indigo[900],
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.indigo[800],
                  ),
                ),
              ),
            )
              , Expanded(
                child: StreamBuilder(
                    stream: collectionReference.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          children: snapshot.data!.docs.map((e) =>
                              Testeventor(
                                title: e['title'],
                                date: e['Date'],
                                image: e['image'],
                                description: e['description'],
                              )
                          ).toList(),

                        );
                      }
                      return Center(child: CircularProgressIndicator(),);
                    }

                ),
              ),
            ]
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                SimpleDialog(
                  title: Row(
                    children: [
                      const Text('Add Events '),
                      SizedBox(width: width/3.5,),
                      IconButton(onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                            allowMultiple: true);
                        if (result == null) return;
                        //OpenFiles(result.files);
                        final file = result.files.first;
                        openFile(file);
                        print('Name: ${file.name}');
                        print('Bytes: ${file.bytes}');
                        print('Size: ${file.size}');
                        print('Extension: ${file.extension}');
                        print('Path: ${file.path}');
                         //final newFile = await saveFilePermently(file);
                        print('From Path: ${file.path}');
                        // print('To Path: ${newFile.path}');

                      }, icon: Icon(Icons.download_rounded), iconSize: 30,color: Color(0xff03dac6),),
                    ],
                  ),

                  children: <Widget>[
                    ListTile(
                      title:EventTextField(name: 'Title',icon: Icons.event,controller: title,size:1)
                    ),
                    ListTile(
                        title:EventTextField(name: 'Date : Month,Day Year',icon: Icons.date_range,controller: Date,size: 1,)
                    ),
                    ListTile(
                        title:EventTextField(name: 'Descriptions about the event ...........',icon: Icons.description,controller: description,size:5)
                    ),
                    /*ListTile(
                        title:EventTextField(name: 'image',icon: Icons.description,controller: image,size: 1,)
                    ),*/
                    ListTile(
                      title: InkWell(
                        onTap: ()=>getImage(),
                        child: CircleAvatar(
                          radius: 100,
                          //width:MediaQuery.of(context).size.width-;
                          //backgroundImage:  FileImage(images),
                        ),
                      )
                    ),
                    SizedBox(height:20),
                    loading
                        ? CircularProgressIndicator(color: Colors.black)
                        : button(
                        val: "Submit",
                        onTap: () async {
                          validation();
                        }),
                  ],
                ),
          );
        },
        icon: Icon(Icons.add),
        label: Text('ADD'),
      ),
    );
  }
  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

}
