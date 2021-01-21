import 'package:ecommerce_app/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/drawer.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 240,
              padding: EdgeInsets.only(bottom: 10.0),
              width: width,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey[300]),
              ),
              child: Image.asset('assets/clothes.jpeg', fit: BoxFit.fitHeight),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(product.title,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(product.brand,
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Text(product.price,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 0.8,
                    margin: EdgeInsets.only(top: 11.0, left: 16.0, right: 16.0),
                    child: Container(height: 0.8, color: Colors.grey),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0.8),
                      )
                    ]),
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
