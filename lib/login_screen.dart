import 'coffee_menu.dart';
import 'package:coffee_shop/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool textHide = true;
  Icon visibleIcon = Icon(Icons.visibility);
  Icon lockIcon = Icon(Icons.visibility_off);
  Icon _icon = Icon(Icons.visibility_off);
  bool circle = false;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void _showSnackbar() {
    final snack = SnackBar(
      content: Text("Sign in Failed"),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
    );
    _globalKey.currentState.showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          key: _globalKey,
          resizeToAvoidBottomPadding: false,
          body: ModalProgressHUD(
            inAsyncCall: circle,
            progressIndicator: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
            ),
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/loginUI.jpg"),
                      alignment: Alignment.topCenter),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.brown.shade200,
                            Colors.brown.shade900
                          ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(children: [
                      Center(
                        child: Text(
                          "COFFEE SHOP",
                          style: TextStyle(
                              color: Colors.brown.shade900,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SansitaSwashed"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 30.0, bottom: 8.0),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'email_password',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          onChanged: (String value) {
                            email = value;
                          },
                          onSubmitted: (String value) {
                            email = value;
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          toolbarOptions: ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: true,
                              selectAll: true),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Colors.brown.shade900,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'email_password',
                                color: Colors.grey.shade700),
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.brown.shade900, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.brown.shade900, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.brown.shade900, width: 2)),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10.0, bottom: 8.0),
                        child: TextField(
                          obscureText: textHide,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'email_password',
                            fontSize: 17,
                          ),
                          onChanged: (String value) {
                            password = value;
                          },
                          onSubmitted: (String value) {
                            password = value;
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: ImageIcon(
                              AssetImage(
                                'images/lock.png',
                              ),
                              color: Colors.brown.shade900,
                            ),
                            contentPadding: EdgeInsets.only(left: 20),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (textHide == true) {
                                    textHide = false;
                                    _icon = visibleIcon;
                                  } else {
                                    textHide = true;
                                    _icon = lockIcon;
                                  }
                                });
                              },
                              icon: _icon,
                              color: Colors.brown.shade900,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'email_password',
                                color: Colors.grey.shade700),
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.brown.shade900, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.brown.shade900, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.brown.shade900, width: 2)),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 12, 60, 12),
                        child: RaisedButton.icon(
                            elevation: 10.0,
                            splashColor: Colors.black,
                            padding: EdgeInsets.all(12),
                            color: Colors.brown.shade900,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: () async {
                              setState(() {
                                circle = true;
                              });
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (user != null) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CoffeeMenu();
                                  }));
                                  setState(() {
                                    circle = false;
                                  });
                                }
                              } catch (e) {
                                setState(() {
                                  circle = false;
                                });
                                _showSnackbar();
                              }
                            },
                            icon: Icon(Icons.favorite),
                            label: Text(
                              "Log In",
                              style: TextStyle(
                                  fontFamily: 'email_password',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have Account?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'email_password'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.brown.shade900),
                                  shape: MaterialStateProperty.resolveWith(
                                      (states) => RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.black)),

                              // TextButton.styleFrom(
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(10)),
                              //     ),
                              //     backgroundColor: Colors.brown.shade900),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegistrationScreen.id);
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: 'email_password',
                                    color: Colors.white70),
                              ))
                        ],
                      )
                    ]),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
