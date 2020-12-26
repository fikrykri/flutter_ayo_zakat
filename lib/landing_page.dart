import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ayo_zakat/animation/animation.dart';
import 'package:flutter_ayo_zakat/firebase_auth.dart';
import 'package:flutter_ayo_zakat/login_page.dart';

class LandingPage extends StatefulWidget {
  final FirebaseUser user;

  LandingPage({this.user});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _uidController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _uidController.text = widget.user.uid;
    _nameController.text = widget.user.displayName ?? "-";
    _emailController.text = widget.user.email;
    _phoneController.text = widget.user.phoneNumber ?? "-";

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyAnimation(
                  1,
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )), // TextStyle // Text

              SizedBox(height: 20),

              MyAnimation(
                  1.2,
                  Text(
                    "Data Profil",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )),

              SizedBox(height: 20),

              MyAnimation(
                  1.3,
                  makeInput(
                      label: "UID",
                      controller: _uidController,
                      readOnly: true)),
              MyAnimation(
                  1.4,
                  makeInput(
                      label: "Nama",
                      controller: _nameController,
                      readOnly: true)),
              MyAnimation(
                  1.5,
                  makeInput(
                      label: "Email",
                      controller: _emailController,
                      readOnly: true)),
              MyAnimation(
                  1.6,
                  makeInput(
                      label: "Phone Number",
                      controller: _phoneController,
                      readOnly: true)),
              MyAnimation(
                  1.7,
                  Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          // sign out
                          AuthService.signOut();

                          // go to login page
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        },
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      )))
            ],
          )),
        ),
      ),
    );
  }

  Widget makeInput({label, controller, readOnly}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
