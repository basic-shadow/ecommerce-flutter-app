import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String title;
  final String brand;
  final String price;
  final String type;
  bool added = false;
  Product({this.title, this.brand, this.price, this.type});

  void toggle() {
    added = !added;
    notifyListeners();
  }
}

class Position extends ChangeNotifier {
  double xOffset;
  double yOffset;
  double scaleFactor;
  bool pressed = false;
  Position({this.xOffset, this.yOffset, this.scaleFactor});

  void drawerTrigger(context) {
    pressed = !pressed;
    if (pressed) {
      xOffset = 220;
      yOffset = MediaQuery.of(context).size.height / 6;
      scaleFactor = 0.7;
    } else {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
    }

    notifyListeners();
  }
}

class CartList extends ChangeNotifier {
  CartList();
  List<Product> products = List();

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    products.remove(product);
    notifyListeners();
  }
}
