import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocketotaku/widgets/menu_content.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedMenu = 0;

  final List<String> _menuName = [
    'Anime',
    'Manga',
    "Light Novel"
  ];

  // creating menu
  Widget _buildMenu(int i) {
    return GestureDetector(
      // when menu is tapped, then change selectedMenu value to i
      onTap: () {
        setState(() {
          _selectedMenu = i;
        });
      },
      child: Container(
        height: 35.0,
        width: 100.0,
        decoration: BoxDecoration(
          // when menu is selected, then use primary color for container, else grey
          color: _selectedMenu == i ? Theme.of(context).primaryColor : Color(0xFF7F818A),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            _menuName[i],
            style: TextStyle(
              fontSize: 15.0,
              // when menu is selected, then user accent color for text, else white60
              color: _selectedMenu == i ? Theme.of(context).accentColor : Colors.white60,
            ),
          ),
        ),
      ),
    );
  }

  // menu content
  Widget _content() {
    if (_selectedMenu == 0) {
      return AnimeLibrary();
    } else if (_selectedMenu == 1) {
      return MangaLibrary(gridCount: 3);
    } else {
      return LightNovelLibrary();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Welcome, User!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(FontAwesomeIcons.userCircle),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _menuName.asMap().entries.map(
                  (MapEntry map) => _buildMenu(map.key)
              ).toList(),
            ),
            Container(
              height: 10.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.0, color: Theme.of(context).primaryColor)
                )
              ),
            ),
            _content()
          ],
        ),
      ),
    );
  }
}