import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/library.dart';

void main() {
  runApp(MaterialApp(
    title: "Trademark",
    theme: ThemeData(
        primaryColor: Colors.grey[100],
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w500, color: Colors.black),
          subtitle1: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0,
              color: Colors.grey),
          headline3: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0,
              color: Colors.black),
          headline4: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0,
              color: Colors.black),
          headline5: TextStyle(
              fontSize: 15.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        )),
    initialRoute: '/login',
    routes: {
      '/orders': (context) => Orders(),
      '/account': (context) => Account(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/settings': (context) => Settings(),
      '/': (context) => Browse(),
      '/item': (context) => Item(),
      '/checkout': (context) => Checkout(),
      '/cart': (context) => Cart(),
    },
  ));
}
