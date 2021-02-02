import 'package:flutter/material.dart';

Widget makeCard(
    {context, startColor, endColor, image, text, textTapMe, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [startColor, endColor],
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[350],
                  blurRadius: 10,
                  offset: Offset(5, 10))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 50, left: 50),
              child: Center(
                child: Image.asset(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(textTapMe,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
            ),
          ],
        ),
      ),
    ),
  );
}
