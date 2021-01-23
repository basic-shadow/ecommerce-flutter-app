import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:ecommerce_app/screens/drawer.dart';
import 'package:ecommerce_app/screens/payment.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  PageController _controller;
  List<String> countries;
  Map<String, String> cities;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _addressController;
  TextEditingController _phoneController;
  FocusNode focusNode1;
  FocusNode focusNode2;
  FocusNode focusNode3;
  FocusNode focusNode4;
  List<DropdownMenuItem<String>> countryList;
  List<DropdownMenuItem<String>> cityList;

  String selectedCountry;
  String selectedCity;

  @override
  void initState() {
    super.initState();
    countries = [
      "Mercury",
      "Venus",
      "Earth",
      "Mars",
      "Jupiter",
      "Saturn",
      "Uran",
      "Neptun",
      "Kazakhstan"
    ];
    _controller = PageController(initialPage: 0);
    selectedCountry = "Earth";
    selectedCity = "Earth3";
    cityList = List();
    countryList = List();

    countryList = List();
    for (String country in countries) {
      countryList.add(
        DropdownMenuItem(
          value: country,
          child: Text(country),
        ),
      );
    }

    countries.asMap().forEach((index, country) => cityList.add(DropdownMenuItem(
          value: "$country${index + 1}",
          child: Text("$country${index + 1}"),
        )));

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> prods = ModalRoute.of(context).settings.arguments;
    final Product product = prods['product'];
    final int _quantity = prods['quantity'];

    return Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          pageSnapping: true,
          controller: _controller,
          children: [
            ListView(
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
                        flex: 4,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              width: 30,
                              child: Text(
                                "1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15.0),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(width: 2.0, color: Colors.green),
                              ),
                            ),
                            Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.0),
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
                        flex: 4,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              width: 30,
                              child: Text(
                                "2",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    width: 2.0, color: Colors.grey[300]),
                              ),
                            ),
                            Text(
                              "Payment Details",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
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
                      "Shipping Address",
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
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  margin: EdgeInsets.symmetric(horizontal: 13.0),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: Theme.of(context).textTheme.headline3,
                            maxLines: 1,
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.black54),
                              contentPadding: EdgeInsets.all(15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.greenAccent[700]),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: Theme.of(context).textTheme.headline3,
                            maxLines: 1,
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black54),
                              contentPadding: EdgeInsets.all(15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.greenAccent[700]),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: Theme.of(context).textTheme.headline3,
                            maxLines: 1,
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: "Address",
                              labelStyle: TextStyle(color: Colors.black54),
                              contentPadding: EdgeInsets.all(15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.greenAccent[700]),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: Theme.of(context).textTheme.headline3,
                            maxLines: 1,
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: "Phone",
                              labelStyle: TextStyle(color: Colors.black54),
                              contentPadding: EdgeInsets.all(15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.greenAccent[700]),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              Flexible(
                                flex: 4,
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    labelText: "Country",
                                    labelStyle: TextStyle(
                                        color: Colors.black54, fontSize: 12.5),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 7.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0, color: Colors.black)),
                                  ),
                                  elevation: 2,
                                  style: Theme.of(context).textTheme.headline3,
                                  icon: SvgPicture.asset(
                                    'assets/icons/arrow-down.svg',
                                    height: 12,
                                  ),
                                  value: selectedCountry,
                                  onChanged: (val) {
                                    setState(() => selectedCountry = val);
                                  },
                                  items: countryList,
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      labelText: "City",
                                      labelStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12.5),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 7.0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0, color: Colors.black)),
                                    ),
                                    elevation: 2,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                    icon: SvgPicture.asset(
                                      'assets/icons/arrow-down.svg',
                                      height: 12,
                                    ),
                                    value: selectedCity,
                                    onChanged: (val) {
                                      setState(() => selectedCity = val);
                                    },
                                    items: cityList,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Flexible(
                                flex: 2,
                                child: Transform.translate(
                                  offset: Offset(0, 11.0),
                                  child: TextFormField(
                                    maxLength: 6,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.greenAccent[700]),
                                      ),
                                      labelText: "ZCode",
                                      labelStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12.5),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 7.0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0, color: Colors.black)),
                                    ),
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 28.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 35,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                          width: 1.5,
                                          color: Colors.greenAccent[400])),
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Back to Cart"),
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent[700],
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: FlatButton(
                                    onPressed: () {
                                      _controller.animateToPage(
                                        1,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Text("Next",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            PaymentDetails(product, _controller, _quantity),
          ],
        ));
  }
}
