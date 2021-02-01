import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';
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
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: Container(
      child: PageView(
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
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            width: 30,
                            child: Text(
                              "1",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.teal[600],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: Colors.teal[400], fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    Expanded(
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
                          Expanded(
                            child: Text(
                              "Payment Details",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                            ),
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
                                  width: 2.0, color: Colors.blueGrey[600]),
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
                                  width: 2.0, color: Colors.blueGrey[600]),
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
                                  width: 2.0, color: Colors.blueGrey[600]),
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
                                  width: 2.0, color: Colors.blueGrey[600]),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 7,
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
                            Spacer(),
                            Flexible(
                              flex: 7,
                              child: Container(
                                margin: EdgeInsets.only(left: 5.0),
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    labelText: "City",
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
                                  value: selectedCity,
                                  onChanged: (val) {
                                    setState(() => selectedCity = val);
                                  },
                                  items: cityList,
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
                                        width: 2, color: Colors.blueGrey[300])),
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
                                    color: Colors.blueGrey[600],
                                    borderRadius: BorderRadius.circular(20.0)),
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
          PaymentDetails(_controller, products),
        ],
      ),
    ));
  }
}
