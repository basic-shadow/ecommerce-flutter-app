import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:ecommerce_app/utils/configuration.dart';

class MyDrawer extends StatefulWidget {
  final OrderList orderList;
  final Position position;
  MyDrawer(this.orderList, this.position);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    bool add_spacer = _height < 750 ? true : false;

    return Container(
      height: _height,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/img1.jpg",
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("basic-shadow",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.grey[200])),
                      SizedBox(height: 5),
                      Text(
                        "islambek.mamet.00@gmail.com",
                        style: TextStyle(color: Colors.black38, fontSize: 10),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          add_spacer ? SizedBox.shrink() : Spacer(),
          Flexible(
            flex: 5,
            child: ListView.builder(
              // shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                      icon: icons[index],
                      label: Text(list[index],
                          style: TextStyle(color: Colors.black54)),
                      onPressed: () {
                        Navigator.pushNamed(context, links[index],
                            arguments: {'orderList': widget.orderList});

                        widget.position.drawerTrigger(context);
                      }),
                );
              },
              itemCount: list.length,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
              child: Row(
                children: [
                  FlatButton.icon(
                    label: Text(
                      "Settings",
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                      widget.position.drawerTrigger(context);
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white60,
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
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil(
                            '/login', (Route<dynamic> route) => false),
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
