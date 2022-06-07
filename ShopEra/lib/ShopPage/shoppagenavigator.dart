import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:startup_try_2/models/Product.dart';
import 'newshoppage.dart';

class ShopPageNavigator extends StatefulWidget {
  final shop;

  const ShopPageNavigator({Key key, this.shop}) : super(key: key);
  @override
  _ShopPageNavigatorState createState() => _ShopPageNavigatorState(this.shop);
}

class _ShopPageNavigatorState extends State<ShopPageNavigator> {
  var shop;
  _ShopPageNavigatorState(this.shop);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getObjects(shop["s_id"]);
  }

  var shop_objects;
  var category_products = [];
  void getObjects(var shop_id) async {
    final response = await http.post(
        Uri.parse("https://shopera-app01.000webhostapp.com/getShopCategory.php"),
        body: {"shop_id": shop_id});
    shop_objects = jsonDecode(response.body);
    var k = 0;
    var temp = [];
    // print("shop_objects");
    // print(shop_objects);
    for (var i in shop_objects) {
      category_products.add(temp);
      category_products[k] = [];
      for (var j in products_list) {
        if (i["category_id"] == j["p_category"] && shop_id == j["s_id"]) {
          // print("i&j");
          // print(i["category_id"]);
          // print(j["p_category"]);
          category_products[k].add(j);
        }
      }
      // print("category_products[k]");
      // print(k);
      // print(category_products[k]);
      k++;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => NewShopPage(
                shop: shop,
                shop_objects: shop_objects,
                category_products: category_products,
              )),
    );

    // for (var i in category_products) {
    //   for (var j in i) {
    //     print(j);
    //   }
    // print("1111111111111111111");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
