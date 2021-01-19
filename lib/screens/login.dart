import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app"),
      ),
      body: ElevatedButton(
        child: Text("Login"),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
