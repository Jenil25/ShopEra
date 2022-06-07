// import 'dart:html';

import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class DetailsScreenNavigator extends StatefulWidget {
  final product;

  const DetailsScreenNavigator({Key key, this.product}) : super(key: key);

  @override
  _DetailsScreenNavigatorState createState() =>
      _DetailsScreenNavigatorState(this.product);
}

class _DetailsScreenNavigatorState extends State<DetailsScreenNavigator> {
  var product;
  _DetailsScreenNavigatorState(this.product);

  var incart = false, infav = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    present(user_uid);
  }

  void present(var u_id) async {
    cart_products.clear();
    // print("User_uid");
    // print(u_id);
    final cartresponse = await http
        .post(Uri.parse("https://shopera-app01.000webhostapp.com/getCartData.php"), body: {"u_id": u_id});
    // final response2 = await http.patch("url");
    cart_list = jsonDecode(cartresponse.body);
    cart_length = cart_list.length;
    loaded_cart = true;
    print("Inside getcart");
    for (var i = 0; i < cart_list.length; i++) {
      for (var j = 0; j < products_list.length; j++) {
        if (cart_list[i]["p_id"] == products_list[j]["p_id"]) {
          if (cart_products.contains(products_list[j]) == false) {
            cart_products.add(products_list[j]);
            qty.add(cart_list[i]["qty"]);
            // print(cart_products);
            print("Added product in cart");
          }
        }
      }
    }
    cart = Set.of(cart_products);

    fav_products.clear();
    final favresponse = await http.post(
        Uri.parse("https://shopera-app01.000webhostapp.com/getFavouriteData.php"),
        body: {"u_id": u_id});
    // final response2 = await http.patch("url");
    fav_list = jsonDecode(favresponse.body);
    fav_length = fav_list.length;
    loaded_fav = true;
    print("Inside getfav");
    for (var i = 0; i < fav_list.length; i++) {
      for (var j = 0; j < products_list.length; j++) {
        if (fav_list[i]["p_id"] == products_list[j]["p_id"]) {
          if (fav_products.contains(products_list[j]) == false) {
            fav_products.add(products_list[j]);
            // print(cart_products);
            print("Added product in fav");
          }
        }
      }
    }

    print("CartProducts in detailsScreenNavigator");
    print(cart_products);
    for (var i in cart_products) {
      if (i["p_id"] == product["p_id"]) {
        incart = true;
        break;
      }
    }

    for (var i in fav_products) {
      if (i["p_id"] == product["p_id"]) {
        infav = true;
        break;
      }
    }
    // if (cart_products.contains(product)) {
    //   //QTY VARIABLE
    //   print("if (cart_products.contains(product)) == true ");
    //   incart = true;
    // }
    // if (fav_products.contains(product)) {
    //   infav = true;
    // }

    final TransformationController _transformationController =
        TransformationController();
    List<InteractiveViewer> images = [];
    // List<Image> images;
    for (var i in product_image_list) {
      if (i["p_id"] == product["p_id"]) {
        images.add(InteractiveViewer(
          transformationController: _transformationController,
          onInteractionEnd: (details) {
            _transformationController.value = Matrix4.identity();
          },
          child: Image.network(
            "https://shopera-app01.000webhostapp.com/image/${i["p_image"]}",
            fit: BoxFit.contain,
          ),
        ));
      }
    }

    // InteractiveViewer(
    //   transformationController: _transformationController,
    //   onInteractionEnd: (details) {
    //     _transformationController.value = Matrix4.identity();
    //   },

    print("DetailsScreenNavigator");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailsScreen(
            product: product,
            incart: incart,
            infav: infav,
            images: images,
          );
        },
      ),
    );
  }

  // void GetCart(var u_id) async {
  //   // cart_products.clear();
  //   print("User_uid");
  //   print(u_id);
  //   final response = await http
  //       .post("https://shoperaweb.com/getCartData.php", body: {"u_id": u_id});
  //   // final response2 = await http.patch("url");
  //   cart_list = jsonDecode(response.body);
  //   cart_length = cart_list.length;
  //   loaded_cart = true;
  //   print("Inside getcart");
  //   for (var i = 0; i < cart_list.length; i++) {
  //     for (var j = 0; j < products_list.length; j++) {
  //       if (cart_list[i]["p_id"] == products_list[j]["p_id"]) {
  //         if (cart_products.contains(products_list[j]) == false) {
  //           cart_products.add(products_list[j]);
  //           qty.add(cart_list[i]["qty"]);
  //           // print(cart_products);
  //           print("Added product in cart");
  //         }
  //       }
  //     }
  //   }
  //   cart = Set.of(cart_products);
  //   try {} catch (e) {
  //     print(e);
  //   }
  // }

  // void GetFav(var u_id) async {
  //   // cart_products.clear();
  //   final response = await http.post(
  //       "https://shoperaweb.com/getFavouriteData.php",
  //       body: {"u_id": u_id});
  //   // final response2 = await http.patch("url");
  //   fav_list = jsonDecode(response.body);
  //   fav_length = fav_list.length;
  //   loaded_fav = true;
  //   print("Inside getfav");
  //   for (var i = 0; i < fav_list.length; i++) {
  //     for (var j = 0; j < products_list.length; j++) {
  //       if (fav_list[i]["p_id"] == products_list[j]["p_id"]) {
  //         if (fav_products.contains(products_list[j]) == false) {
  //           fav_products.add(products_list[j]);
  //           // print(cart_products);
  //           print("Added product in fav");
  //         }
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading"),
      ),
      body: CircularProgressIndicator(),
    );
  }
}
