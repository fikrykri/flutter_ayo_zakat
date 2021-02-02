import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/animation/animation.dart';
import 'package:flutter_ayo_zakat/components/make_input_button.dart';
import 'package:flutter_ayo_zakat/firebase_auth.dart';
import 'package:flutter_ayo_zakat/login_page.dart';

import 'landing_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  MyAnimation(
                      1,
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  MyAnimation(
                      1.2,
                      Text(
                        "Buat akun secara gratis!",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    MyAnimation(
                        1.2,
                        makeInput(
                            label: "Email",
                            controller: _emailController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Email tidak boleh kosong!';
                              } else {
                                return null;
                              }
                            })),
                    MyAnimation(
                        1.3,
                        makeInput(
                            label: "Password",
                            obscureText: true,
                            controller: _passController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Password tidak boleh kosong';
                              } else {
                                return null;
                              }
                            })),
                    MyAnimation(
                        1.4,
                        makeInput(
                            label: "Confirm Password",
                            obscureText: true,
                            controller: _confirmPassController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Password tidak boleh kosong';
                              } else if (val != _passController.text) {
                                return 'Password tidak sama!';
                              } else {
                                return null;
                              }
                            })),
                    MyAnimation(
                        1.5,
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
                              if (_formKey.currentState.validate()) {
                                SignInSignUpResult result =
                                    await AuthService.createUser(
                                        email: _emailController.text,
                                        pass: _passController.text);
                                if (result.user != null) {
                                  // Go to profile page
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                } else {
                                  // Show dialog
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Error"),
                                            content: Text(result.message),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("OK"))
                                            ],
                                          ));
                                }
                              }
                            },
                            color: Colors.greenAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                child: MyAnimation(
                    1.6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
