import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/navigation%20bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile"),
    );
  }
}
