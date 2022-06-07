import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

// var cart_shop = 0;
// bool checkcartshop(var s_id) {
//   // print("s_id type");
//   // print(s_id.runtimeType);
//   // print(s_id);
//   // print(0.runtimeType);
//   print("cart_temp");
//   print(cart_temp);
//   if (cart_temp.isNotEmpty) {
//     cart_shop = int.parse(cart_temp_products[0]["s_id"].toString());
//   }
//   if (cart_shop == 0) {
//     cart_shop = s_id;
//     return true;
//   } else {
//     if (s_id == cart_shop) {
//       return true;
//     }
//     return false;
//   }
// }

var cart_temp = [], cart_temp_products = [];
void tempcart(var user_id) async {
  // print("TempcartCalled");
  // print(user_id);
  final response = await http
      .post((Uri.parse("https://shopera-app01.000webhostapp.com/getCartData.php")), body: {"u_id": user_id});
  cart_temp = jsonDecode(response.body);
  // cart_length = cart_temp.length;
  // var k = 0;
  for (var i = 0; i < cart_list.length; i++) {
    for (var j = 0; j < products_list.length; j++) {
      if (cart_temp[i]["p_id"] == products_list[j]["p_id"]) {
        if (cart_temp_products.contains(products_list[j]) == false) {
          cart_temp_products.add(products_list[j]);
          // cart_temp_products[k]["qty"] = int.parse(cart_list[i]["qty"]);
          // cart_temp_products[k]["c_id"] = cart_list[i]["c_id"];
          // k++;
          // qty.add(cart_list[i]["qty"]);
        }
      }
    }
  }
}

var delivery_user;
var shop_user;

var variables;
var delivery_charges, support_mail, delivery_mail;
void GetVariables() async {
  final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/getVariables.php"));
  variables = jsonDecode(response.body);
  delivery_charges = int.parse(variables[0]["delivery_charges"]);
  support_mail = variables[0]["support_mail"];
  delivery_mail = variables[0]["delivery_mail"];
  print("delivery_charges type = ");
  print(delivery_charges.runtimeType);
}

Future<List> editUserDetails(var uid, var contact_no, var address) async {
  print("Inside function");
  final response = await http.post(Uri.parse(
      "https://shopera-app01.000webhostapp.com/updateUserDetails.php"),
      body: {"uid": uid, "contact_no": contact_no, "address": address});
}

Future<List> editDeliveryUserDetails(
    var dpid, var contact_no, var address) async {
  print("Inside editDeliveryUserDetails function");
  final response = await http.post(Uri.parse(
      "https://shopera-app01.000webhostapp.com/updateDeliveryUserDetails.php"),
      body: {"dpid": dpid, "contact_no": contact_no, "address": address});
}

Future<List> editShopUserDetails(var sid, var contact_no, var address) async {
  print("Inside editShopUserDetails function");
  final response = await http.post(Uri.parse(
      "https://shopera-app01.000webhostapp.com/updateShopUserDetails.php"),
      body: {"sid": sid, "contact_no": contact_no, "address": address});
}

Color color = Color(0xFF1B0250);
var search_count = 0;

List shops;
var shop_length;
void Datashop() async {
  final response = await http.get(Uri.parse("https://shopera-app01.000webhostapp.com/getShopData.php"));
  shops = jsonDecode(response.body);
  shop_length = shops.length;
  // for(int i=0;i<list.[])
  try {
    // print("Not here");
    // print(shops[0]);
  } catch (e) {
    print(e);
  }
  //return shops;
}

List categories;
void Datacategory() async {
  final response = await http.get(Uri.parse("https://shopera-app01.000webhostapp.com/getCategory.php"));
  categories = jsonDecode(response.body);
  print("categories");
  print(categories);
}

var deliveryemail = [];
void Datadelivery() async {
  final response =
      await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/getDeliveryAccount.php"));
  deliveryemail = jsonDecode(response.body);
  print(deliveryemail);
  print("Inside func");
  // try {
  // } catch (e) {
  // }
}

bool loaded_product = false;
var products_list = [];
var length = 1;
void Dataproduct() async {
  final response = await http.get(Uri.parse("https://shopera-app01.000webhostapp.com/getProductData.php"));
  products_list = jsonDecode(response.body);
  print("DATA PRODUCT called");
  length = products_list.length;
  loaded_product = true;
  // for(int i=0;i<list.[])
  try {
    // print(list[0]["p_name"]);
  } catch (e) {
    print(e);
  }
}

// bool loaded_object = false;
var all_categories = [];
void Dataobject() async {
  final response = await http.get(Uri.parse("https://shopera-app01.000webhostapp.com/getAllCategory.php"));
  all_categories = jsonDecode(response.body);
  // loaded_object = true;
}

bool loaded_product_image = false;
var product_image_list = [];
var product_image_length;
void Dataimage() async {
  final response = await http.get(Uri.parse("https://shopera-app01.000webhostapp.com/getProductImage.php"));
  product_image_list = jsonDecode(response.body);
  product_image_length = product_image_list.length;
  loaded_product_image = true;
  // for(int i=0;i<list.[])
  try {
    // print(list[0]["p_name"]);
  } catch (e) {
    print(e);
  }
}

var shop_owner;
Future<bool> shopAccount(var email) async {
  final response = await http
      .post(Uri.parse("https://shopera-app01.000webhostapp.com/getShopAccount.php"), body: {email: email});
  shop_owner = jsonDecode(response.body);
  // for(int i=0;i<list.[])
  try {
    // print(list[0]["p_name"]);
  } catch (e) {
    print(e);
  }
  if (shop_owner != null) {
    return true;
  }
  return false;
}

var fav_list = [];
var fav_length;
var loaded_fav = false;
var fav_products = [];

final TransformationController _transformationController =
    TransformationController();
var images = [];
void getimages(var p_id) {
  images = [];
  for (var i in product_image_list) {
    if (i["p_id"] == p_id) {
      images.add(InteractiveViewer(
          transformationController: _transformationController,
          onInteractionEnd: (details) {
            _transformationController.value = Matrix4.identity();
          },
          child: Image.network(
            "https://shopera-app01.000webhostapp.com/image/${i["p_image"]}",
            fit: BoxFit.contain,
          )));
      print(images);
    }
  }
}

var carousal_images;
List cardList = [];
void CarousalImages() async {
  final response = await http.post(Uri.parse(
    "https://shopera-app01.000webhostapp.com/offer_images/carousal/getImages.php"),
  );
  carousal_images = jsonDecode(response.body);
  cardList.clear();
  for (int i = 0; i < carousal_images.length; ++i) {
    cardList.add(Image.network(
        "https://shopera-app01.000webhostapp.com/offer_images/carousal/${carousal_images[i]["ci_name"]}",
        fit: BoxFit.cover));
  }
  print(cardList);
}

var offer_images;
List l = [];
void OfferImages() async {
  final response = await http.post(Uri.parse(
    "https://shopera-app01.000webhostapp.com/offer_images/getOfferImages.php"),
  );
  offer_images = jsonDecode(response.body);
  l.clear();
  for (int i = 0; i < offer_images.length; i++) {
    l.add([
      "https://shopera-app01.000webhostapp.com/offer_images/${offer_images[i]["oi_name"]}",
      int.parse(offer_images[i]["oi_priority"])
    ]);
  }
  var toswap;
  for (int i = 0; i < l.length; ++i) {
    for (int j = i; j < l.length; ++j) {
      if (l[i][1] > l[j][1]) {
        toswap = l[i];
        l[i] = l[j];
        l[j] = toswap;
      }
    }
  }
}

bool loaded_uid = false;
var users,
    user_uid = "",
    user_name = "",
    user_mob = "",
    user_address = "",
    user_email = "";
void GetUser(String email) async {
  final response = await http
      .post(Uri.parse("https://shopera-app01.000webhostapp.com/getUserPost.php"), body: {"u_email": email});
  users = jsonDecode(response.body);
  user_uid = users[0]["u_id"];
  user_name = users[0]["u_name"];
  user_mob = users[0]["u_mobile"];
  user_address = users[0]["u_address"];
  user_email = users[0]["u_email"];
  loaded_uid = true;
  try {} catch (e) {
    print(e);
  }
}

Future<List> sendtocart(var u_id, var p_id) async {
  final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/uploadCart.php"),
      body: {"u_id": u_id, "p_id": p_id});
}

Future<List> sendtofav(var u_id, var p_id) async {
  final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/uploadFavourite.php"),
      body: {"u_id": u_id, "p_id": p_id});
}

Future<List> sendratingdata(var rating, var p_id) async {
  final response =
      await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/uploadRating.php"), body: {
    "u_id": user_uid,
    "p_id": p_id,
    "rating": rating,
  });
}

bool loaded_cart = false;
var c_count = 0;
var cart;
var cart_list = [];
var cart_length = 1;
var cart_products = [];
// void GetCart(var u_id) async {
//   // cart_products.clear();
//   print("User_uid");
//   print(u_id);
//   final response = await http
//       .post(Uri.parse("https://shopera-app01.000webhostapp.com/getCartData.php", body: {"u_id": u_id});
//   // final response2 = await http.patch("url");
//   cart_list = jsonDecode(response.body);
//   cart_length = cart_list.length;
//   loaded_cart = true;
//   loaded_cart = true;
//   print("Inside getcart");
//   for (var i = 0; i < cart_list.length; i++) {
//     for (var j = 0; j < products_list.length; j++) {
//       if (cart_list[i]["p_id"] == products_list[j]["p_id"]) {
//         if (cart_products.contains(products_list[j]) == false) {
//           cart_products.add(products_list[j]);
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

var qty = [];

var ratingdata;
var rated_value = 3;
bool rated = false;
var q;
Future<List> checkrating(var p_id) async {
  rated = false;
  final response = await http.get(Uri.parse("https://shopera-app01.000webhostapp.com/getRatingData.php"));
  ratingdata = jsonDecode(response.body);
  for (var i = 0; i < ratingdata.length; i++) {
    if (ratingdata[i]["u_id"] == user_uid && ratingdata[i]["p_id"] == p_id) {
      print("RAting checked");
      // rated_value = int.parse(ratingdata[i]["value"]);
      // q = double.parse(ratingdata[i]["value"]);
      rated_value = int.parse(ratingdata[i]["value"]);
      rated = true;
      // print(q);
      print(rated);
      print(rated_value);
    }
  }
}

// bool diss = false;

// Future<List> deleteCartProduct(var uid, var p_id) async {
//   final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/deleteCart.php",
//       body: {"u_id": uid, "p_id": p_id});
// }

Future<List> deleteFavProduct(var uid, var p_id) async {
  final response = await http.post(Uri.parse(
      "https://shopera-app01.000webhostapp.com/deleteFavouriteProduct.php"),
      body: {"u_id": uid, "p_id": p_id});
}

// var oid;
// var oid_arr;
// Future<List> sendtoorder(var u_id, var datetime, var amount) async {
//   final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/uploadOrder.php",
//       body: {"u_id": u_id, "datetime": datetime, "amount": amount});
//   oid_arr = jsonDecode(response.body);
//   oid = oid_arr[0]["o_id"];
// }

// var order_index;
// Future<List> sendtoorderindex(var products, var oid) async {
//   final response = await http.post(Uri.parse(
//       "https://shopera-app01.000webhostapp.com/uploadOrderIndex.php",
//       body: {"products": products, "oid": oid});
//   order_index = jsonDecode(response.body);
// }

// var orderindexdata;
// Future<List> getorderindex(var u_id) async {
//   final response = await http
//       .post(Uri.parse("https://shopera-app01.000webhostapp.com/getOrdersIndex.php", body: {"u_id": u_id});
//   orderindexdata = jsonDecode(response.body); //Contains all oid of the user.
// }

// var orderdata;
// var allorderproducts;
// Future<List> getorderdata(var o_id) async {
//   final response = await http
//       .post(Uri.parse("https://shopera-app01.000webhostapp.com/getOrdersData.php", body: {"o_id": o_id});
//   orderdata = jsonDecode(response.body); //Contains pid and sid of all orders
//   for (int i = 0; i < orderdata.length; i++) {
//     if (orderdata[i]["p_id"] == products_list[i]["p_id"]) {
//       allorderproducts.add(products_list[i]);
//     }
//   }
// }

int checkcode(var code) {
  int sid = 0;
  print("checkcode");
  for (int i = 0; i < shops.length; i++) {
    if (code.toUpperCase() == shops[i]["r_code"].toUpperCase()) {
      sid = int.parse(shops[i]["s_id"]);
      print("SHop");
      return sid;
    }
  }
  return 0;
}

void incrShopSignups(var sid) async {
  print("incr shop");
  final response = await http
      .post(Uri.parse("https://shopera-app01.000webhostapp.com/incrShopSignups.php"), body: {"sid": sid});
  print("after ");
}

// var orderid;
// void confirmOrder(var uid, var amount, var name, var mobile_number,
//     var address1, var address2, var city, var mode, var products) async {
//   final response =
//       await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/confirmOrder.php", body: {
//     "uid": uid,
//     "status": "0",
//     "datetime": DateTime.now().toString(),
//     "amount": amount.toString(),
//     "name": name.toString(),
//     "mobile_number": mobile_number.toString(),
//     "address1": address1,
//     "address2": address2,
//     "city": city,
//     "mode": mode
//   });
//   orderid = jsonDecode(response.body);
//   confirmOrderProducts(products, orderid);
// }
//
// bool orderconfirmed = false;
// void confirmOrderProducts(var products, var oid) async {
//   for (var product in products) {
//     final response = await http
//         .post(Uri.parse("https://shopera-app01.000webhostapp.com/confirmOrderProducts.php", body: {
//       "pid": product["p_id"].toString(),
//       "sid": product["s_id"].toString(),
//       "oid": oid.toString()
//     });
//   }
//   orderconfirmed = true;
//   print("inside confirm order products");
// }

// void temp() async {
//   Timer(Duration(seconds: 3), () {
//     print("orderconfirmed = true");
//     orderconfirmed = true;
//   });
// }

List cities;
void DataCities() async {
  final response = await http.get(Uri.parse("https://shopera-app01.000webhostapp.com/getCities.php"));
  cities = jsonDecode(response.body);
}
