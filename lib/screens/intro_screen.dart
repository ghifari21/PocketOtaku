import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:pocketotaku/screens/login_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> _slides = [];

  @override
  void initState() {
    super.initState();

    _slides.add(
      Slide(
        title: 'Pocket Otaku',
        styleTitle: const TextStyle(
          color: Color(0xFFEF7369),
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
        pathImage: 'assets/images/intros/mascot.png',
        description: 'Pocket Otaku is the world\'s largest anime, manga, and light novel database and community.',
        styleDescription: const TextStyle(
          color: Color(0xFF7F818A),
          fontSize: 18.0
        ),
        backgroundColor: const Color(0xFFFFF6F9),
      )
    );
    _slides.add(
      Slide(
        title: 'What have you watched?',
        styleTitle: const TextStyle(
          color: Colors.white,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
        maxLineTitle: 3,
        pathImage: 'assets/images/intros/list.png',
        description: 'Create your personalized list from tens of thousands of titles on the world’s largest anime, manga, and light novel database.',
        styleDescription: const TextStyle(
          color: Color(0xFFFCD7DF),
          fontSize: 18.0
        ),
        backgroundColor: const Color(0xFF7F818A),
      )
    );
    _slides.add(
      Slide(
        title: 'Need to stay up to date?',
        styleTitle: const TextStyle(
          color: Color(0xFFEF7369),
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
        maxLineTitle: 3,
        pathImage: 'assets/images/intros/track.png',
        description: 'Use your list to organize and track what titles you’ve completed, your current progress, what you plan to watch or read and so much more.',
        styleDescription: const TextStyle(
            color: Color(0xFF7F818A),
            fontSize: 18.0
        ),
        backgroundColor: const Color(0xFFFFF6F9),
      )
    );
    _slides.add(
        Slide(
          title: 'Discover more about the world of otaku now!',
          styleTitle: const TextStyle(
            color: Colors.white,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
          maxLineTitle: 3,
          pathImage: 'assets/images/intros/mascot2.png',
          backgroundColor: const Color(0xFF7F818A),
        )
    );
  }

  ButtonStyle _myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFEF7369)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0xFFFCD7DF)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: _slides,
      skipButtonStyle: _myButtonStyle(),
      renderSkipBtn: const Icon(
        Icons.skip_next,
        color: Color(0xFFFCD7DF),
      ),
      doneButtonStyle: _myButtonStyle(),
      renderDoneBtn: const Icon(
        Icons.done,
        color: Color(0xFFFCD7DF),
      ),
      nextButtonStyle: _myButtonStyle(),
      renderNextBtn: const Icon(
        Icons.navigate_next,
        color: Color(0xFFFCD7DF),
        size: 30.0,
      ),
      colorDot: const Color(0xFFFCD7DF),
      colorActiveDot: const Color(0xFFEF7369),
      autoScroll: true,
      autoScrollInterval: const Duration(seconds: 10),
      curveScroll: Curves.bounceIn,
      onDonePress: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    );
  }
}