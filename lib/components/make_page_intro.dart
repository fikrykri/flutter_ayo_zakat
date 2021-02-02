import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/components/ColorsSys.dart';

Widget makePage({image, title, content, reverse = false}) {
  return Container(
    padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        !reverse
            ? Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(image),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
            : SizedBox(),
        Text(
          title,
          style: TextStyle(
              color: ColorSys.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorSys.gray, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        reverse
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(image),
                  ),
                ],
              )
            : SizedBox(),
      ],
    ),
  );
}
