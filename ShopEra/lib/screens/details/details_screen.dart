import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/constants.dart';
import 'package:startup_try_2/main.dart';
// import 'package:startup_try_2/Cart/cartScreen.dart';
import 'package:startup_try_2/Cart/cart_navigator.dart';
import '../details/components/rateproduct.dart';
// import 'package:startup_try_2/cart.dart';
import 'package:startup_try_2/proceed_to_buy.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:http/http.dart' as http;
// import 'package:startup_try_2/Favourites/favorites_navigator.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'file:///C:/Users/Dell/AndroidStudioProjects/startup_try_2/lib/Cart/cartScreen.dart';
// import 'package:startup_try_2/favorites.dart';

class DetailsScreen extends StatefulWidget {
  final product, incart, infav, images;

  const DetailsScreen(
      {Key key, this.product, this.incart, this.infav, this.images})
      : super(key: key);

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState(this.product, this.incart, this.infav, this.images);
}

class _DetailsScreenState extends State<DetailsScreen> {
  var product, incart, infav;
  List<InteractiveViewer> images;
  _DetailsScreenState(this.product, this.incart, this.infav, this.images);
  int _currentIndex = 0;

  bool addFav = false;
  // bool incart = false;
  // var infav = false;

  // @override
  // void initState() {
  //   super.initState();
  //   present();
  // }

  // var shops = [];
  // var shop_length = 1;
  // void Datashop() async {
  //   final response =
  //       await http.get("https://shopera-app01.000webhostapp.com/shop_data.php");
  //   shops = jsonDecode(response.body);
  //   shop_length = shops.length;
  //   try {
  //     print(shops[0]["s_name"]);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // var list = [];
  // var length = 1;
  // void Data() async {
  //   final response =
  //       await http.get("https://shopera-app01.000webhostapp.com/getData.php");
  //   list = jsonDecode(response.body);
  //   length = list.length;
  //   // for(int i=0;i<list.[])
  //   try {
  //     // print(list[0]["p_name"]);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<List> sendpassworddata() async {
  //   final response =
  //   await http.post("http://raushanjha.in/insertdata.php", body: {
  //     "email": a.text,
  //     "password": mobile.text,
  //   });
  // }

  // ----------------------------------------------------------------------------------------
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
  //
  // void GetFav(var u_id) async {
  //   // cart_products.clear();
  //   print("User_uid");
  //   print(u_id);
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

  void present() {
    if (cart_products.contains(product)) {
      incart = true;
    }
    if (fav_products.contains(product)) {
      infav = true;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
                title: Text("Loaded"),
                leading: FlatButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Icon(Icons.arrow_back),
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  ${product["p_name"]}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: color, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: kDefaultPaddin),
                  Container(
                    // color: Colors.pink,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Hero(
                        tag: "${product["p_id"]}",
                        child: images.length != 1
                            ? CarouselSlider(
                                options: CarouselOptions(
                                  viewportFraction: 1.5,
                                  height: 200,
                                ),
                                // onPageChanged: (index) {
                                //   setState(() {
                                //     _currentIndex = index;
                                //   });
                                // },
                                items: images.map((card) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Container(
                                      // color: Colors.red,
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.2,
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.9,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: card,
                                    );
                                  });
                                }).toList(),
                              )
                            : Container(
                                // width: size.width / 1.7,
                                height: 230,
                                child: images[0],
                              )
                        // Image.asset(
                        //         product.image,
                        //         fit: BoxFit.fill,
                        //       ),
                        ),
                  ),
                  SizedBox(height: kDefaultPaddin),
                  Container(
                      padding: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width / 20,
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: "Price\n"),
                                      TextSpan(
                                        text: "Rs. ${product["sp"]}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                child: infav == true
                                    ? RaisedButton(
                                        highlightColor: Colors.transparent,
                                        elevation: 0,
                                        color: color,
                                        onPressed: () {
                                          setState(() {
                                            infav = false;
                                            deleteFavProduct(
                                                user_uid, product["p_id"]);
                                          });
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.orange,
                                        ))
                                    : RaisedButton(
                                        highlightColor: Colors.transparent,
                                        elevation: 0,
                                        color: color,
                                        onPressed: () {
                                          setState(() {
                                            infav = true;
                                            sendtofav(
                                                user_uid, product["p_id"]);
                                          });
                                        },
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.orange,
                                        )),
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPaddin / 10),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              Text(
                                '${product["rating"]}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16.0,
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 20),
                            child: Text(
                              product["p_description"],
                              style: TextStyle(
                                // fontSize: 16.0,
                                height: 1.5,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(height: kDefaultPaddin / 10),
                          SizedBox(height: kDefaultPaddin / 10),
                          // RateProduct(product: product),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              // BuyNow(product: product),
                              // Cart(product: product),
                              Container(
                                margin: EdgeInsets.only(left: 0),
                                color: Colors.deepOrange,
                                width: MediaQuery.of(context).size.width / 2,
                                // height: 10,
                                child: FlatButton(
                                  onPressed: () {
                                    var buynow =
                                        []; //TO CONVERT product INTO AN ARRAY FOR proceed_to_buy PAGE.
                                    buynow.add(product);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProceedToBuy(buynow: buynow),
                                      ),
                                    );
                                  },
                                  child: Text('Buy Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      )),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width / 2,
                                child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        // if (checkcartshop(
                                        //     int.parse(product["s_id"]))) {
                                        incart = true;
                                        sendtocart(user_uid, product["p_id"]);
                                        // } else {
                                        //   Alert Dialog Box
                                        // }
                                      });
                                    },
                                    child: incart == false
                                        ? Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 20.0,
                                            ),
                                          )
                                        : FlatButton(
                                            onPressed: () {
                                              // GetCart(user_uid);
                                              // Future.delayed(
                                              //     Duration(seconds: 3), () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CartNavigator()));
                                              // });
                                            },
                                            child: Text(
                                              'View Cart',
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          )),
                              )
                              // Cart(product: product),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // var images = [];
  // void getimages() {
  //   for (var i in product_image_list) {
  //     if (i["p_id"] == product["p_id"]) {
  //       images
  //           .add(Image.network("https://shoperaweb.com/image/${i["p_image"]}"));
  //       print(images);
  //     }
  //   }
  // }

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    checkInternet();
    Size size = MediaQuery.of(context).size;
    // getimages(product["p_id"]);
    // checkrating(product["p_id"]);
    // GetCart(user_uid);
    // GetFav(user_uid);
    // present();
    // Future.delayed(Duration(seconds: 3), () {
    //   setState(() {
    //     loaded = true;
    //   });
    // });
    search_count++;
    return connected
        ? Scaffold(
            backgroundColor: Colors.white,
            //Color(0xFFD6E4F0),
            appBar: AppBar(
              backgroundColor: color,
              elevation: 0,
              leading: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                Container(
                  width: size.width / 7,
                  child: FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        // GetCart(user_uid);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartNavigator()));
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )),
                ),
                SizedBox(width: kDefaultPaddin / 2)
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  ${product["p_name"]}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: color, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: kDefaultPaddin),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Hero(
                        tag: "${product["p_id"]}",
                        child: images.length != 1
                            ? CarouselSlider(
                                options: CarouselOptions(
                                  viewportFraction: 1.5,
                                  height: 200,
                                ),
                                // onPageChanged: (index) {
                                //   setState(() {
                                //     _currentIndex = index;
                                //   });
                                // },
                                items: images.map((card) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: card,
                                    );
                                  });
                                }).toList(),
                              )
                            : Container(
                                // width: size.width / 1.7,
                                height: 230,
                                child: images[0],
                              )
                        // Image.asset(
                        //         product.image,
                        //         fit: BoxFit.fill,
                        //       ),
                        ),
                  ),
                  SizedBox(height: kDefaultPaddin),
                  Container(
                      padding: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width / 20,
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: "Price\n"),
                                      TextSpan(
                                        text: "Rs. ${product["sp"]}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                child: infav == true
                                    ? RaisedButton(
                                        highlightColor: Colors.transparent,
                                        elevation: 0,
                                        color: color,
                                        onPressed: () {
                                          setState(() {
                                            infav = false;
                                            deleteFavProduct(
                                                user_uid, product["p_id"]);
                                          });
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.orange,
                                        ))
                                    : RaisedButton(
                                        highlightColor: Colors.transparent,
                                        elevation: 0,
                                        color: color,
                                        onPressed: () {
                                          setState(() {
                                            infav = true;
                                            sendtofav(
                                                user_uid, product["p_id"]);
                                          });
                                        },
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.orange,
                                        )),
                              ),
                            ],
                          ),
                          SizedBox(height: kDefaultPaddin / 10),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              Text(
                                '${product["rating"]}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16.0,
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 20),
                            child: Text(
                              product["p_description"],
                              style: TextStyle(
                                // fontSize: 16.0,
                                height: 1.5,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(height: kDefaultPaddin / 10),
                          SizedBox(height: kDefaultPaddin / 10),
                          // RateProduct(product: product),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              // BuyNow(product: product),
                              // Cart(product: product),
                              Container(
                                margin: EdgeInsets.only(left: 0),
                                color: Colors.deepOrange,
                                width: MediaQuery.of(context).size.width / 2,
                                // height: 10,
                                child: FlatButton(
                                  onPressed: () {
                                    var buynow =
                                        []; //TO CONVERT product INTO AN ARRAY FOR proceed_to_buy PAGE.
                                    buynow.add(product);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProceedToBuy(buynow: buynow),
                                      ),
                                    );
                                  },
                                  child: Text('Buy Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      )),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width / 2,
                                child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        // if (checkcartshop(int.parse(
                                        //     product["s_id"].toString()))) {
                                        incart = true;
                                        sendtocart(user_uid, product["p_id"]);
                                        // }
                                        // else {
                                        //   AlertDialog alert = AlertDialog(
                                        //     title: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       children: <Widget>[
                                        //         Icon(
                                        //           Icons.error,
                                        //           color: Colors.red,
                                        //         ),
                                        //         Text(
                                        //           " Error",
                                        //           style: TextStyle(
                                        //               color: Colors.red,
                                        //               fontWeight:
                                        //                   FontWeight.bold),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     content: Text(
                                        //         "You cannot add products from different shops"),
                                        //   );
                                        //   showDialog(
                                        //     context: context,
                                        //     builder: (BuildContext context) {
                                        //       return alert;
                                        //     },
                                        //   );
                                        // }
                                      });
                                    },
                                    child: incart == false
                                        ? Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 20.0,
                                            ),
                                          )
                                        : FlatButton(
                                            onPressed: () {
                                              // GetCart(user_uid);
                                              // Future.delayed(
                                              //     Duration(seconds: 3), () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CartNavigator()));
                                              // });
                                            },
                                            child: Text(
                                              'View Cart',
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          )),
                              )
                              // Cart(product: product),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
            // loaded == true
            //     ? SingleChildScrollView(
            //         child: Column(
            //           children: [
            //             SizedBox(
            //               height: 20,
            //             ),
            //             Align(
            //               alignment: Alignment.centerLeft,
            //               child: Text(
            //                 "  ${product["p_name"]}",
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .headline5
            //                     .copyWith(
            //                         color: color, fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //             SizedBox(height: kDefaultPaddin),
            //             Container(
            //               width: size.width / 1.4,
            //               child: Hero(
            //                   tag: "${product["p_id"]}",
            //                   child: images.length != 1
            //                       ? CarouselSlider(
            //                           viewportFraction: 1.5,
            //                           height: 200,
            //                           onPageChanged: (index) {
            //                             setState(() {
            //                               _currentIndex = index;
            //                             });
            //                           },
            //                           items: images.map((card) {
            //                             return Builder(
            //                                 builder: (BuildContext context) {
            //                               return Container(
            //                                 decoration: BoxDecoration(
            //                                   borderRadius:
            //                                       BorderRadius.circular(30.0),
            //                                 ),
            //                                 child: card,
            //                               );
            //                             });
            //                           }).toList(),
            //                         )
            //                       : Container(
            //                           // width: size.width / 1.7,
            //                           height: 230,
            //                           child: images[0],
            //                         )
            //                   // Image.asset(
            //                   //         product.image,
            //                   //         fit: BoxFit.fill,
            //                   //       ),
            //                   ),
            //             ),
            //             SizedBox(height: kDefaultPaddin),
            //             Container(
            //                 padding: EdgeInsets.only(top: 30),
            //                 decoration: BoxDecoration(
            //                   color: color,
            //                   borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(24),
            //                     topRight: Radius.circular(24),
            //                   ),
            //                 ),
            //                 child: Column(
            //                   //mainAxisAlignment: MainAxisAlignment.end,
            //                   children: <Widget>[
            //                     Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: <Widget>[
            //                         // SizedBox(
            //                         //   width: MediaQuery.of(context).size.width / 20,
            //                         // ),
            //                         Padding(
            //                           padding:
            //                               const EdgeInsets.only(left: 15.0),
            //                           child: RichText(
            //                             text: TextSpan(
            //                               children: [
            //                                 TextSpan(text: "Price\n"),
            //                                 TextSpan(
            //                                   text: "Rs. ${product["sp"]}",
            //                                   style: Theme.of(context)
            //                                       .textTheme
            //                                       .headline5
            //                                       .copyWith(
            //                                           color: Colors.white,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                         Container(
            //                           color: Colors.transparent,
            //                           child: infav == true
            //                               ? RaisedButton(
            //                                   highlightColor:
            //                                       Colors.transparent,
            //                                   elevation: 0,
            //                                   color: color,
            //                                   onPressed: () {
            //                                     setState(() {
            //                                       infav = false;
            //                                       deleteFavProduct(user_uid,
            //                                           product["p_id"]);
            //                                     });
            //                                   },
            //                                   child: Icon(
            //                                     Icons.favorite,
            //                                     color: Colors.orange,
            //                                   ))
            //                               : RaisedButton(
            //                                   highlightColor:
            //                                       Colors.transparent,
            //                                   elevation: 0,
            //                                   color: color,
            //                                   onPressed: () {
            //                                     setState(() {
            //                                       infav = true;
            //                                       sendtofav(user_uid,
            //                                           product["p_id"]);
            //                                     });
            //                                   },
            //                                   child: Icon(
            //                                     Icons.favorite_border,
            //                                     color: Colors.orange,
            //                                   )),
            //                         ),
            //                       ],
            //                     ),
            //                     SizedBox(height: kDefaultPaddin / 10),
            //                     Row(
            //                       children: <Widget>[
            //                         SizedBox(
            //                           width: MediaQuery.of(context).size.width /
            //                               20,
            //                         ),
            //                         Text(
            //                           '${product["rating"]}',
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             fontSize: 16.0,
            //                           ),
            //                         ),
            //                         Icon(
            //                           Icons.star,
            //                           color: Colors.white,
            //                           size: 16.0,
            //                         )
            //                       ],
            //                     ),
            //                     Container(
            //                       margin: EdgeInsets.all(size.width / 20),
            //                       child: Text(
            //                         product["p_description"],
            //                         style: TextStyle(
            //                           // fontSize: 16.0,
            //                           height: 1.5,
            //                           color: Colors.white,
            //                         ),
            //                         textAlign: TextAlign.justify,
            //                       ),
            //                     ),
            //                     SizedBox(height: kDefaultPaddin / 10),
            //                     SizedBox(height: kDefaultPaddin / 10),
            //                     RateProduct(product: product),
            //                     Row(
            //                       crossAxisAlignment: CrossAxisAlignment.end,
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceAround,
            //                       children: <Widget>[
            //                         // BuyNow(product: product),
            //                         // Cart(product: product),
            //                         Container(
            //                           margin: EdgeInsets.only(left: 0),
            //                           color: Colors.deepOrange,
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           // height: 10,
            //                           child: FlatButton(
            //                             onPressed: () {
            //                               var buynow =
            //                                   []; //TO CONVERT product INTO AN ARRAY FOR proceed_to_buy PAGE.
            //                               buynow.add(product);
            //                               Navigator.push(
            //                                 context,
            //                                 MaterialPageRoute(
            //                                   builder: (context) =>
            //                                       ProceedToBuy(buynow: buynow),
            //                                 ),
            //                               );
            //                             },
            //                             child: Text('Buy Now',
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontSize: 20.0,
            //                                 )),
            //                           ),
            //                         ),
            //                         Container(
            //                           color: Colors.white,
            //                           width:
            //                               MediaQuery.of(context).size.width / 2,
            //                           child: FlatButton(
            //                               onPressed: () {
            //                                 setState(() {
            //                                   incart = true;
            //                                   sendtocart(
            //                                       user_uid, product["p_id"]);
            //                                 });
            //                               },
            //                               child: incart == false
            //                                   ? Text(
            //                                       'Add to Cart',
            //                                       style: TextStyle(
            //                                         color: Colors.deepOrange,
            //                                         fontSize: 20.0,
            //                                       ),
            //                                     )
            //                                   : FlatButton(
            //                                       onPressed: () {
            //                                         // GetCart(user_uid);
            //                                         // Future.delayed(
            //                                         //     Duration(seconds: 3), () {
            //                                         Navigator.push(
            //                                             context,
            //                                             MaterialPageRoute(
            //                                                 builder:
            //                                                     (context) =>
            //                                                         Cart()));
            //                                         // });
            //                                       },
            //                                       child: Text(
            //                                         'View Cart',
            //                                         style: TextStyle(
            //                                           color: Colors.deepOrange,
            //                                           fontSize: 20.0,
            //                                         ),
            //                                       ),
            //                                     )),
            //                         )
            //                         // Cart(product: product),
            //                       ],
            //                     )
            //                   ],
            //                 )),
            //           ],
            //         ),
            //       )
            //     :
            //     Align(
            //   alignment: Alignment.center,
            //   child: Container(
            //     color: Colors.blue[200],
            //     width: 70,
            //     height: 70,
            //     child: Padding(
            //       padding: const EdgeInsets.all(5.0),
            //       child: Center(
            //         child: CircularProgressIndicator(),
            //       ),
            //     ),
            //   ),
            // ),
          )
        : Scaffold(
            body: Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                Container(
                  width: size.width,
                  child: Image.asset("assets/images/errorpages/noInternet.png"),
                ),
                Text(
                  "No Internet!\nPlease check your connectivity!!",
                  style: TextStyle(
                    fontSize: size.width / 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text(
                      "Reload",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          );
  }
}
