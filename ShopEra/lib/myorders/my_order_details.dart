import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:startup_try_2/Cart/cartScreen.dart';
import 'package:startup_try_2/myorders/order_card.dart';
// import 'package:startup_try_2/total_price_card.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:startup_try_2/models/Product.dart';

class MyOrdersPage extends StatefulWidget {
  // final List fproducts;
  final order;
  final totalPrice;
  final discountPrice;
  final quantity;

  // MyOrdersPage(
  //   // this.fproducts,
  //   this.order,
  //   this.totalPrice,
  //   this.discountPrice,
  //   this.quantity,
  // );

  const MyOrdersPage(
      {Key key, this.order, this.totalPrice, this.discountPrice, this.quantity})
      : super(key: key);

  // final product;
  //
  // const DetailsScreen({Key key, this.product}) : super(key: key);
  //
  // @override
  // _DetailsScreenState createState() => _DetailsScreenState(this.product);
// }
//
// class _DetailsScreenState extends State<DetailsScreen> {
//   var product;
//   _DetailsScreenState(this.product);

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState(
      this.order, this.totalPrice, this.discountPrice, this.quantity);
}

var productids = [];
var products = [];

class _MyOrdersPageState extends State<MyOrdersPage> {
  var order;
  var totalPrice;
  var discountPrice;
  var quantity;
  _MyOrdersPageState(
      this.order, this.totalPrice, this.discountPrice, this.quantity);
  //int quantity = 2;
  // int totalItems() {
  //   int items = widget.quantity;
  //   for (int i = 0; i < widget.fproducts.length; i++) {
  //     //items = widget.fproducts[i].quantity+items;
  //   }
  //   return items;
  // }

  @override
  void initState() {
    super.initState();
    getproducts();
  }

  void getproducts() async {
    final response = await http.post(
        Uri.parse("https://shopera-app01.000webhostapp.com/getOrderProducts.php"),
        body: {"oid": order["o_id"]});
    productids = jsonDecode(response.body);

    print("productids\n");
    print(productids);
    print("order[oid]\n");
    print(order["o_id"]);
    // var c = 0;
    products.clear();
    for (var i = 0; i < productids.length; i++) {
      for (var j = 0; j < products_list.length; j++) {
        if (productids[i]["p_id"] == products_list[j]["p_id"]) {
          products.add(products_list[j]);
          // products[c] = products_list[j];
          // c++;
          print("Inside if\n");
        }
      }
    }
    print("products\n");
    print(products);

    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Your Orders"),
            ),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: products.length <= 2
                        ? products.length == 1
                            ? MediaQuery.of(context).size.height * 0.25
                            : MediaQuery.of(context).size.height * 0.4
                        : MediaQuery.of(context).size.height * 0.52,
                    child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => OrderCard(
                          product: products[index],
                        ),
                        itemCount: products.length,
                      ),
                    ),
                  ),
                  //total price card
                  Card(
                    elevation: 8,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ListTile(
                                  title: Text('Price Details'),
                                  // subtitle: Text('${totalItems()} Items'),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 5,
                          ),
                          Card(
                            child: Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            child: Text(
                                              '${products[index]["sp"]} ',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              'x quantity = '), //${widget.quantity}'),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            'sp*quantity '), //${products[index]["sp"] * widget.quantity} Rs.'),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: products.length,
                              ),
                            ),
                          ),
                          Divider(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sub Total: '),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${widget.totalPrice} Rs.'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount: '),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('- ${widget.discountPrice} Rs.'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Charges: '),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('+ 20.0 Rs.'),
                              ),
                            ],
                          ),
                          Divider(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount Price: '),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'difference '), //${widget.totalPrice - widget.discountPrice + 20} Rs.'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            child: Text("Loading"),
          )
          // Column(
          //   children: [
          //     Container(
          //       height: products.length <= 2
          //           ? products.length == 1
          //               ? MediaQuery.of(context).size.height * 0.25
          //               : MediaQuery.of(context).size.height * 0.4
          //           : MediaQuery.of(context).size.height * 0.52,
          //       child: Expanded(
          //         child: ListView.builder(
          //           shrinkWrap: true,
          //           //physics: NeverScrollableScrollPhysics(),
          //           itemBuilder: (context, index) => OrderCard(
          //             product: products[index],
          //           ),
          //           itemCount: products.length,
          //         ),
          //       ),
          //     ),
          //     //total price card
          //     Card(
          //       elevation: 8,
          //       child: Container(
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Container(
          //                   width: MediaQuery.of(context).size.width * 0.9,
          //                   child: ListTile(
          //                     title: Text('Price Details'),
          //                     // subtitle: Text('${totalItems()} Items'),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Divider(
          //               height: 5,
          //             ),
          //             Card(
          //               child: Expanded(
          //                 child: ListView.builder(
          //                   shrinkWrap: true,
          //                   //physics: NeverScrollableScrollPhysics(),
          //                   itemBuilder: (context, index) {
          //                     return Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Row(
          //                           children: [
          //                             Text('${products[index]["p_name"]} '),
          //                             SizedBox(
          //                               width: 10,
          //                             ),
          //                             Text('x ${widget.quantity}'),
          //                           ],
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.all(8.0),
          //                           child: Text(
          //                               '${products[index]["sp"] * widget.quantity} Rs.'),
          //                         ),
          //                       ],
          //                     );
          //                   },
          //                   itemCount: products.length,
          //                 ),
          //               ),
          //             ),
          //             Divider(
          //               height: 5,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text('Sub Total: '),
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text('${widget.totalPrice} Rs.'),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text('Discount: '),
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text('- ${widget.discountPrice} Rs.'),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text('Delivery Charges: '),
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text('+ 20.0 Rs.'),
          //                 ),
          //               ],
          //             ),
          //             Divider(
          //               height: 5,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text('Discount Price: '),
          //                 Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text(
          //                       '${widget.totalPrice - widget.discountPrice + 20} Rs.'),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ),
      //bottomNavigationBar: TotalPriceCard(),
    );
  }
}
