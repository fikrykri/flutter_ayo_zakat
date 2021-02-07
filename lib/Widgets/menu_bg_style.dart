import 'package:flutter/material.dart';

class MenuBgStyles extends StatelessWidget {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -getSmallDiameter(context) / 3,
          top: -getSmallDiameter(context) / 3,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xfff3e9e)),
          ),
        ),
        Positioned(
          left: -getBigDiameter(context) / 4,
          top: -getBigDiameter(context) / 4,
          child: Container(
            width: getBigDiameter(context),
            height: getBigDiameter(context),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xffb226b2), Color(0xffff4891)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
        Positioned(
          left: -getSmallDiameter(context) / 3,
          bottom: -getSmallDiameter(context) / 3,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xfff3e9e)),
          ),
        ),
        Positioned(
          right: -getBigDiameter(context) / 6,
          bottom: -getBigDiameter(context) / 3,
          child: Container(
            width: getBigDiameter(context),
            height: getBigDiameter(context),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xffb226b2), Color(0xffff4891)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
        ),
      ],
    );
  }
}
