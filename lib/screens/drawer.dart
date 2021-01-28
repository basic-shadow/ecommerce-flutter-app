import 'package:ecommerce_app/utils/product.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final List<String> uplist = [
    'Browse',
    'My orders',
    'Categories',
    'My Account'
  ];

  final List<Icon> icons = [
    Icon(Icons.ac_unit),
    Icon(Icons.ac_unit_rounded),
    Icon(Icons.backpack),
    Icon(Icons.cake)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.teal[700],
      child: Container(
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
                          color: Colors.grey[200]),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 15.0),
                    child: Column(
                      children: [
                        Text("Login", style: TextStyle(fontSize: 18.0)),
                        SizedBox(height: 10),
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.black54),
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
                      label: Text(
                        uplist[index],
                      ),
                      onPressed: () {
                        print("tapped");
                      }),
                );
              },
              itemCount: uplist.length,
            ),
            Expanded(flex: 3, child: SizedBox()),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
                    child: FlatButton.icon(
                      label: Text("Settings"),
                      onPressed: () {
                        print("pressed");
                      },
                      icon: Icon(
                        Icons.ac_unit_outlined,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.black,
                  ),
                  FlatButton(
                    child: Text("Log out"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
