import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants.dart';

// int rated = 0;

class RateProduct extends StatefulWidget {
  final product;

  const RateProduct({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  _RateProductState createState() => _RateProductState(this.product);
}

class _RateProductState extends State<RateProduct> {
  var product;

  _RateProductState(this.product);

  void to_submit(bool rated) {}

  int rate_value = 0;

  @override
  Widget build(BuildContext context) {
    //int rated1 = int.parse("${product["star"]}");
    //double star = double.parse("${product["star"]}");
    var star = 1;
    //var ff = product["star"];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Container(
        child: Column(
          children: <Widget>[
            rated == false
                ? Column(
              children: <Widget>[
                Text(
                  'Rate the product',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5.0),
                SmoothStarRating(
                  isReadOnly: false,
                  size: 30.0,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: false,
                  spacing: 2.0,
                  color: Colors.yellowAccent,
                  borderColor: Colors.yellowAccent,
                  onRated: (double rating) {
                    rate_value = rating.toInt();
                    print("On rated");
                    print(rate_value);
                    // rated = 1;
                    // product["star"] = rating;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      star = 1;
                      rated = true;
                      rated_value = rate_value;
                      print("final rated");
                      print(rate_value);
                      // call function to insert data in database
                      sendratingdata(
                          rate_value.toString(), product["p_id"]);
                      // product["star"] == 0.5 || product["star"] == 0
                      //     ? product["rated"] = 0
                      //     : product["rated"] = 1;
                    });
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            )
                : Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Your Rating",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  SmoothStarRating(
                    isReadOnly: true,
                    size: 30.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: false,
                    rating: double.parse(rated_value.toString()),
                    spacing: 2.0,
                    color: Colors.yellow,
                    borderColor: Colors.yellow,
                    onRated: (double rating) {
                      rated = true;
                      rated_value = rating.toInt();
                      // product["star"] = rating;
                      print("final rated");
                    },
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
