import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Description.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ItemSelected extends StatefulWidget {
  static String id = "ItemSelected";

  ItemSelected({this.image, this.coffeeName, this.price});
  final String image;
  final String coffeeName;
  final double price;
  @override
  _ItemSelectedState createState() => _ItemSelectedState();
}

class _ItemSelectedState extends State<ItemSelected> {
  Color pressedColor = Colors.red.shade900;
  Color unpressedColor = Colors.grey;
  bool press = true;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(children: [
            Container(
              height: 420,
              decoration: BoxDecoration(
                  image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                image: AssetImage(widget.image),
              )),
            ),
            Container(
              transform: Matrix4.translationValues(0, -19, 0),
              height: 293.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Stack(overflow: Overflow.visible, children: [
                Positioned(
                    top: -20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 4)
                          ]),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: color,
                            ),
                            onPressed: () {
                              setState(() {
                                if (press == true) {
                                  color = pressedColor;
                                  press = false;
                                } else {
                                  color = unpressedColor;
                                  press = true;
                                }
                              });
                            }),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffeeName,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'email_password'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade900,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade900,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade900,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade900,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade900,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'email_password'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 7),
                        child: Text(
                          desc[widget.coffeeName],
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'email_password'),
                                ),
                                Text(
                                  "Rp ${widget.price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'email_password'),
                                )
                              ],
                            ),
                            RaisedButton(
                              splashColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Icon(
                                      Icons.check_circle_outline,
                                      size: 30,
                                      color: Colors.brown.shade900,
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(
                                        'Have a Nice Day!',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              color: Colors.brown.shade900,
                              child: Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ]),
          Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                iconSize: 30,
                icon: ImageIcon(AssetImage('images/backicon.png')),
              )),
        ]),
      ),
    );
  }
}
