import 'package:coffee_shop/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation textAnimation;
  Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animation = Tween<Offset>(begin: Offset(-1.0, 1.0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));

    textAnimation = Tween<Offset>(begin: Offset(1, -1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));

    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/coffee.jpg"), fit: BoxFit.fitHeight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SlideTransition(
              position: textAnimation,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Coffee Shop",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: "NotoSans"),
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _animation,
              child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 20.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Colors.brown.shade500,
                            Colors.brown.shade900
                          ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: "NotoSans",
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    ));
  }
}
