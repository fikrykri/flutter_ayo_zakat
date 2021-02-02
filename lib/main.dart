import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: HomePage(),
          image: Image.asset('assets/images/logo-ayo-zakat.png'),
          photoSize: 100,
          loadingText: Text('Copyright \u00a9 2021 Ayo Zakat'),
          loaderColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
