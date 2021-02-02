import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/animation/animation.dart';
import 'package:flutter_ayo_zakat/components/make_input_button.dart';
import 'package:flutter_ayo_zakat/firebase_auth.dart';
import 'package:flutter_ayo_zakat/introduction.dart';
import 'package:flutter_ayo_zakat/signup_page.dart';

import 'landing_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  MyAnimation(
                      1,
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 20),
                  MyAnimation(
                      1.2,
                      Text(
                        "Masuk Ke Akunmu",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )), // coloumn
                ],
              ), // TextStyle // Text
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          MyAnimation(
                              1.2,
                              makeInput(
                                label: "Email",
                                controller: _emailController,
                              )),
                          MyAnimation(
                              1.3,
                              makeInput(
                                label: "Password",
                                obscureText: true,
                                controller: _passController,
                              )),
                        ],
                      ),
                    ),
                    MyAnimation(
                        1.4,
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
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
                                  height: 59,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      SignInSignUpResult result =
                                          await AuthService.signInWithEmail(
                                              email: _emailController.text,
                                              pass: _passController.text);
                                      if (result.user != null) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    // LandingPage(user: result.user)
                                                    IntroPage()));
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text("Error"),
                                                  content: Text(result.message),
                                                  actions: [
                                                    FlatButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
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
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                child: MyAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          child: Text(
                            " Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
