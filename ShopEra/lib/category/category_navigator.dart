import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'categorynew.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CategoryNavigator extends StatefulWidget {
  final category_id;
  const CategoryNavigator({Key key, this.category_id}) : super(key: key);
  @override
  _CategoryNavigatorState createState() =>
      _CategoryNavigatorState(this.category_id);
}

class _CategoryNavigatorState extends State<CategoryNavigator> {
  var category_id;
  _CategoryNavigatorState(this.category_id);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory(category_id);
  }

  List category_products;
  List category_items;
  void getCategory(var id) async {
    final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/getCategory.php"),
        body: {"parent_id": id});
    category_items = jsonDecode(response.body);
    if (category_items.length != 0) {
      // print(category_items);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Category(
                category_id: category_id,
                category_items: category_items,
                product: false);
          },
        ),
      );
    } else {
      final response1 = await http.post(
          Uri.parse("https://shopera-app01.000webhostapp.com/getCategoryProducts.php"),
          body: {"category_id": id});
      category_products = jsonDecode(response1.body);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Category(
                category_id: category_id,
                category_items: category_products,
                product: true);
          },
        ),
      );
    }

    // for (int i = 0; i < products_list.length; ++i) {
    //   if (products_list[i]["p_category"] == category_id) {
    //     category_products.add(products_list[i]);
    //   }
    // }\|/-

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return Category(
    //           category_id: category_id, category_items: category_products);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    print("CategoryNavigator called");
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        backgroundColor: color,
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
