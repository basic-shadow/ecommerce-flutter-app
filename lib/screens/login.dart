import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 100,
              color: Colors.red,
            ),
            Positioned(
              top: 100,
              child: Container(
                height: 200,
                color: Colors.blue,
              ),
            ),
            Positioned(
              top: 10,
              // duration: Duration(milliseconds: 1000),
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
