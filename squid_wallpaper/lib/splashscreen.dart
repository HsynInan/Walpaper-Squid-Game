import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> image = [
    'assets/splash/1.jpg',
    'assets/splash/2.jpg',
    'assets/splash/3.jpg',
    'assets/splash/4.jpg',
    'assets/splash/5.jpg',
    'assets/splash/6.jpg',
    'assets/splash/7.jpg',
    'assets/splash/8.jpg',
    'assets/splash/12.jpg',
    'assets/splash/10.png',
    'assets/splash/11.jpg',
  ];
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  '${image.elementAt(Random().nextInt(image.length))}'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo2.png',
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
