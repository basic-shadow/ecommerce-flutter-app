import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40.0),
                height: 200,
                color: Colors.blueGrey[50],
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Container(
                        width: 150,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Placeholder(color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        child: Column(
                          children: [
                            Text("Login",
                                style: TextStyle(color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Email",
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                    ]),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Text("Orders", style: TextStyle(fontSize: 20.0)),
                  )),
              Container(
                color: Colors.blueGrey[50],
                height: 150,
                child: Center(
                  child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Text(
                        'q',
                      )),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
