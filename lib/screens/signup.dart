import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
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
    _emailController.dispose();
    _passController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
            Container(height: 680),
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
                        "Sign Up",
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
                                          : Colors.blueGrey[300]),
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
                                          : Colors.blueGrey[300]),
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
                            child: Text("Sign up",
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
              top: _width / 2.65,
              right: _width / 3,
              width: 300,
              child: ClipPath(
                  clipper: Triangle(),
                  child: Container(
                    height: 120,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
