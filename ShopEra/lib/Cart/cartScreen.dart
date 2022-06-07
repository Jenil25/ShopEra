import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/Cart/cart_card.dart';
import 'package:startup_try_2/homepage.dart';
//import 'file:///C:/Users/Dell/AndroidStudioProjects/startup_try_2/lib/Cart/check_out_card.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/proceed_to_buy.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:startup_try_2/Cart/cart_counter.dart';
import 'package:startup_try_2/Place Order/order_details.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

var total = 0; //GLOBAL TO USE IT IN proceed_to_buy
var loaded = true;

class _CartState extends State<Cart> {
  void deleteCartProduct(var uid, var cart_product, var index) async {
    // Navigator.push(
    //   context,
    //   new MaterialPageRoute(
    //     builder: (context) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text("Loading"),
    //         ),
    //         body: Container(
    //           child: Text("Loading"),
    //         ),
    //       );
    //     },
    //   ),
    // );
    final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/deleteCart.php"),
        body: {"u_id": uid, "p_id": cart_product["p_id"]});

    total = total - (int.parse(cart_product["sp"]) * cart_product["qty"]);
    cart_products.removeAt(index);
    qty.removeAt(index);
    // if (cart_products.isEmpty) {
    //   cart_shop = 0;
    // }
    setState(() {
      loaded = true;
    });
    // GetCart(user_uid);
    // setState(() {});
    // GetCart(uid);
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
  //   // loaded_cart = true;
  //   print("Inside getcart");
  //   cart_products.clear();
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
  //
  //   for (int i = 0; i < cart_products.length; ++i) {
  //     total += int.parse(cart_products[i]["sp"]) * int.parse(qty[i]);
  //   }
  //
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return cart_products.length == 0
  //             ? Scaffold(
  //                 appBar: AppBar(
  //                   title: Text("Your Cart"),
  //                   leading: FlatButton(
  //                     onPressed: () {
  //                       Navigator.of(context)
  //                           .popUntil((route) => route.isFirst);
  //                     },
  //                     child: Icon(Icons.arrow_back),
  //                   ),
  //                 ),
  //                 body: Column(
  //                   children: [
  //                     Spacer(
  //                       flex: 1,
  //                     ),
  //                     Container(
  //                       width: MediaQuery.of(context).size.width,
  //                       child: Image.asset(
  //                           "assets/images/errorpages/userCartEmpty.png"),
  //                     ),
  //                     Text(
  //                       "Your cart is Empty!\nClick below to add products",
  //                       style: TextStyle(
  //                         fontSize: MediaQuery.of(context).size.width / 16,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                     Spacer(
  //                       flex: 1,
  //                     ),
  //                     Container(
  //                       width: MediaQuery.of(context).size.width / 3,
  //                       decoration: BoxDecoration(
  //                         color: Colors.green,
  //                         borderRadius: BorderRadius.circular(20.0),
  //                       ),
  //                       child: FlatButton(
  //                         onPressed: () {
  //                           Navigator.push(
  //                               context,
  //                               new MaterialPageRoute(
  //                                   builder: (context) => HomePage()));
  //                         },
  //                         child: Text(
  //                           "Add Products",
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ),
  //                     ),
  //                     Spacer(
  //                       flex: 5,
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             : Scaffold(
  //                 appBar: buildAppBar(context),
  //                 body: Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: (20)),
  //                   child: ListView.builder(
  //                     itemCount: cart_products.length,
  //                     itemBuilder: (context, index) => Padding(
  //                       padding: EdgeInsets.symmetric(vertical: 10),
  //                       child: Container(
  //                         child: Row(
  //                           children: [
  //                             SizedBox(
  //                               width: 88,
  //                               child: AspectRatio(
  //                                 aspectRatio: 0.88,
  //                                 child: Container(
  //                                   padding: EdgeInsets.all((10)),
  //                                   decoration: BoxDecoration(
  //                                     color: Color(0xFFF5F6F9),
  //                                     borderRadius: BorderRadius.circular(15),
  //                                   ),
  //                                   child:
  //                                       // Container()
  //                                       Image.network(
  //                                           "https://shoperaweb.com/image/${cart_products[index]["p_id"]}_1.png"),
  //                                 ),
  //                               ),
  //                             ),
  //                             SizedBox(width: 20),
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Container(
  //                                   width:
  //                                       MediaQuery.of(context).size.width * 0.5,
  //                                   child: Text(
  //                                     cart_products[index]["p_name"],
  //                                     style: TextStyle(
  //                                         color: Colors.black, fontSize: 16),
  //                                     maxLines: 3,
  //                                   ),
  //                                 ),
  //                                 SizedBox(height: 10),
  //                                 Row(
  //                                   children: [
  //                                     Text.rich(
  //                                       TextSpan(
  //                                         text:
  //                                             "Rs.${cart_products[index]["sp"]}",
  //                                         style: TextStyle(
  //                                           fontWeight: FontWeight.w600,
  //                                         ),
  //                                         children: [
  //                                           TextSpan(
  //                                               text: "   x1",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .bodyText1),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     SizedBox(
  //                                       width:
  //                                           MediaQuery.of(context).size.width /
  //                                               5,
  //                                     ),
  //                                     Container(
  //                                       width: 40,
  //                                       child: FlatButton(
  //                                           onPressed: () {
  //                                             //setState(()
  //                                             // loaded = false;
  //                                             deleteCartProduct(user_uid,
  //                                                 cart_products[index], index);
  //                                             // total = total -
  //                                             //     int.parse(cart_products[index]
  //                                             //         ["sp"]);
  //                                             // cart_products.removeAt(index);
  //                                             // qty.removeAt(index);
  //                                             // GetCart(user_uid);
  //                                             // setState(() {});
  //
  //                                             // setState(() {
  //                                             // });
  //                                             // print(cart_products);
  //                                             // Future.delayed(Duration(seconds: 3), () {
  //                                             //   loaded = true;
  //                                             //   //setState(() {});
  //                                             // });
  //                                           },
  //                                           child: Icon(
  //                                             Icons.delete,
  //                                             size: MediaQuery.of(context)
  //                                                     .size
  //                                                     .width /
  //                                                 20,
  //                                           )),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 bottomNavigationBar: Container(
  //                   padding: EdgeInsets.symmetric(
  //                     vertical: (15),
  //                     horizontal: (30),
  //                   ),
  //                   // height: 174,
  //                   decoration: BoxDecoration(
  //                     color: Color(0xFF042F69),
  //                     borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(30),
  //                       topRight: Radius.circular(30),
  //                     ),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         offset: Offset(0, -15),
  //                         blurRadius: 20,
  //                         color: Color(0xFFDADADA).withOpacity(0.15),
  //                       )
  //                     ],
  //                   ),
  //                   child: SafeArea(
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text.rich(
  //                               TextSpan(
  //                                 text: "Total:\n",
  //                                 style: TextStyle(color: Colors.white),
  //                                 children: [
  //                                   TextSpan(
  //                                     text: "Rs. $total",
  //                                     style: TextStyle(
  //                                         fontSize: 16, color: Colors.white),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: (190),
  //                               child: SizedBox(
  //                                 width: double.infinity,
  //                                 height: (56),
  //                                 child: FlatButton(
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(20),
  //                                   ),
  //                                   color: Colors.amber,
  //                                   onPressed: () {
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(
  //                                         builder: (context) => ProceedToBuy(
  //                                             buynow: cart_products),
  //                                       ),
  //                                     );
  //                                   },
  //                                   child: Text(
  //                                     "Check Out",
  //                                     style: TextStyle(
  //                                       fontSize: (18),
  //                                       color: Colors.black,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //       },
  //     ),
  //   );
  // }

  // bool loaded = false;
  //bool called = false;
  //bool update = false;

  // void sum() {
  //   for (int i = 0; i < cart_products.length; ++i) {
  //     total += int.parse(cart_products[i]["sp"]) * int.parse(qty[i]);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // total = 0;
    return loaded
        ? cart_products.length == 0
            ? Scaffold(
                appBar: AppBar(
                  title: Text("Your Cart"),
                  // leading: FlatButton(
                  //   onPressed: () {
                  //     Navigator.of(context).popUntil((route) => route.isFirst);
                  //   },
                  //   child: Icon(Icons.arrow_back),
                  // ),
                ),
                body: Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                          "assets/images/errorpages/userCartEmpty.png"),
                    ),
                    Text(
                      "Your cart is Empty!\nClick below to add products",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          "Add Products",
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
              )
            : Scaffold(
                appBar: buildAppBar(context),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: (20)),
                  child: ListView.builder(
                    itemCount: cart_products.length,
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
                                          "https://shopera-app01.000webhostapp.com/image/${cart_products[index]["p_id"]}_1.png"),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    cart_products[index]["p_name"],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    maxLines: 3,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            "Rs.${cart_products[index]["sp"]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          // TextSpan(
                                          //     text: "   x1",
                                          //     style: Theme.of(context)
                                          //         .textTheme
                                          //         .bodyText1),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                    ),
                                    Container(
                                      width: 40,
                                      child: FlatButton(
                                          onPressed: () {
                                            //setState(()
                                            // loaded = false;
                                            setState(() {
                                              loaded = false;
                                            });
                                            deleteCartProduct(user_uid,
                                                cart_products[index], index);
                                            // total = total -
                                            //     int.parse(cart_products[index]
                                            //         ["sp"]);
                                            // cart_products.removeAt(index);
                                            // qty.removeAt(index);
                                            // GetCart(user_uid);
                                            // setState(() {});

                                            // setState(() {
                                            // });
                                            // print(cart_products);
                                            // Future.delayed(Duration(seconds: 3), () {
                                            //   loaded = true;
                                            //   //setState(() {});
                                            // });
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20,
                                          )),
                                    ),
                                  ],
                                ),
                                CartCounter(product: cart_products[index]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: (15),
                    horizontal: (30),
                  ),
                  // height: 174,
                  decoration: BoxDecoration(
                    color: Color(0xFF042F69),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -15),
                        blurRadius: 20,
                        color: Color(0xFFDADADA).withOpacity(0.15),
                      )
                    ],
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Total:\n",
                                style: TextStyle(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: "Rs. $total",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: (190),
                              child: SizedBox(
                                  width: double.infinity,
                                  height: (56),
                                  child: Column(
                                    children: [
                                      // FlatButton(
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(20),
                                      //   ),
                                      //   color: Colors.amber,
                                      //   onPressed: () {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ProceedToBuy(
                                      //                 buynow: cart_products),
                                      //       ),
                                      //     );
                                      //   },
                                      //   child: Text(
                                      //     "Check Out",
                                      //     style: TextStyle(
                                      //       fontSize: (18),
                                      //       color: Colors.black,
                                      //     ),
                                      //   ),
                                      // ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.amber,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  // ProceedToBuy(
                                                  //     buynow: cart_products),
                                                  OrderSummary(
                                                products: cart_products,
                                                placed: false,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Check Out",
                                          style: TextStyle(
                                            fontSize: (18),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
        : Scaffold(
            appBar: AppBar(
              title: Text("Your Cart"),
            ),
            body: CircularProgressIndicator(),
          );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "${cart_products.length} items",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
