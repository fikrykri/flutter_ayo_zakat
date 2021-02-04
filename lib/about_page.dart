import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ayo_zakat/components/Strings.dart';
import 'package:flutter_ayo_zakat/dashboard.dart';
import 'animation/animation.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height / 3,
            child: MyAnimation(
                1.2,
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          colors: [
                        Color.fromRGBO(203, 251, 255, 1),
                        Color.fromRGBO(81, 223, 234, 1)
                      ])),
                  child: Transform.translate(
                    offset: Offset(30, -30),
                    child: MyAnimation(
                        1.3,
                        Image.asset(
                          'assets/images/logo-ayo-zakat.png',
                        )),
                  ),
                )),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height / 1.4,
              child: MyAnimation(
                  1.2,
                  Container(
                      padding: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          MyAnimation(
                            1.3,
                            Center(
                              child: Text(
                                "ABOUT US",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyAnimation(
                            1.4,
                            Text(
                              Strings.aboutDesc,
                              style: TextStyle(
                                color: Colors.black,
                                height: 1.4,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyAnimation(
                            1.4,
                            Text(
                              Strings.about2Desc,
                              style: TextStyle(
                                color: Colors.black,
                                height: 1.4,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Column(
                              children: [
                                MyAnimation(
                                  1.5,
                                  Text(
                                    "AyoZakat version 1.0",
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1.4,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                MyAnimation(
                                  1.5,
                                  Text(
                                    "Term of Use and Privacy Policy",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      height: 1.4,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                MyAnimation(
                                  1.5,
                                  Text(
                                    "Copyright \u00a9 2021 Ayo Zakat",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      height: 1.4,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))))),
        ],
      ),
    );
  }
}
