import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ayo_zakat/components/Strings.dart';

import '../animation/animation.dart';

class ViewPageDonasi extends StatelessWidget {
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
                          'assets/images/dashboard3.png',
                        )),
                  ),
                )),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
                          // MyAnimation(
                          //   1.3,
                          //   Text(
                          //     'Zakat Maal',
                          //     style: TextStyle(
                          //         color: Color.fromRGBO(97, 90, 90, .54),
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          MyAnimation(
                            1.3,
                            Text(
                              "Donasi",
                              style: TextStyle(
                                  color: Color.fromRGBO(97, 90, 90, 1),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyAnimation(
                            1.4,
                            Text(
                              Strings.cardDescDonasi,
                              style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 0.54),
                                height: 1.4,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // Row(
                          //   children: <Widget>[
                          //     MyAnimation(
                          //         1.2,
                          //         Container(
                          //           width: 40,
                          //           height: 40,
                          //           padding: EdgeInsets.all(2),
                          //           decoration: BoxDecoration(
                          //               border: Border.all(
                          //                   width: 3, color: Colors.red),
                          //               shape: BoxShape.circle,
                          //               color: Colors.white),
                          //           child: Container(
                          //             width: 30,
                          //             height: 30,
                          //             decoration: BoxDecoration(
                          //                 shape: BoxShape.circle,
                          //                 color: Colors.black),
                          //           ),
                          //         )),
                          //     MyAnimation(
                          //         1.3,
                          //         Container(
                          //           width: 25,
                          //           height: 25,
                          //           margin:
                          //               EdgeInsets.symmetric(horizontal: 20),
                          //           decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               color: Color.fromRGBO(251, 53, 105, 1)),
                          //         )),
                          //     MyAnimation(
                          //         1.3,
                          //         Container(
                          //           width: 25,
                          //           height: 25,
                          //           decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               color: Color.fromRGBO(81, 234, 234, 1)),
                          //         ))
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 50,
                          // ),
                          // MyAnimation(
                          //   1.2,
                          //   Text(
                          //     'More option',
                          //     style: TextStyle(
                          //         color: Color.fromRGBO(97, 90, 90, .54),
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Container(
                          //   height: 80,
                          //   child: ListView(
                          //     scrollDirection: Axis.horizontal,
                          //     children: <Widget>[
                          //       MyAnimation(
                          //           1.3,
                          //           AspectRatio(
                          //             aspectRatio: 3.2 / 1,
                          //             child: Container(
                          //               padding: EdgeInsets.all(13),
                          //               decoration: BoxDecoration(
                          //                   border: Border.all(
                          //                       color: Colors.grey[300]),
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(15))),
                          //               child: Row(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.center,
                          //                 children: <Widget>[
                          //                   Container(
                          //                     width: 56,
                          //                     padding: EdgeInsets.all(10),
                          //                     decoration: BoxDecoration(
                          //                         borderRadius:
                          //                             BorderRadius.all(
                          //                                 Radius.circular(10)),
                          //                         color: Color.fromRGBO(
                          //                             251, 53, 105, 1)),
                          //                     child: Image.asset(
                          //                         'assets/images/intro3.png'),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 10,
                          //                   ),
                          //                   Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.center,
                          //                     children: <Widget>[
                          //                       Text(
                          //                         'Ankle Length Socks',
                          //                         style: TextStyle(
                          //                             color: Color.fromRGBO(
                          //                                 97, 90, 90, 1),
                          //                             fontWeight:
                          //                                 FontWeight.bold),
                          //                       ),
                          //                       SizedBox(
                          //                         height: 2,
                          //                       ),
                          //                       Text(
                          //                         '23,345',
                          //                         style: TextStyle(
                          //                             color: Color.fromRGBO(
                          //                                 97, 90, 90, .7),
                          //                             fontSize: 13),
                          //                       )
                          //                     ],
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           )),
                          //       MyAnimation(
                          //           1.4,
                          //           AspectRatio(
                          //             aspectRatio: 3.2 / 1,
                          //             child: Container(
                          //               margin: EdgeInsets.only(left: 20),
                          //               padding: EdgeInsets.all(13),
                          //               decoration: BoxDecoration(
                          //                   border: Border.all(
                          //                       color: Colors.grey[300]),
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(15))),
                          //               child: Row(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.center,
                          //                 children: <Widget>[
                          //                   Container(
                          //                     width: 56,
                          //                     padding: EdgeInsets.all(10),
                          //                     decoration: BoxDecoration(
                          //                         borderRadius:
                          //                             BorderRadius.all(
                          //                                 Radius.circular(10)),
                          //                         color: Color.fromRGBO(
                          //                             81, 234, 234, 1)),
                          //                     child: Image.asset(
                          //                         'assets/images/intro3.png'),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 10,
                          //                   ),
                          //                   Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.center,
                          //                     children: <Widget>[
                          //                       Text(
                          //                         'Quarter Length Socks',
                          //                         style: TextStyle(
                          //                             color: Color.fromRGBO(
                          //                                 97, 90, 90, 1),
                          //                             fontWeight:
                          //                                 FontWeight.bold),
                          //                       ),
                          //                       SizedBox(
                          //                         height: 2,
                          //                       ),
                          //                       Text(
                          //                         '23,345',
                          //                         style: TextStyle(
                          //                             color: Color.fromRGBO(
                          //                                 97, 90, 90, .7),
                          //                             fontSize: 13),
                          //                       )
                          //                     ],
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           )),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 50,
                          // ),
                          MyAnimation(
                              1.5,
                              Container(
                                height: 60,
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300],
                                          blurRadius: 10,
                                          offset: Offset(0, 10))
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(81, 223, 234, 1),
                                      Color.fromRGBO(203, 251, 255, 1)
                                    ])),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Text(
                                          'Rp. ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                    Text(
                                      'Donasi',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ))))),
        ],
      ),
    );
  }
}
