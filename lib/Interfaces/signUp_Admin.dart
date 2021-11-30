/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';

class SignUpAdmin extends StatefulWidget {
  const SignUpAdmin({Key? key}) : super(key: key);

  @override
  _SignUpAdminState createState() => _SignUpAdminState();
}

class _SignUpAdminState extends State<SignUpAdmin> {
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
                      icon: Icons.supervised_user_circle_rounded),
                  MyTextField(
                      name: "ID", obscure: false, icon: Icons.credit_card),
                  MyTextField(name: "Email", obscure: false, icon: Icons.email),
                  MyTextField(
                      name: "Password", obscure: true, icon: Icons.lock),
                  SizedBox(
                    height: 20,
                  ),
                  button(
                      val: "Register",
                      onTap: () {
                        Navigator.pushNamed(context, '/signin');
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
*/