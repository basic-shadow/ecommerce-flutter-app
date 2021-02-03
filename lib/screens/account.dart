import 'package:ecommerce_app/utils/product.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    final OrderList orderList = arguments['orderList'];

    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft,
                    colors: [
                  Colors.white,
                  Colors.white,
                  Colors.greenAccent,
                  Colors.teal,
                  Colors.teal,
                ])),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 190,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 5,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Material(
                              type: MaterialType.transparency,
                              child: IconButton(
                                iconSize: 20,
                                splashColor: Colors.teal[400],
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.blueGrey[700]),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    "assets/img1.jpg",
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("basic-shadow",
                                          style: TextStyle(
                                              color: Colors.grey[200],
                                              fontSize: 15)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          "islambek.mamet.00@gmail.com",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Spacer(),
                                Spacer(),
                              ]),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 30,
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Balance:",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 17)),
                                  WidgetSpan(
                                      child: SizedBox(
                                    width: 25,
                                  )),
                                  TextSpan(
                                      text: "\$100",
                                      style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ]))),
                        Positioned(
                          top: 10,
                          right: 15,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Material(
                              type: MaterialType.transparency,
                              child: IconButton(
                                iconSize: 20,
                                splashColor: Colors.teal[400],
                                icon: Icon(Icons.settings,
                                    color: Colors.blueGrey[700]),
                                onPressed: () => Navigator.of(context)
                                    .pushNamed('/settings'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.0),
                            topRight: Radius.circular(35.0)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: Text("Orders",
                                    style: TextStyle(fontSize: 22.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: InkWell(
                                    onTap: () => Navigator.popAndPushNamed(
                                        context, '/orders',
                                        arguments: {'orderList': orderList}),
                                    child: Container(
                                      height: 35,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: Center(
                                        child: Text(
                                          "Check all",
                                          style: TextStyle(
                                              color: Colors.blue[700],
                                              fontSize: 13),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: iconTextBtn(
                                      'Wished List', Icons.favorite)),
                              Expanded(
                                  child: iconTextBtn(
                                      'Shipped', Icons.local_shipping)),
                              Expanded(
                                  child: iconTextBtn(
                                      'To be Shipped', Icons.wrap_text)),
                              Expanded(
                                  child: iconTextBtn('Obtained', Icons.face)),
                            ],
                          ),
                          Divider(),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Browse Items",
                                style: TextStyle(color: Colors.indigo[600]),
                              ),
                            ),
                          ),
                          horizontalDivider(),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 22.0, top: 18.0, bottom: 5.0),
                            child: Text("Coupons",
                                style: TextStyle(fontSize: 22.0)),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 22.0),
                            child: Text("Keep track and save money",
                                style: TextStyle(
                                    fontSize: 11.0, color: Colors.black45)),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.only(bottom: 10),
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Coupons(
                                    "Invite Friends and get  ",
                                    Colors.lightBlue[100],
                                    Icons.monetization_on_rounded,
                                    true),
                                Coupons(
                                    "Enter invitaion code",
                                    Colors.deepOrange[100],
                                    Icons.mobile_friendly_outlined,
                                    false)
                              ],
                            ),
                          ),
                          horizontalDivider(),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 22.0, top: 18.0, bottom: 5.0),
                            child: Text("Services",
                                style: TextStyle(fontSize: 22.0)),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              padding: EdgeInsets.all(15),
                              child: GridView.count(
                                physics: BouncingScrollPhysics(),
                                childAspectRatio: 2.8,
                                shrinkWrap: true,
                                mainAxisSpacing: 12.0,
                                crossAxisSpacing: 10.0,
                                crossAxisCount: 2,
                                children: [
                                  service(
                                      "Wallet",
                                      Icon(
                                          Icons.account_balance_wallet_outlined,
                                          color: Colors.blue,
                                          size: 33)),
                                  service(
                                      "Shipment",
                                      Icon(Icons.location_on_sharp,
                                          color: Colors.blueGrey[700],
                                          size: 33)),
                                  service(
                                      "Coupons",
                                      Icon(Icons.wallet_giftcard_outlined,
                                          color: Colors.indigo, size: 33)),
                                  service(
                                      "Questions & Answers",
                                      Icon(Icons.contact_support_outlined,
                                          color: Colors.deepOrange, size: 33)),
                                  service(
                                      "FAQ",
                                      Icon(Icons.menu_book_outlined,
                                          color: Colors.teal, size: 33)),
                                  service(
                                      "App Suggestion",
                                      Icon(Icons.perm_device_information,
                                          color: Colors.blue[900], size: 33)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget iconTextBtn(String text, IconData icon) {
  return Material(
    type: MaterialType.transparency,
    child: InkWell(
      splashColor: Colors.blue[300],
      onTap: () {},
      child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.greenAccent),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.5),
                ),
              ),
            ],
          )),
    ),
  );
}

Widget horizontalDivider() {
  return Container(height: 5, color: Colors.grey[200]);
}

class Coupons extends StatelessWidget {
  final Color _color;
  final String _text;
  final IconData _icon;
  final bool textspan;
  Coupons(this._text, this._color, this._icon, this.textspan);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.lightBlue,
        child: Container(
            margin: EdgeInsets.only(
                top: 10.0, left: 10.0, right: 8.0, bottom: 10.0),
            width: 190,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 12,
                  width: 190 / 1.8,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: _text, style: TextStyle(color: Colors.black87)),
                    textspan
                        ? TextSpan(
                            text: "\$5",
                            style: TextStyle(
                                color: Colors.pink[400], fontSize: 25))
                        : TextSpan(),
                  ])),
                ),
                Positioned(
                  top: 27,
                  right: 22,
                  child: Icon(_icon, size: 40, color: Colors.blue[800]),
                )
              ],
            )),
      ),
    );
  }
}

Widget service(String text, Icon icon) {
  return Material(
    type: MaterialType.transparency,
    child: InkWell(
      onTap: () {},
      splashColor: Colors.deepOrange[300],
      child: Container(
          // height: 50,
          // width: 160,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[200], width: 2.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: 15.0), child: icon),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(text),
                ),
              ),
            ],
          )),
    ),
  );
}
