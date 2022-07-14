import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pocketotaku/screens/intro_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Otaku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFEF7369),
        accentColor: const Color(0xFFFCD7DF),
        scaffoldBackgroundColor: const Color(0xFFFFF6F9),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF7369))
          ),
        ),
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        nextScreen: IntroScreen(),
        splash: const Text(
          'Pocket Otaku',
          style: TextStyle(
            color: Color(0xFFEF7369),
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: const Color(0xFFFFF6F9),
      ),
    );
  }
}
