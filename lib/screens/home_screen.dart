import 'package:flutter/material.dart';
import 'package:pocketotaku/models/anime_model.dart';
import 'package:pocketotaku/models/ln_model.dart';
import 'package:pocketotaku/models/manga_model.dart';
import 'package:pocketotaku/screens/detail_screen.dart';
import 'package:pocketotaku/screens/profile_screen.dart';
import 'package:pocketotaku/widgets/menu_content.dart';

class HomeScreen extends StatefulWidget {
  String user;
  String password;

  HomeScreen({required this.user, required this.password});

  @override
  State<HomeScreen> createState() => _HomeScreenState(user: user, password: password);
}

class _HomeScreenState extends State<HomeScreen> {
  String user;
  String password;
  int _selectedMenu = 0;
  final int _currentTab = 0;

  _HomeScreenState({required this.user, required this.password});


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
          color: _selectedMenu == i ? Theme.of(context).primaryColor : const Color(0xFF7F818A),
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
  Widget _content(int size) {
    if (_selectedMenu == 0) {
      return AnimeLibrary(gridCount: size);
    } else if (_selectedMenu == 1) {
      return MangaLibrary(gridCount: size);
    } else {
      return LightNovelLibrary(gridCount: size);
    }
  }

  Widget _body(int size) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Welcome, $user!',
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: ContentSearchDelegate()
                        );
                      },
                      icon: const Icon(Icons.search),
                    )
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
              _content(size),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFFFF6F9),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFEF7369),
          unselectedItemColor: const Color(0xFF7F818A),
          currentIndex: _currentTab,
          onTap: (int value) {
            if (_currentTab == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: user, password: password)));
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, size: 30.0,),
                label: 'Profile'
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return _body(2);
        } else if (constraints.maxWidth <= 1200) {
          return _body(6);
        } else {
          return _body(8);
        }
      },
    );
  }
}

class ContentSearchDelegate extends SearchDelegate {
  var searchTerms = [...animeList, ...mangaList, ...lightNovelList];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var matchQuery = [];

    for (var content in searchTerms) {
      if (content.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(content);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              for (var content in animeList) {
                if (content.title == matchQuery[i].title) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAnimeScreen(anime: matchQuery[i])));
                  break;
                }
              }
              for (var content in mangaList) {
                if (content.title == matchQuery[i].title) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMangaScreen(manga: matchQuery[i])));
                  break;
                }
              }
              for (var content in lightNovelList) {
                if (content.title == matchQuery[i].title) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLightNovelScreen(lightNovel: matchQuery[i])));
                  break;
                }
              }
            },
            child: ListTile(
              leading: Image.asset(matchQuery[i].image),
              title: Text(matchQuery[i].title),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var matchQuery = [];

    for (var content in searchTerms) {
      if (content.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(content);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              for (var content in animeList) {
                if (content.title == matchQuery[i].title) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAnimeScreen(anime: matchQuery[i])));
                  break;
                }
              }
              for (var content in mangaList) {
                if (content.title == matchQuery[i].title) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMangaScreen(manga: matchQuery[i])));
                  break;
                }
              }
              for (var content in lightNovelList) {
                if (content.title == matchQuery[i].title) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLightNovelScreen(lightNovel: matchQuery[i])));
                  break;
                }
              }
            },
            child: ListTile(
              leading: Image.asset(matchQuery[i].image),
              title: Text(matchQuery[i].title),
            ),
          ),
        );
      },
    );
  }
}