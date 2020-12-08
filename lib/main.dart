import 'package:coffee_shop/item_selected.dart';

import 'coffee_menu.dart';
import 'package:coffee_shop/login_screen.dart';
import 'package:coffee_shop/registration_screen.dart';
import 'package:coffee_shop/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        CoffeeMenu.id: (context) => CoffeeMenu(),
        ItemSelected.id: (context) => ItemSelected()
      },
    );
  }
}
