import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:startup_try_2/models/Product.dart';
import 'cartScreen.dart';

class CartNavigator extends StatefulWidget {
  @override
  _CartNavigatorState createState() => _CartNavigatorState();
}

class _CartNavigatorState extends State<CartNavigator> {
  @override
  void initState() {
    super.initState();
    GetCart(user_uid);
  }

  void GetCart(var u_id) async {
    final response = await http
        .post(Uri.parse("https://shopera-app01.000webhostapp.com/getCartData.php"), body: {"u_id": u_id});
    cart_list = jsonDecode(response.body);
    cart_length = cart_list.length;
    cart_products.clear();
    var k = 0;
    for (var i = 0; i < cart_list.length; i++) {
      for (var j = 0; j < products_list.length; j++) {
        if (cart_list[i]["p_id"] == products_list[j]["p_id"]) {
          if (cart_products.contains(products_list[j]) == false) {
            cart_products.add(products_list[j]);
            cart_products[k]["qty"] = int.parse(cart_list[i]["qty"]);
            cart_products[k]["c_id"] = cart_list[i]["c_id"];
            k++;
            qty.add(cart_list[i]["qty"]);
          }
        }
      }
    }
    // cart_products[0]["qty"] = 2;
    print(cart_products);
    // print(qty);

    total = 0;
    for (int i = 0; i < cart_products.length; ++i) {
      total += int.parse(cart_products[i]["sp"]) * cart_products[i]["qty"];
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Cart();
          // cart_products.length == 0
          //     ? Scaffold(
          //   appBar: AppBar(
          //     title: Text("Your Cart"),
          //     leading: FlatButton(
          //       onPressed: () {
          //         Navigator.of(context)
          //             .popUntil((route) => route.isFirst);
          //       },
          //       child: Icon(Icons.arrow_back),
          //     ),
          //   ),
          //   body: Column(
          //     children: [
          //       Spacer(
          //         flex: 1,
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         child: Image.asset(
          //             "assets/images/errorpages/userCartEmpty.png"),
          //       ),
          //       Text(
          //         "Your cart is Empty!\nClick below to add products",
          //         style: TextStyle(
          //           fontSize: MediaQuery.of(context).size.width / 16,
          //           fontWeight: FontWeight.bold,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //       Spacer(
          //         flex: 1,
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width / 3,
          //         decoration: BoxDecoration(
          //           color: Colors.green,
          //           borderRadius: BorderRadius.circular(20.0),
          //         ),
          //         child: FlatButton(
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 new MaterialPageRoute(
          //                     builder: (context) => HomePage()));
          //           },
          //           child: Text(
          //             "Add Products",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //       Spacer(
          //         flex: 5,
          //       ),
          //     ],
          //   ),
          // )
          //     : Scaffold(
          //   appBar: buildAppBar(context),
          //   body: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: (20)),
          //     child: ListView.builder(
          //       itemCount: cart_products.length,
          //       itemBuilder: (context, index) => Padding(
          //         padding: EdgeInsets.symmetric(vertical: 10),
          //         child: Container(
          //           child: Row(
          //             children: [
          //               SizedBox(
          //                 width: 88,
          //                 child: AspectRatio(
          //                   aspectRatio: 0.88,
          //                   child: Container(
          //                     padding: EdgeInsets.all((10)),
          //                     decoration: BoxDecoration(
          //                       color: Color(0xFFF5F6F9),
          //                       borderRadius: BorderRadius.circular(15),
          //                     ),
          //                     child:
          //                     // Container()
          //                     Image.network(
          //                         "https://shoperaweb.com/image/${cart_products[index]["p_id"]}_1.png"),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(width: 20),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Container(
          //                     width:
          //                     MediaQuery.of(context).size.width * 0.5,
          //                     child: Text(
          //                       cart_products[index]["p_name"],
          //                       style: TextStyle(
          //                           color: Colors.black, fontSize: 16),
          //                       maxLines: 3,
          //                     ),
          //                   ),
          //                   SizedBox(height: 10),
          //                   Row(
          //                     children: [
          //                       Text.rich(
          //                         TextSpan(
          //                           text:
          //                           "Rs.${cart_products[index]["sp"]}",
          //                           style: TextStyle(
          //                             fontWeight: FontWeight.w600,
          //                           ),
          //                           children: [
          //                             TextSpan(
          //                                 text: "   x1",
          //                                 style: Theme.of(context)
          //                                     .textTheme
          //                                     .bodyText1),
          //                           ],
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width:
          //                         MediaQuery.of(context).size.width /
          //                             5,
          //                       ),
          //                       Container(
          //                         width: 40,
          //                         child: FlatButton(
          //                             onPressed: () {
          //                               //setState(()
          //                               // loaded = false;
          //                               deleteCartProduct(user_uid,
          //                                   cart_products[index], index);
          //                               // total = total -
          //                               //     int.parse(cart_products[index]
          //                               //         ["sp"]);
          //                               // cart_products.removeAt(index);
          //                               // qty.removeAt(index);
          //                               // GetCart(user_uid);
          //                               // setState(() {});
          //
          //                               // setState(() {
          //                               // });
          //                               // print(cart_products);
          //                               // Future.delayed(Duration(seconds: 3), () {
          //                               //   loaded = true;
          //                               //   //setState(() {});
          //                               // });
          //                             },
          //                             child: Icon(
          //                               Icons.delete,
          //                               size: MediaQuery.of(context)
          //                                   .size
          //                                   .width /
          //                                   20,
          //                             )),
          //                       ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          //   bottomNavigationBar: Container(
          //     padding: EdgeInsets.symmetric(
          //       vertical: (15),
          //       horizontal: (30),
          //     ),
          //     // height: 174,
          //     decoration: BoxDecoration(
          //       color: Color(0xFF042F69),
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(30),
          //         topRight: Radius.circular(30),
          //       ),
          //       boxShadow: [
          //         BoxShadow(
          //           offset: Offset(0, -15),
          //           blurRadius: 20,
          //           color: Color(0xFFDADADA).withOpacity(0.15),
          //         )
          //       ],
          //     ),
          //     child: SafeArea(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text.rich(
          //                 TextSpan(
          //                   text: "Total:\n",
          //                   style: TextStyle(color: Colors.white),
          //                   children: [
          //                     TextSpan(
          //                       text: "Rs. $total",
          //                       style: TextStyle(
          //                           fontSize: 16, color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: (190),
          //                 child: SizedBox(
          //                   width: double.infinity,
          //                   height: (56),
          //                   child: FlatButton(
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(20),
          //                     ),
          //                     color: Colors.amber,
          //                     onPressed: () {
          //                       Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (context) => ProceedToBuy(
          //                               buynow: cart_products),
          //                         ),
          //                       );
          //                     },
          //                     child: Text(
          //                       "Check Out",
          //                       style: TextStyle(
          //                         fontSize: (18),
          //                         color: Colors.black,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
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
