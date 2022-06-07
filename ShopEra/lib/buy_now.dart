import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'constants.dart';

class BuyNow extends StatefulWidget {
  const BuyNow({
    Key key,
    @required this.product,
  }) : super(key: key);

  final product;

  @override
  _BuyNowState createState() => _BuyNowState(this.product);
}

class _BuyNowState extends State<BuyNow> {
  var product;
  _BuyNowState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Now"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Container()],
      ),
    );
  }
}
