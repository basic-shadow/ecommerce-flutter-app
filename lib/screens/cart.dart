import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool checked = false;

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String route = ModalRoute.of(context).settings.name;
    CartList cartList = ModalRoute.of(context).settings.arguments;
    int length = cartList.products.length;

    String totalPrice = length > 0
        ? "\$" +
            cartList.products
                .map((item) =>
                    int.parse(item.price.substring(1)) * item.quantity)
                .reduce((a, b) => a + b)
                .toString()
        : "\$ 0";

    return ChangeNotifierProvider(
      create: (_) => Position(xOffset: 0, yOffset: 0, scaleFactor: 1),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: MediaQuery.of(context).size.width / 2.4,
                    child: Text("Cart",
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 12.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal[600],
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: IconButton(
                            onPressed: route == "/cart"
                                ? null
                                : () {
                                    Navigator.pushNamed(context, "/cart");
                                  },
                            icon: SvgPicture.asset(
                              'assets/icons/cart.svg',
                              color: Colors.white,
                              height: 28,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                  alignment: Alignment.centerLeft,
                  child: CheckboxListTile(
                    title: Text(
                      "${checked ? length : 0} Items Selected",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    value: length > 0 ? checked : false,
                    onChanged: (bool value) => setState(() {
                      checked = length > 0 ? value : false;
                    }),
                    activeColor: Colors.black,
                  )),
              Divider(),
              Column(
                children: cartList.products
                    .map((item) => CartItems(item, refresh))
                    .toList(),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Align(
                              child: Text("Order Details"),
                              alignment: Alignment.centerLeft,
                            ),
                            Divider(),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sub total"),
                                  Text("$totalPrice")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text("Shipment"), Text("price2")],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "Discounts ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: ("(-10%)"),
                                      style: TextStyle(color: Colors.red[400]))
                                ])),
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Order"),
                                  Text(
                                    totalPrice,
                                    style: TextStyle(
                                        color: Colors.teal[700], fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.only(bottom: 30),
                        child: FlatButton(
                          minWidth: 130,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.teal[400],
                          onPressed: () => checked
                              ? Navigator.pushNamed(context, '/checkout',
                                  arguments: cartList.products)
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    contentPadding: EdgeInsets.only(top: 40),
                                    content: Text(
                                      "Checkout needs at least 1 item to proceed",
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      FlatButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("I understand"),
                                      ),
                                    ],
                                  ),
                                ),
                          child: Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItems extends StatefulWidget {
  final Product product;
  final Function() refresh;
  CartItems(this.product, this.refresh);
  @override
  CartItemsState createState() => CartItemsState();
}

class CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    CartList cartList = ModalRoute.of(context).settings.arguments;

    return Container(
      height: 170,
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 120,
            child: Image.asset('assets/clothes.jpeg'),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(18),
              ),
              margin: EdgeInsets.only(
                bottom: 15,
                top: 10,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8, left: 8),
                        child: Text(
                          "${widget.product.title}",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Padding(
                        child: Text(
                          "${widget.product.brand}",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                        padding: EdgeInsets.only(top: 5, left: 8),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 18, bottom: 7),
                        child: Text("${widget.product.price}",
                            style: TextStyle(fontSize: 16.0)),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Material(
                      type: MaterialType.transparency,
                      borderRadius: BorderRadius.circular(25),
                      child: IconButton(
                        splashColor: Colors.blueGrey[400],
                        splashRadius: 20,
                        color: Colors.grey[800],
                        highlightColor: Colors.grey[700],
                        onPressed: () {
                          if (cartList.products.length > 0) {
                            widget.product.toggle();
                            cartList.removeProduct(widget.product);
                            widget.refresh();
                          }
                        },
                        icon: Icon(Icons.cancel),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Row(
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          borderRadius: BorderRadius.circular(25),
                          child: IconButton(
                            splashRadius: 16,
                            splashColor: Colors.grey[600],
                            icon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: widget.product.quantity > 1
                                      ? Colors.deepOrange[700]
                                      : Colors.grey[400],
                                )),
                            onPressed: widget.product.quantity > 1
                                ? () {
                                    setState(() {
                                      widget.product.quantity--;
                                      widget.refresh();
                                    });
                                  }
                                : null,
                          ),
                        ),
                        Text(
                          "${widget.product.quantity}",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Material(
                          type: MaterialType.transparency,
                          borderRadius: BorderRadius.circular(25),
                          child: IconButton(
                            splashRadius: 18,
                            splashColor: Colors.green[200],
                            icon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              setState(() {
                                widget.product.quantity++;
                                widget.refresh();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
