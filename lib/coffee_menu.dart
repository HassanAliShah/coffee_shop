import 'package:coffee_shop/item_selected.dart';
import 'package:coffee_shop/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CoffeeMenu extends StatefulWidget {
  static String id = "CoffeeMenu";
  @override
  _CoffeeMenuState createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  final _auth = FirebaseAuth.instance;
  bool firstButton = true;
  bool secondButton = false;
  bool thirdButton = false;

  PageController _pageController = PageController(initialPage: 0);

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
          resizeToAvoidBottomPadding: false,
          body: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("images/beans.jpeg"),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 483,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(21),
                        topLeft: Radius.circular(21)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              color: firstButton ? Colors.grey : Colors.white,
                              onPressed: () {
                                setState(() {
                                  _pageController.jumpToPage(0);
                                  firstButton = true;
                                  secondButton = false;
                                  thirdButton = false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Hot Coffee",
                                style: TextStyle(
                                    color: firstButton
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'email_password'),
                              ),
                            ),
                            RaisedButton(
                              color: secondButton ? Colors.grey : Colors.white,
                              onPressed: () {
                                setState(() {
                                  _pageController.jumpToPage(1);
                                  firstButton = false;
                                  secondButton = true;
                                  thirdButton = false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Cold Coffee",
                                style: TextStyle(
                                    color: secondButton
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'email_password'),
                              ),
                            ),
                            RaisedButton(
                              color: thirdButton ? Colors.grey : Colors.white,
                              onPressed: () {
                                setState(() {
                                  _pageController.jumpToPage(2);
                                  firstButton = false;
                                  secondButton = false;
                                  thirdButton = true;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Others",
                                style: TextStyle(
                                    color: thirdButton
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'email_password'),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'email_password',
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Search Your Coffee",
                            hintStyle: TextStyle(
                                fontSize: 17,
                                fontFamily: 'email_password',
                                color: Colors.grey.shade700),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.brown.shade900, width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: PageView(
                            controller: _pageController,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  MenuItem(
                                    image: 'images/americano.jpg',
                                    name: 'Americano',
                                    desc: 'Espresso with cream...',
                                    price: 120.00,
                                  ),
                                  MenuItem(
                                    image: 'images/cappacino.jpg',
                                    name: 'Cappacino',
                                    desc: 'Espresso with milk...',
                                    price: 150.00,
                                  ),
                                  MenuItem(
                                    image: 'images/Manchitto.jpg',
                                    name: 'Manchitto',
                                    desc: 'Espresso with hot water...',
                                    price: 80.00,
                                  )
                                ],
                              ),
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  MenuItem(
                                    image: "images/iced_coffee.jpg",
                                    name: 'Iced Coffee',
                                    desc: 'Enjoy with cream...',
                                    price: 150.00,
                                  ),
                                  MenuItem(
                                    image: "images/cold_brew.jpg",
                                    name: "Cold Brew",
                                    desc: "Enjoy with cake..",
                                    price: 250.00,
                                  ),
                                  MenuItem(
                                    image: "images/affogato-coffee.jpg",
                                    name: 'Affogato Coffee',
                                    price: 100.0,
                                    desc: 'Enjoy with nuts...',
                                  )
                                ],
                              ),
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  MenuItem(
                                    image: "images/green_tea.jpg",
                                    name: "Green Tea",
                                    price: 50,
                                    desc: 'Enjoy with gorra...',
                                  ),
                                  MenuItem(
                                    image: 'images/red_tea.jpg',
                                    name: 'Red Tea',
                                    price: 50.0,
                                    desc: 'Enjoy with sugar...',
                                  ),
                                  MenuItem(
                                    image: 'images/tandori_chy.jpg',
                                    name: "Tandori Chy",
                                    price: 80.0,
                                    desc: 'Enjoy with parata...',
                                  )
                                ],
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 10,
                top: 130,
                child: RichText(
                  text: TextSpan(
                      text: "it's Great ",
                      style:
                          TextStyle(fontFamily: 'email_password', fontSize: 20),
                      children: [
                        TextSpan(
                            text: "Day for \nCoffee",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'email_password')),
                      ]),
                )),
            Positioned(
                top: 13,
                left: 5,
                child: IconButton(
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  icon: Icon(
                    Icons.short_text,
                    size: 30,
                    color: Colors.white,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final String desc;

  MenuItem({this.image, this.name, this.price, this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                )),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  desc,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rp $price",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          MaterialButton(
            splashColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minWidth: 20,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ItemSelected(
                  image: image,
                  coffeeName: name,
                  price: price,
                );
              }));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Colors.brown.shade500,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
