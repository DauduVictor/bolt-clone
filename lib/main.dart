import 'package:flutter/material.dart';
import 'package:vbolt/practice.dart';
import 'package:vbolt/screens/dashboard.dart';
import 'package:vbolt/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'VBolt',
      debugShowCheckedModeBanner: false,
      initialRoute: Dashboard.id,
      routes: {
        SplashScreen.id:(context) => const SplashScreen(),
        Dashboard.id:(context) => const Dashboard(),
        Practice.id:(context) => const Practice(),
      },
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
