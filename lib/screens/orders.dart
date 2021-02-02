import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    final OrderList orderList = arguments['orderList'];
    print(orderList.orderProducts.length);
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 180,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.teal[300],
                            Colors.greenAccent,
                          ]),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  child: Stack(children: [
                    Positioned(
                      top: 10,
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.grey[100]),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Placeholder(
                          fallbackHeight: 60,
                          fallbackWidth: 60,
                          color: Colors.grey[400]),
                    ),
                    Positioned(
                      top: 15,
                      left: 80,
                      child: Text(
                        "My orders",
                        style: TextStyle(color: Colors.grey[100], fontSize: 27),
                      ),
                    ),
                    Positioned(
                        bottom: 75,
                        left: 80,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            child: Text(
                              "Wished List",
                              style: TextStyle(color: Colors.teal[600]),
                            ))),
                    Positioned(
                      bottom: 15,
                      left: 20,
                      width: _width - 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Order",
                            style: TextStyle(
                                color: Colors.black45, fontSize: 15.0),
                          ),
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal,
                                    blurRadius: 5,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Text(
                              "${orderList.orderProducts.length}",
                              style: TextStyle(
                                color: Colors.teal[700],
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ])),
              Container(
                  child: Column(
                children: orderList.orderProducts
                    .map((item) => OrderCard(item))
                    .toList(),
              ))
            ],
          ),
        )),
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  OrderCard(this.product);
  final Product product;
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    final int totalPrice =
        int.parse(widget.product.price.substring(1)) * widget.product.quantity;
    return Container(
      margin: EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
      height: 275,
      decoration: BoxDecoration(
        color: Colors.green[50],
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350],
            blurRadius: 5,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                width: 150,
                child: Image.asset('assets/clothes.jpeg'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.product.title}",
                        style: TextStyle(fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0, left: 3.0),
                      child: Text("${widget.product.brand}",
                          style:
                              TextStyle(fontSize: 12, color: Colors.black45)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                          "${widget.product.price} x ${widget.product.quantity}",
                          style: TextStyle(fontSize: 20, color: Colors.teal)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 14.0, top: 14.0, right: 14.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  "${widget.product.quantity}",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  "\$ ${totalPrice}",
                  style:
                      TextStyle(fontSize: 20, color: Colors.greenAccent[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
