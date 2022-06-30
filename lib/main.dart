import 'package:flutter/material.dart';
import 'package:pocketotaku/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Otaku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEF7369),
        accentColor: Color(0xFFFCD7DF),
        scaffoldBackgroundColor: Color(0xFFFFF6F9),
      ),
      home: HomeScreen(),
    );
  }
}
