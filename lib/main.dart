import 'package:flutter/material.dart';
import './screens/browse.dart';
import './screens/login.dart';

void main() {
  runApp(MaterialApp(
      title: "AppName",
      theme: ThemeData(
          primaryColor: Colors.grey[100],
          fontFamily: 'Yusei',
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline4: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              headline6: TextStyle(
                  fontSize: 5.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black))),
      initialRoute: '/',
      routes: {
        '/': (context) => Browse(),
        '/login': (context) => Login(),
      }));
}
