import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreens(),
    );
  }
}

class SplashScreens extends StatelessWidget {
  const SplashScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      image: new Image.asset('assets/lottie/qr.png'),
      gradientBackground: LinearGradient(
        begin: Alignment(0.5, -.5),
        end: Alignment(0.5, 1.0),
        colors: [
           Colors.teal.shade400,
           Colors.teal.shade600,
           Colors.teal.shade800,
           Colors.teal.shade900,
        ],
      ),
      photoSize: 120.0,
      loaderColor: Colors.white,
      navigateAfterSeconds: MyHomePage(),
    );
  }
}


