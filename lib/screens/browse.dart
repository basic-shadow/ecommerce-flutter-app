import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Browse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AppName",
        ),
        centerTitle: true,
      ),
      body: BrowseScreen(),
      drawer: MyDrawer(),
    );
  }
}

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final List<String> list = [
    'All',
    'New-In',
    'Hot Deals',
    'Clothing',
    'Shoes',
    'Accessories'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text("Browse", style: Theme.of(context).textTheme.headline1),
        ),
        Center(
          child: Container(
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1.0, color: Colors.black26)),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(12.0)),
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          height: 40,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.green[300]),
              ),
              margin: EdgeInsets.only(left: 10.0),
              width: 150,
              child: ListTile(
                title: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      list[index],
                      style: TextStyle(fontSize: 15.0),
                    )),
                onTap: () {
                  print(list[index]);
                },
              ),
            ),
          ),
        ),
        Wrap(
          children: [MyCards(), MyCards()],
        )
      ],
    ));
  }
}

class MyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          FittedBox(
            child: Image.asset(
              "assets/clothes.jpeg",
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                Text("Title"),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Brand", style: TextStyle(color: Colors.black45)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price"),
                    FlatButton(
                      color: Colors.green[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () {
                        print("Added to Cart");
                      },
                      child: Text("Add to Cart",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
