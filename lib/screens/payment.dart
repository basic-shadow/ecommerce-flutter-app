import 'package:ecommerce_app/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/payment-service.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails(this.product, this._controller);
  final Product product;
  final PageController _controller;

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String totalPrice;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.product.price;
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Checkout",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        width: 30,
                        child: Text(
                          "1",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border:
                              Border.all(width: 2.0, color: Colors.grey[300]),
                        ),
                      ),
                      Text(
                        "Shipping Address",
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 1,
                    color: Colors.blueGrey[800],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        width: 30,
                        child: Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.green, fontSize: 15.0),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(width: 2.0, color: Colors.green),
                        ),
                      ),
                      Text(
                        "Payment Details",
                        style: TextStyle(color: Colors.green, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.8,
            margin: EdgeInsets.only(top: 25.0),
            child: Container(height: 0.8, color: Colors.grey[300]),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                offset: Offset(0, 0.8),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Payment Details",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Container(
            height: 0.8,
            margin: EdgeInsets.all(13.0),
            child: Container(height: 0.8, color: Colors.grey[300]),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                offset: Offset(0, 0.8),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  widget.product.price,
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          Container(
            height: 0.8,
            margin: EdgeInsets.all(13.0),
            child: Container(height: 0.8, color: Colors.grey[300]),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                offset: Offset(0, 0.8),
              )
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Order",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(totalPrice,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.green[700]))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text("Payment Method",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          // STRIPE
          Builder(
            builder: (context, index) async {
              var response = await StripeService.payWithNewCard(
                price: "${widget.product.price}",
                currency: "USD",
              );
              if (response.success == true) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(response.message),
                  duration: Duration(milliseconds: 1200),
                ));
              }
            },
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 28.0, horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          width: 1.5, color: Colors.greenAccent[400])),
                  child: FlatButton(
                    onPressed: () {
                      widget._controller.animateToPage(
                        0,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Back to Cart"),
                  ),
                ),
                Container(
                  height: 35,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent[700],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: FlatButton(
                    onPressed: () {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(
                            content: Text("Transaction Succeeded"),
                            duration: Duration(milliseconds: 1200),
                          ))
                          .closed
                          .then((_) {
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Next",
                        style: Theme.of(context).textTheme.headline5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
