import 'package:ecommerce_app/utils/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool pressed = false;
  final List<String> sizes = ["XS", "S", "M", "L", "XL", "XXL"];
  final List<String> colors = ["BLACK", "WHITE", "BLUE", "GREEN", "RED"];
  int _selectedSize = 1;
  int _selectedColors = 1;
  int _quantity = 1;
  bool added = false;

  @override
  Widget build(BuildContext context) {
    final List arguments = ModalRoute.of(context).settings.arguments;
    final Product product = arguments[0];
    bool cartAdded = arguments[1];
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(added: cartAdded),
      drawer: MyDrawer(),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 240,
              padding: EdgeInsets.only(bottom: 10.0),
              width: width,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey[300]),
              ),
              child: Stack(children: [
                Center(
                    child: Hero(
                  tag: product.title,
                  child:
                      Image.asset('assets/clothes.jpeg', fit: BoxFit.fitHeight),
                )),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          print("pressed icon in img");
                        },
                        icon: Icon(Icons.ac_unit)),
                  ),
                )
              ]),
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
                            style: Theme.of(context).textTheme.subtitle1),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        tooltip: "Description of product",
                        icon: pressed
                            ? SvgPicture.asset('assets/icons/arrow-up.svg',
                                height: width / 22)
                            : SvgPicture.asset('assets/icons/arrow-down.svg',
                                height: width / 22),
                        onPressed: () {
                          setState(() {
                            pressed = !pressed;

                            print(pressed);
                            print("Dropdown icon");
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 0.8,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(height: 0.8, color: Colors.grey[300]),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(0, 0.8),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.only(top: 30.0),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: 65,
                        child: Text("Size",
                            style: Theme.of(context).textTheme.headline3)),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: sizes.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ChoiceChip(
                              selectedColor: Colors.green,
                              selected: _selectedSize == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  _selectedSize =
                                      selected ? index : _selectedSize;
                                });
                              },
                              label: Container(
                                width: 35,
                                child: Text(
                                  sizes[index],
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: 65,
                        child: Text("Color",
                            style: Theme.of(context).textTheme.headline3)),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: colors.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ChoiceChip(
                              selectedColor: Colors.green,
                              selected: _selectedColors == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  _selectedColors =
                                      selected ? index : _selectedColors;
                                });
                              },
                              label: Container(
                                width: 60,
                                child: Text(
                                  colors[index],
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 70,
                margin: EdgeInsets.only(top: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 65,
                        child: Text("Quantity"),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: IconButton(
                              icon: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 25,
                                    color: Colors.deepOrange[700],
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "$_quantity",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          IconButton(
                            icon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 25,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                          )
                        ],
                      )),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            width: 1.5, color: Colors.greenAccent[400])),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout', arguments: {
                          'product': product,
                          'quantity': _quantity
                        });
                      },
                      child: Text("BUY NOW"),
                    ),
                  ),
                  added
                      ? Container(
                          height: 30,
                          width: 70,
                          margin: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[700],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Transform.translate(
                            offset: Offset(0, -5.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  added = false;
                                });
                              },
                              icon: Icon(Icons.check),
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent[700],
                              borderRadius: BorderRadius.circular(20.0)),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                added = true;
                              });
                            },
                            child: Text("ADD TO CART",
                                style: Theme.of(context).textTheme.headline5),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
