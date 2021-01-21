import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatelessWidget {
  final List<String> uplist = [
    'Browse',
    'My orders',
    'Categories',
    'My Account'
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green[50],
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          child: Image.asset(
                            'assets/img1.jpeg',
                            height: 100,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 30.0),
                        child: Text("Login"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 30.0),
                        child: Text("Email"),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(uplist[index]),
                        onTap: () {
                          print("tapped");
                        });
                  },
                  itemCount: uplist.length,
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FlatButton.icon(
                        label: Text("About"),
                        onPressed: () {
                          print("About");
                        },
                        icon: Icon(Icons.access_alarms_sharp)),
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

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
            height: 18,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Text(
        "AppName",
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: SvgPicture.asset('assets/icons/cart.svg', height: 28),
            onPressed: () {
              print("Clicked Cart");
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
