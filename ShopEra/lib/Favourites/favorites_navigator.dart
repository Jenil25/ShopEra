import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'favorites.dart';

class FavouritesNavigator extends StatefulWidget {
  @override
  _FavouritesNavigatorState createState() => _FavouritesNavigatorState();
}

class _FavouritesNavigatorState extends State<FavouritesNavigator> {
  @override
  void initState() {
    super.initState();
    GetFav(user_uid);
  }

  void GetFav(var u_id) async {
    fav_products.clear();
    final favresponse = await http.post(
        Uri.parse("https://shopera-app01.000webhostapp.com/getFavouriteData.php"),
        body: {"u_id": u_id});
    fav_list = jsonDecode(favresponse.body);
    fav_length = fav_list.length;
    loaded_fav = true;
    for (var i = 0; i < fav_list.length; i++) {
      for (var j = 0; j < products_list.length; j++) {
        if (fav_list[i]["p_id"] == products_list[j]["p_id"]) {
          if (fav_products.contains(products_list[j]) == false) {
            fav_products.add(products_list[j]);
          }
        }
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Favourites();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
