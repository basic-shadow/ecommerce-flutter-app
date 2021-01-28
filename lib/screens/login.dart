import 'dart:math';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TextEditingController _emailController;
  TextEditingController _passController;
  bool edited1 = false;
  bool edited2 = false;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _animationController = AnimationController(
        value: 0,
        vsync: this,
        upperBound: 1,
        lowerBound: -1,
        duration: Duration(seconds: 25))
      ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.teal[200], Colors.green[400]])),
              ),
              builder: (context, child) => ClipPath(
                clipper: DrawClip(_animationController.value),
                child: child,
              ),
            ),
            Container(),
            Positioned(
              top: _width / 4,
              width: _width,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 35, bottom: 25, top: 20),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 35, color: Colors.grey[200]),
                      ),
                    ),
                    Container(
                      height: 350,
                      padding: EdgeInsets.only(
                          top: 50, bottom: 40, left: 25, right: 25),
                      margin: EdgeInsets.symmetric(horizontal: _width / 21),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 3),
                                spreadRadius: 5,
                                blurRadius: 6)
                          ]),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.grey[700]),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Row(
                                children: [
                                  Icon(Icons.email,
                                      color: edited1
                                          ? Colors.blueGrey[800]
                                          : Colors.blueGrey[400]),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (String value) {
                                        setState(() {
                                          edited1 = true;
                                        });
                                      },
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(8),
                                          border: InputBorder.none,
                                          hintText: "Email"),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: 30),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.grey[700]),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Row(
                                children: [
                                  Icon(Icons.lock,
                                      color: edited2
                                          ? Colors.blueGrey[800]
                                          : Colors.blueGrey[400]),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (String value) {
                                        setState(() {
                                          edited2 = true;
                                        });
                                      },
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                      obscureText: true,
                                      controller: _passController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password"),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(height: 60),
                          FlatButton(
                            height: _width * 0.11,
                            minWidth: _width * 0.75,
                            onPressed: () => Navigator.pushNamed(context, '/'),
                            color: Colors.teal[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text("Sign in",
                                style: TextStyle(
                                    color: Colors.grey[200], fontSize: 15)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 565,
              width: _width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _width / 3.4,
                        height: 1.5,
                        color: Colors.grey[300],
                      ),
                      Text(" New to Platform? "),
                      Container(
                        width: _width / 3.4,
                        height: 1.5,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: FlatButton(
                        minWidth: _width * 0.5,
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        color: Colors.blueGrey[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text("Sign up",
                            style: TextStyle(
                                color: Colors.grey[200], fontSize: 15)),
                      )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double anim = 0;
  DrawClip(this.anim);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);

    double xCenter = size.width * 0.5 + (size.width * 0.8) * sin(anim * pi);
    double yCenter = size.height;
    path.quadraticBezierTo(xCenter, yCenter, yCenter, size.height * 0.60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
