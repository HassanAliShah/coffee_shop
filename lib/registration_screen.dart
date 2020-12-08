import 'package:coffee_shop/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "RegistrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String name;
  bool textHide = true;
  Icon visibleIcon = Icon(Icons.visibility);
  Icon lockIcon = Icon(Icons.visibility_off);
  Icon _icon = Icon(Icons.visibility_off);
  bool circle = false;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void _showSnackbar() {
    final snack = SnackBar(
      content: Text("Email Already in use!"),
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/loginUI.jpg"),
                    alignment: Alignment.topCenter),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // constraints: BoxConstraints(maxHeight: 450),
                  // transform: Matrix4.translationValues(0, 265, 0),
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.brown.shade200, Colors.brown.shade900]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(children: [
                    Column(
                      children: [
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
                              name = value;
                            },
                            onSubmitted: (String value) {
                              name = value;
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
                                Icons.person,
                                color: Colors.brown.shade900,
                              ),
                              hintText: "Name",
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
                              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
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
                          padding: const EdgeInsets.all(10.0),
                          child: RaisedButton.icon(
                              elevation: 10.0,
                              splashColor: Colors.black,
                              padding: EdgeInsets.fromLTRB(90, 12, 90, 12),
                              color: Colors.brown.shade900,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () async {
                                setState(() {
                                  circle = true;
                                });
                                try {
                                  final user = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (user != null) {
                                    setState(() {
                                      circle = false;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Icon(
                                                Icons.check_circle,
                                                size: 30,
                                              ),
                                              content: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(
                                                  'Registration Successful',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ));
                                    // Navigator.pushNamed(context, LoginScreen.id);
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
                                "Register",
                                style: TextStyle(
                                    fontFamily: 'email_password',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have Account?",
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
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.black)),

                                // TextButton.styleFrom(
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius:
                                //           BorderRadius.all(Radius.circular(10)),
                                //     ),
                                //     backgroundColor: Colors.brown.shade900),
                                onPressed: () {
                                  Navigator.pushNamed(context, LoginScreen.id);
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: 'email_password',
                                      color: Colors.white70),
                                ))
                          ],
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
