import 'package:ecommerce_app/utils/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/drawer.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> with TickerProviderStateMixin {
  bool pressed = false;
  final List<String> sizes = ["XS", "S", "M", "L", "XL", "XXL"];
  final List<String> colors = ["BLACK", "WHITE", "BLUE", "GREEN", "RED"];
  int _selectedSize = 1;
  int _selectedColors = 1;
  int _quantity = 1;
  bool isFav = false;
  bool added = false;
  double dy = 0.0;

  Animation<Color> _animFavcolor;
  Animation<double> _animFavsize;
  AnimationController _animController;

  GlobalKey widgetKey = GlobalKey();
  double size = 0.0;
  String descr =
      "hidden hiddenhiddenhiddenhiddenhiddenhiddenhiddenhiddenhidden";
  Animation<Offset> _animationOffset;
  AnimationController _animOffsetController;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      duration: Duration(milliseconds: 350),
      vsync: this,
    );

    _animFavcolor =
        ColorTween(begin: Colors.grey[400], end: Colors.redAccent[700])
            .animate(_animController);

    _animFavsize = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(_animController);

    _animOffsetController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _animationOffset = Tween<Offset>(begin: Offset.zero, end: Offset(0, 0.2))
        .animate(CurvedAnimation(
            parent: _animOffsetController, curve: Curves.easeInOutQuad));

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final keyContext = widgetKey.currentContext;
      if (keyContext != null) {
        setState(() {
          size = keyContext.size.height;
          print(size);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
    _animOffsetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List arguments = ModalRoute.of(context).settings.arguments;
    final Product product = arguments[0];
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.grey[300],
                              Colors.grey[300],
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 20,
                        icon: Icon(Icons.arrow_back, color: Colors.black54)),
                  ),
                ),
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
                    child: AnimatedBuilder(
                        animation: _animController,
                        builder: (context, _) {
                          return IconButton(
                              iconSize: _animFavsize.value,
                              onPressed: () {
                                isFav
                                    ? _animController.reverse()
                                    : _animController.forward();
                                isFav = !isFav;
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: _animFavcolor.value,
                              ));
                        }),
                  ),
                ),
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
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(product.brand,
                            style: Theme.of(context).textTheme.subtitle1),
                      ),
                      Align(
                        alignment: Alignment.topRight,
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
                            dy = pressed ? 40.0 : 0;
                            //     ? _animOffsetController.forward()
                            //     : _animOffsetController.reverse();
                          });
                        },
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    height: pressed ? size : 0,
                    child: Text(descr),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              transform: Matrix4.translationValues(0, dy, 0),
              child: Column(
                children: [
                  Opacity(
                    key: widgetKey,
                    opacity: 0,
                    child: Text(descr),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 0.7,
                  ),
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(top: 17.0),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 65,
                              child: Text("Size",
                                  style:
                                      Theme.of(context).textTheme.headline3)),
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
                                  style:
                                      Theme.of(context).textTheme.headline3)),
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
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 25,
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    "$_quantity",
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                                IconButton(
                                  icon: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 23,
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
                  Divider(),
                  SizedBox(height: 20),
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
                              Navigator.pushNamed(context, '/checkout',
                                  arguments: {
                                    'product': product,
                                    'quantity': _quantity
                                  });
                            },
                            child: Text("BUY NOW"),
                          ),
                        ),
                        AnimatedContainer(
                          curve: Curves.elasticInOut,
                          duration: Duration(milliseconds: 400),
                          height: 30,
                          width: added ? 70 : 150,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent[700],
                              borderRadius: BorderRadius.circular(20.0)),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                added = !added;
                              });
                            },
                            child: added
                                ? Icon(Icons.check, color: Colors.white)
                                : Text("ADD TO CART",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                          ),
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
    );
  }
}
