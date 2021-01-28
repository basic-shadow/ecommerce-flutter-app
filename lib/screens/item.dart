import 'package:ecommerce_app/utils/product.dart';
import 'package:flutter/material.dart';
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
  bool isFav = false;

  Animation<Color> _animFavcolor;
  Animation<double> _animFavsize;
  AnimationController _animController;

  GlobalKey widgetKey = GlobalKey();
  String descr =
      "hidden hiddenhiddenhiddenhiddenhiddenhiddenhiddenhiddenhidden";
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
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
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
    final CartList cartList = arguments[1];
    final _width = MediaQuery.of(context).size.width;
    final List<Product> list = List();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.grey[300]),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 20,
                            icon: Icon(Icons.arrow_back, color: Colors.black)),
                      ),
                    ),
                    Center(
                        child: Hero(
                      tag: product.title,
                      child: Image.asset('assets/clothes.jpeg',
                          fit: BoxFit.fitHeight),
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
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
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
                                    color: Colors.blueGrey[800],
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w500,
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
                                    height: _width / 22)
                                : SvgPicture.asset(
                                    'assets/icons/arrow-down.svg',
                                    height: _width / 22),
                            onPressed: () {
                              setState(() {
                                pressed = !pressed;
                                pressed
                                    ? _animOffsetController.forward()
                                    : _animOffsetController.reverse();
                              });
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizeTransition(
                            child: Text(descr),
                            sizeFactor: CurvedAnimation(
                                parent: _animOffsetController,
                                curve: Curves.easeInOutQuad),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2,
                                        color: Colors.blueGrey[300],
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.white,
                                  selectedColor: Colors.teal[400],
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
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2,
                                        color: Colors.blueGrey[300],
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.white,
                                  selectedColor: Colors.teal[600],
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
                                        color: product.quantity > 1
                                            ? Colors.deepOrange[700]
                                            : Colors.grey[400],
                                      )),
                                  onPressed: product.quantity > 1
                                      ? () {
                                          setState(() {
                                            product.quantity--;
                                          });
                                        }
                                      : null,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  "${product.quantity}",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              IconButton(
                                icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[700],
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 23,
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  setState(() {
                                    product.quantity++;
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
                                width: 2, color: Colors.blueGrey[400])),
                        child: FlatButton(
                          onPressed: () {
                            list.add(product);
                            Navigator.pushNamed(context, '/checkout',
                                arguments: list);
                          },
                          child: Text("BUY NOW"),
                        ),
                      ),
                      AnimatedContainer(
                        curve: Curves.elasticInOut,
                        duration: Duration(milliseconds: 400),
                        height: 30,
                        width: product.added ? 70 : 150,
                        decoration: BoxDecoration(
                            color: Colors.teal[400],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              product.added
                                  ? cartList.removeProduct(product)
                                  : cartList.addProduct(product);
                              product.toggle();
                            });
                          },
                          child: product.added
                              ? Icon(Icons.check, color: Colors.white)
                              : Text("ADD TO CART",
                                  style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
