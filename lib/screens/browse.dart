import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/drawer.dart';
import 'dart:math';
import 'package:ecommerce_app/utils/product.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  bool added = false;

  void callback(bool add) {
    setState(() {
      added = add;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(added: added),
      body: BrowseScreen(added, callback),
      drawer: MyDrawer(),
    );
  }
}

class BrowseScreen extends StatefulWidget {
  final bool added;
  Function(bool) callback;
  BrowseScreen(this.added, this.callback);
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List<Product> products;
  final List<String> filter = [
    'All',
    'New-In',
    'Hot Deals',
    'Clothing',
    'Shoes',
    'Accessories'
  ];

  int _value = 0;
  List<MyCards> cards;

  TextEditingController _controller;
  void initState() {
    super.initState();

    final List<String> clothes =
        List.generate(10, (index) => "Title ${index + 1}");
    final List<String> brands = [
      'Adidas',
      'Nike',
    ];
    final List<String> prices = List.generate(10, (i) {
      int val = Random().nextInt(100);
      return "\$$val";
    });

    products = List.generate(
        10,
        (i) => Product(
            title: clothes[i % clothes.length],
            brand: brands[i % brands.length],
            price: prices[i % prices.length],
            type: filter.sublist(1)[i % filter.sublist(1).length]));

    _controller = TextEditingController();

    cards = List.generate(10, (i) => MyCards(products[i], widget.callback));
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 20.0),
            child: Text("Browse", style: Theme.of(context).textTheme.headline1),
          ),
        ),
        Center(
          child: Container(
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(width: 1.0, color: Colors.black26)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: Theme.of(context).textTheme.headline3,
                      controller: _controller,
                      maxLines: 1,
                      onSubmitted: (String val) {
                        print(val);
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                        ),
                        hintText: "Search",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                    ),
                  ),
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.search, size: 20),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Text("Pressed Search"),
                                content:
                                    Text("You searched ${_controller.text}"),
                                actions: [
                                  FlatButton(
                                      child: Text("Continue"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                ]);
                          });
                    },
                  ),
                ],
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          height: 30,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: filter.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Colors.green[200]),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.only(left: 10.0),
              width: 130,
              child: ChoiceChip(
                backgroundColor: Colors.white,
                selectedColor: Colors.green[300],
                labelStyle: _value == index
                    ? Theme.of(context).textTheme.headline5
                    : Theme.of(context).textTheme.headline3,
                label: Container(
                    child: Transform.translate(
                        offset: Offset(0, -3),
                        child: Center(child: Text(filter[index])))),
                selected: _value == index,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : _value;
                    print(filter[_value]);
                    print(widget.added);
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          height: 0.8,
          child: Container(height: 0.8, color: Colors.grey[300]),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0.8),
            )
          ]),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                children: _value == 0
                    ? cards
                    : cards
                        .where((card) => card.product.type == filter[_value])
                        .toList()),
          ),
        ),
      ],
    ));
  }
}

// ignore: must_be_immutable
class MyCards extends StatefulWidget {
  MyCards(this.product, this.callback);
  final Product product;
  bool added = false;
  final Function(bool) callback;

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 370,
      child: Card(
        elevation: 1.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(width: 2.0, color: Colors.grey[200]),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/item',
                arguments: [widget.product, widget.added]);
          },
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.product.title,
                  child: Image.asset(
                    "assets/clothes.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 15.0, left: 5.0, right: 5.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(width: 1.0, color: Colors.blueGrey[100]),
                ),
                child: Column(
                  children: [
                    Text(widget.product.title,
                        style: Theme.of(context).textTheme.headline4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.product.brand,
                            style: Theme.of(context).textTheme.subtitle1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.price,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.green[400],
                            ),
                          ),
                          widget.added
                              ? Container(
                                  height: 30,
                                  width: 70,
                                  margin: EdgeInsets.only(right: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Transform.translate(
                                    offset: Offset(0, -5.0),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.added = false;
                                          widget.callback(false);
                                        });
                                      },
                                      icon: Icon(Icons.check),
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : FlatButton(
                                  color: Colors.green[300],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.added = true;
                                      widget.callback(true);
                                    });
                                  },
                                  child: Text("Add to Cart",
                                      style: TextStyle(color: Colors.white)),
                                ),
                        ],
                      ),
                    ),
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
