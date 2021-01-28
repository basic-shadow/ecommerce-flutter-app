import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/utils/configuration.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool checked = false;
  final GlobalKey<CartItemsState> _key = GlobalKey();

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
                .map((item) => double.parse(item.price.substring(1)))
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
                        icon: SvgPicture.asset(
                          'assets/icons/menu.svg',
                          height: 18,
                        ),
                        onPressed: () {
                          context.watch<Position>().drawerTrigger(context);
                        },
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
                              // color: widget.added
                              //     ? Colors.tealAccent[700]
                              //     : Colors.black
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
                      "$length Items Selected",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    value: checked,
                    onChanged: (bool value) => setState(() {
                      checked = value;
                    }),
                    activeColor: Colors.black,
                  )),
              Divider(),
              Column(
                key: _key,
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
                                      text: "Discounts",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(style: TextStyle(color: Colors.red))
                                ])),
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Order"),
                                Text("Price"),
                              ],
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
                          onPressed: () => {},
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
  int _quantity = 1;
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
                        highlightColor: Colors.grey[600],
                        onPressed: () {
                          if (cartList.products.length > 0) {
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
                                  color: _quantity > 1
                                      ? Colors.deepOrange[700]
                                      : Colors.grey[400],
                                )),
                            onPressed: _quantity > 1
                                ? () {
                                    setState(() {
                                      _quantity--;
                                    });
                                  }
                                : null,
                          ),
                        ),
                        Text(
                          "$_quantity",
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
                                _quantity++;
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
