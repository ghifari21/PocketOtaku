import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocketotaku/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return MobileLoginScreen();
        } else {
          return WebsiteLoginScreen();
        }
      },
    );
  }
}

class MobileLoginScreen extends StatefulWidget {
  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(
                    color: Color(0xFFEF7369),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: _username,
                        validator: (value) {
                          return (value == null || value.isEmpty) ? 'Username must not be empty!' : null;
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: _password,
                        obscureText: _obsecure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password must not be empty';
                          }
                          if ((value.isNotEmpty || value != null) && value.length < 6) {
                            return 'Password must at least 6 characters long';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              color: Colors.black
                          ),
                          prefixIcon: const Icon(
                            FontAwesomeIcons.lock,
                            size: 20,
                            color: Colors.black,
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _obsecure
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 20,
                              color: Colors.black,
                            ),
                            onTap: () {
                              setState(() {
                                _obsecure = !_obsecure;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: _username.text, password: _password.text,)));
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
                              'Login',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Don\'t have an Account? '),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Register here',
                              style: TextStyle(
                                color: Color(0xFFEF7369),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
}

class WebsiteLoginScreen extends StatefulWidget {
  @override
  State<WebsiteLoginScreen> createState() => _WebsiteLoginScreenState();
}

class _WebsiteLoginScreenState extends State<WebsiteLoginScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(
                    color: Color(0xFFEF7369),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                width: 500.0,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            controller: _username,
                            validator: (value) {
                              return (value == null || value.isEmpty) ? 'Username must not be empty!' : null;
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: _password,
                            obscureText: _obsecure,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password must not be empty';
                              }
                              if ((value.isNotEmpty || value != null) && value.length < 6) {
                                return 'Password must at least 6 characters long';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                  color: Colors.black
                              ),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.lock,
                                size: 20,
                                color: Colors.black,
                              ),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _obsecure
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  setState(() {
                                    _obsecure = !_obsecure;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: _username.text, password: _password.text,)));
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
                                  'Login',
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Don\'t have an Account? '),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Register here',
                                  style: TextStyle(
                                    color: Color(0xFFEF7369),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
}

