import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/Model/history.dart';
import 'package:flutter_ayo_zakat/Pages/home_page.dart';
import 'package:flutter_ayo_zakat/Provider/history_provider.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) => HistoryProvider.fetchAll(),
          initialData: List<History>(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         StreamProvider(
//           create: (context) => HistoryProvider.fetchAll(),
//           initialData: List<History>(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Center(
//           child: SplashScreen(
//             seconds: 4,
//             navigateAfterSeconds: HomePage(),
//             image: Image.asset('assets/images/logo-ayo-zakat.png'),
//             photoSize: 100,
//             loadingText: Text('Copyright \u00a9 2021 Ayo Zakat'),
//             loaderColor: Colors.transparent,
//             backgroundColor: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
