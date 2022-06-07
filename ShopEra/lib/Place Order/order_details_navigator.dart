import 'package:flutter/material.dart';

class OrderSummaryNavigator extends StatefulWidget {
  final products;
  final placed;
  const OrderSummaryNavigator({Key key, this.products, this.placed})
      : super(key: key);
  @override
  _OrderSummaryNavigatorState createState() =>
      _OrderSummaryNavigatorState(this.products, this.placed);
}

class _OrderSummaryNavigatorState extends State<OrderSummaryNavigator> {
  var products;
  var placed = false;
  _OrderSummaryNavigatorState(this.products, this.placed);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetNumberOfShops(products);
  }

  int GetNumberOfShops(var products) {
    Set shops;
    for (var i in products) {
      shops.add(i["s_id"]);
    }
    return shops.length;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
