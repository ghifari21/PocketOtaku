import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketotaku/screens/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  String user;
  String password;
  String? bio;

  ProfileScreen({required this.user, required this.password, this.bio = ''});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return MobileProfileScreen(user: user, password: password, bio: bio);
        } else if (constraints.maxWidth <= 1200) {
          return WebsiteProfileScreen(user: user, password: password, width: 500.0, bio: bio,);
        } else {
          return WebsiteProfileScreen(user: user, password: password, width: 700.0, bio: bio,);
        }
      },
    );
  }
}

class MobileProfileScreen extends StatefulWidget {
  String user;
  String password;
  String? bio;

  MobileProfileScreen({required this.user, required this.password, this.bio = ''});

  @override
  State<MobileProfileScreen> createState() => _MobileProfileScreenState(user: user, password: password, bio: bio);
}

class _MobileProfileScreenState extends State<MobileProfileScreen> {
  String user;
  String password;
  String? bio;
  final int _currentTab = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _MobileProfileScreenState({required this.user, required this.password, this.bio = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Profile',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 100,
                  child: const Icon(
                    Icons.account_circle,
                    color: Color(0xFFEF7369),
                    size: 100.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            initialValue: user,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username must not be empty!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  color: Colors.black
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                user = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            initialValue: password,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password must not be empty!';
                              }
                              // ignore: unnecessary_null_comparison
                              if ((value.isNotEmpty || value != null) && value.length < 6) {
                                return 'Password must at least 6 characters long!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.black
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            initialValue: bio,
                            decoration: const InputDecoration(
                                hintText: 'Biographic',
                                labelText: 'Biographic',
                                labelStyle: TextStyle(
                                    color: Colors.black
                                ),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.list,
                                  size: 20.0,
                                  color: Colors.black,
                                )
                            ),
                            onChanged: (String value) {
                              setState(() {
                                bio = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: user, password: password, bio: bio,)));
                              }
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEF7369),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Color(0xFFFCD7DF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFFFF6F9),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFEF7369),
          unselectedItemColor: const Color(0xFF7F818A),
          currentIndex: _currentTab,
          onTap: (int value) {
            if (_currentTab == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: user, password: password,)));
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, size: 30.0),
                label: 'Profile'
            )
          ],
        )
    );
  }
}

class WebsiteProfileScreen extends StatefulWidget {
  String user;
  String password;
  String? bio;
  double width;

  WebsiteProfileScreen({required this.user, required this.password, required this.width, this.bio = ''});

  @override
  State<WebsiteProfileScreen> createState() => _WebsiteProfileScreenState(user: user, password: password, width: width, bio: bio);
}

class _WebsiteProfileScreenState extends State<WebsiteProfileScreen> {
  String user;
  String password;
  String? bio;
  double width;
  final int _currentTab = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _WebsiteProfileScreenState({required this.user, required this.password, required this.width, this.bio = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Profile',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 100,
                  child: const Icon(
                    Icons.account_circle,
                    color: Color(0xFFEF7369),
                    size: 150.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                  width: width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            initialValue: user,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username must not be empty!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  color: Colors.black
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                user = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            initialValue: password,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password must not be empty!';
                              }
                              if ((value.isNotEmpty || value != null) && value.length < 6) {
                                return 'Password must at least 6 characters long!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.black
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            initialValue: bio,
                            decoration: const InputDecoration(
                                hintText: 'Biographic',
                                labelText: 'Biographic',
                                labelStyle: TextStyle(
                                    color: Colors.black
                                ),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.list,
                                  size: 20.0,
                                  color: Colors.black,
                                )
                            ),
                            onChanged: (String value) {
                              setState(() {
                                bio = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen(user: user, password: password, bio: bio,)));
                              }
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEF7369),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Color(0xFFFCD7DF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFFFF6F9),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFEF7369),
          unselectedItemColor: const Color(0xFF7F818A),
          currentIndex: _currentTab,
          onTap: (int value) {
            if (_currentTab == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: user, password: password,)));
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
}
