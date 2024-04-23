import 'dart:async';

import 'package:flutter/material.dart';
import 'package:small_app/screens/welcomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomePage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/bg1.png'),
        ),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:80 , bottom: 30),
            child: Center(
              child: Text(
                "Note App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            "Make your goals happen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            "Loading...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    ));
  }
}
