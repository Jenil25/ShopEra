import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (20)),
        child: ListView.builder(
          itemCount: fav_products.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 88,
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding: EdgeInsets.all((10)),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:
                            // Container()
                            Image.network(
                                "https://shopera-app01.000webhostapp.com/image/${fav_products[index]["p_id"]}_1.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          fav_products[index]["p_name"],
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Rs.${fav_products[index]["sp"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          Container(
                            width: 40,
                            child: FlatButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  //setState(()

                                  // loaded = false;
                                  deleteFavProduct(
                                      user_uid, fav_products[index]["p_id"]);
                                  fav_products.removeAt(index);
                                  // qty.removeAt(index);
                                  setState(() {});

                                  // setState(() {
                                  // });
                                  //print(cart_products);
                                  // Future.delayed(Duration(seconds: 3), () {
                                  //   loaded = true;
                                  //   //setState(() {});
                                  // });
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: MediaQuery.of(context).size.width / 15,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Favourites",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${fav_products.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
