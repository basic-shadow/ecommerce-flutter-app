import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final OrderList;
  MyDrawer(this.OrderList);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final List<String> list = ['Browse', 'My orders', 'Categories', 'My Account'];

  final List<Icon> icons = [
    Icon(Icons.compare, color: Colors.white60),
    Icon(Icons.content_paste, color: Colors.white60),
    Icon(Icons.corporate_fare, color: Colors.white60),
    Icon(Icons.contacts, color: Colors.white60)
  ];

  final List<String> links = ["/", "/orders", "/", "/account"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            Colors.teal[800],
            Colors.teal[400],
          ])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 18.0),
            height: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    child: Placeholder(
                        fallbackHeight: 150,
                        fallbackWidth: 100,
                        color: Colors.grey[400]),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 15.0),
                  child: Column(
                    children: [
                      Text("Login",
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey[200])),
                      SizedBox(height: 10),
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.grey[400]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                    icon: icons[index],
                    label: Text(list[index],
                        style: TextStyle(color: Colors.black54)),
                    onPressed: () => Navigator.pushNamed(context, links[index],
                        arguments: {'orderList': widget.OrderList})),
              );
            },
            itemCount: list.length,
          ),
          Expanded(flex: 3, child: SizedBox()),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
                    child: FlatButton.icon(
                      label: Text(
                        "Settings",
                        style: TextStyle(color: Colors.black54),
                      ),
                      onPressed: () {
                        print("pressed");
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.black,
                  ),
                  FlatButton(
                    child: Text("Log out",
                        style: TextStyle(color: Colors.black87)),
                    onPressed: () => Navigator.pushNamed(context, "/login"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
