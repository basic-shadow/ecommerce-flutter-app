import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String title;
  final String brand;
  final String price;
  final String type;
  String shipPrice = "\$0";
  int shipmentChoice = 0;
  String size = "S";
  String color = "Black";
  bool added = false;
  int quantity = 1;
  Product({this.title, this.brand, this.price, this.type});

  void setShipment(String shipment) {
    shipPrice = shipment;
    notifyListeners();
  }

  void setSize(String itemSize) {
    size = itemSize;
    notifyListeners();
  }

  void setColor(String itemColor) {
    color = itemColor;
    notifyListeners();
  }

  void setChoiceShipment(int i) {
    shipmentChoice = i;
    notifyListeners();
  }

  void toggle() {
    added = !added;
    notifyListeners();
  }

  void setQuantity(int num) {
    quantity = num;
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
    product.quantity = 1;
    products.remove(product);
    notifyListeners();
  }
}

class OrderList extends ChangeNotifier {
  OrderList();
  List<Product> orderProducts = List();

  void addProduct(Product product) {
    orderProducts.add(product);
  }

  void removeProduct(Product product) {
    product.quantity = 1;
    orderProducts.remove(product);
  }
}

class PopWithResults {
  final String toPage;

  final List<Product> orderResults;

  PopWithResults({@required this.toPage, this.orderResults});
}
