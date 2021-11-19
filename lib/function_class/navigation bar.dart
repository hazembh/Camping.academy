import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Navigationbar extends StatefulWidget {
  const Navigationbar({Key? key}) : super(key: key);
  @override
  _NavigationbarState createState() => _NavigationbarState();
}
class _NavigationbarState extends State<Navigationbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          color: Colors.black,
          backgroundColor: Colors.white,
          activeColor:Colors.blue ,
          cornerRadius:30,
          items: [
            TabItem(icon: Icons.menu, title: 'Menu'),
            TabItem(icon: Icons.settings, title: 'Settings'),
            TabItem(icon: Icons.supervised_user_circle, title: 'User'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.check, title: 'Objectives'),
          ],
          onTap: (int i) => print('click index=$i'),
        )

    );
  }
}
