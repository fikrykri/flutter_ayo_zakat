import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/dashboard.dart';
import 'package:flutter_ayo_zakat/home_page.dart';
import 'package:flutter_ayo_zakat/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
