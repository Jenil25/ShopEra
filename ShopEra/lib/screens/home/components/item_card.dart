import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(tag: "${product["p_id"]}", child: Container()
                  // Image.asset(product.image),
                  ),
            ),
          ),
          SizedBox(
            height: height / 90,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              "${product["p_name"]}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: width / 20),
            ),
          ),
          Text(
            "Rs.${product["sp"]}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: width / 20),
          )
        ],
      ),
    );
  }
}
