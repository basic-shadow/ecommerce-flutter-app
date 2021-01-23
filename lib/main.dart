import 'package:flutter/material.dart';
import './screens/browse.dart';
import './screens/login.dart';
import './screens/item.dart';
import './screens/checkout.dart';

void main() {
  runApp(MaterialApp(
      title: "AppName",
      theme: ThemeData(
          primaryColor: Colors.grey[100],
          fontFamily: 'Poppins',
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
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
              headline6: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.green))),
      initialRoute: '/',
      routes: {
        '/': (context) => Browse(),
        '/login': (context) => Login(),
        '/item': (context) => Item(),
        '/checkout': (context) => Checkout(),
      }));
}
