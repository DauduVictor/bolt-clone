import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vbolt/screens/dashboard.dart';

class SplashScreen extends StatefulWidget {

  static const String id = 'splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  /// Function to navigate to the dashboard after 3 seconds
  void _navigate() {
    Timer(const Duration(seconds: 3), ()=> Navigator.pushReplacementNamed(context, Dashboard.id));
  }

  @override
  void initState() {
    super.initState();
    _navigate();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xFF15d277),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 90,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'Bolt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 110,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'OverPass',
                      letterSpacing: -8,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 65.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        '    viko',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
