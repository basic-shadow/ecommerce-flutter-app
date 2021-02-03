import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'dart:math';

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

// browse.dart constants

final List<String> filter = [
  'All',
  'New-In',
  'Hot Deals',
  'Clothing',
  'Shoes',
  'Accessories'
];
final List<String> clothes = List.generate(10, (index) => "Title ${index + 1}");
final List<String> brands = [
  'Adidas',
  'Nike',
];

final List<String> prices = List.generate(10, (i) {
  int val = Random().nextInt(100);
  return "\$$val";
});

final List<Product> products = List.generate(
    10,
    (i) => Product(
        title: clothes[i % clothes.length],
        brand: brands[i % brands.length],
        price: prices[i % prices.length],
        type: filter.sublist(1)[i % filter.sublist(1).length]));

// checkout.dart constants

List<String> countries = [
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

List<DropdownMenuItem<String>> countryList = List();
List<DropdownMenuItem<String>> cityList = List();

constants() {
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
}

// drawer.dart constants

final List<String> list = ['Browse', 'My orders', 'Categories', 'My Account'];

final List<Icon> icons = [
  Icon(Icons.compare, color: Colors.white60),
  Icon(Icons.content_paste, color: Colors.white60),
  Icon(Icons.corporate_fare, color: Colors.white60),
  Icon(Icons.contacts, color: Colors.white60)
];

final List<String> links = ["/", "/orders", "/", "/account"];

// item.dart constants

final List<String> sizes = ["XS", "S", "M", "L", "XL", "XXL"];
final List<String> colors = ["BLACK", "WHITE", "BLUE", "GREEN", "RED"];

String descr =
    "This item has description here, which is hidden until dropdown button is pressed";
