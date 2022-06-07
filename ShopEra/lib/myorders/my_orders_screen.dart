//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';
// import 'delivery_card.dart';
import 'package:startup_try_2/myorders/my_orders_card.dart';
// import 'order_details.dart';
import 'package:startup_try_2/myorders/buynow_order_cart.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  var orders;
  @override
  void initState() {
    super.initState();
    getorders();
  }

  void getorders() async {
    final response = await http.post(
        Uri.parse("https://shopera-app01.000webhostapp.com/getOrdersIndex.php"),
        body: {"uid": user_uid});
    orders = jsonDecode(response.body);

    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Your Orders"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return
                                // Column(
                                // children: [Text(orders[index]["o_datetime"])],
                                // );
                                MyOrderCard(orders[index]);
                          },
                          itemCount: orders.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // getorderindex(user_uid);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   child: Expanded(
              //     child: ListView.builder(
              //       itemBuilder: (context, index) {
              //         return MyOrderCard(orderindexdata[index]);
              //       },
              //       itemCount: orderindexdata.length,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyOrders extends StatefulWidget {
//   final Order order;
//   const MyOrders({Key key, this.order}) : super(key: key);

//   @override
//   _MyOrdersState createState() => _MyOrdersState(order);
// }

// class _MyOrdersState extends State<MyOrders> {
//   List<Product> product = [
//     Product(
//         id: 1,
//         title: "Office Code",
//         price: 234,
//         size: 12,
//         description: dummyText,
//         review: dummyreview,
//         image: "assets/images/bag_1.png",
//         rating: 4.0,
//         done: false,
//         incart: false,
//         color: Color(0xFF3D82AE)),
//     Product(
//         id: 2,
//         title: "Belt Bag",
//         price: 234,
//         size: 8,
//         description: dummyText,
//         review: dummyreview,
//         image: "assets/images/bag_2.png",
//         rating: 4.5,
//         done: false,
//         incart: false,
//         color: Color(0xFFD3A984)),
//     Product(
//         id: 3,
//         title: "Hang Top",
//         price: 234,
//         size: 10,
//         description: dummyText,
//         review: dummyreview,
//         image: "assets/images/bag_3.png",
//         rating: 3.5,
//         done: false,
//         incart: false,
//         color: Color(0xFF989493)),
//     Product(
//         id: 4,
//         title: "Old Fashion",
//         price: 234,
//         size: 11,
//         description: dummyText,
//         review: dummyreview,
//         image: "assets/images/bag_4.png",
//         rating: 3.0,
//         done: false,
//         incart: false,
//         color: Color(0xFFE6B398)),
//     Product(
//         id: 5,
//         title: "Office Code",
//         price: 234,
//         size: 12,
//         description: dummyText,
//         review: dummyreview,
//         image: "assets/images/bag_5.png",
//         rating: 4.5,
//         done: false,
//         incart: false,
//         color: Color(0xFFFB7883)),
//     Product(
//       id: 6,
//       title: "Office Code",
//       price: 234,
//       size: 12,
//       description: dummyText,
//       review: dummyreview,
//       image: "assets/images/bag_6.png",
//       rating: 4.0,
//       done: false,
//       incart: false,
//       color: Color(0xFFAEAEAE),
//     ),
//   ];
//   Order order;

//   //Order order;
//   _MyOrdersState(this.order);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade900,
//         title: Text(
//           "Your Orders",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount:5,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             margin: EdgeInsets.all(10.0),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             color: Colors.blue.shade100,
//             child: Container(
//               //margin: EdgeInsets.all(5.0),
//               height: 50.0,
//               width: MediaQuery.of(context).size.width,
//               child: FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => OrderDetails(

//                                   order: orders[index],
//                                 )));
//                   });
//                 },
//                 child: Container(
//                   // width: 100.0,
//                   alignment: Alignment.center,
//                   child: Column(
//                     children: <Widget>[
//                       Text("Order ${index}",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize:(MediaQuery.of(context).size.width)/15 ),),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 'models/Product.dart';

// final priceTextStyle = TextStyle(
//   color: Colors.grey.shade600,
//   fontSize: 20.0,
//   fontWeight: FontWeight.bold,
// );

// final List<Order> _orders = orders;

// class MyOrders extends StatelessWidget {
//   //static final String path = "lib/src/pages/food/food_checkout.dart";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("My Orders"),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//       ),
//       extendBody: true,
//       extendBodyBehindAppBar: true,
//       // body: Column(
//       //   children: [
//       //     SizedBox(
//       //       height: double.maxFinite,
//       //       width: 80,
//       //       child: Ink(
//       //         decoration: BoxDecoration(
//       //           color: Colors.grey.shade200,
//       //         ),
//       //       ),
//       //     ),
//       //     ListView(
//       //       padding: const EdgeInsets.fromLTRB(
//       //         16.0,
//       //         kToolbarHeight + 40.0,
//       //         16.0,
//       //         16.0,
//       //       ),
//       //       children: [
//       //         // Text(
//       //         //   "My Order",
//       //         //   style: TextStyle(
//       //         //     color: Colors.black,
//       //         //     fontSize: 24.0,
//       //         //     fontWeight: FontWeight.bold,
//       //         //   ),
//       //         // ),
//       //         // const SizedBox(height: 30.0),
//       //         // ListView.builder(
//       //         //   itemBuilder: (context, i) => OrderListItem(
//       //         //     item: OrderItem(
//       //         //       price: _orders[i].products[i].price,
//       //         //       bgColor: _orders[i].products[i].color,
//       //         //       image: _orders[i].products[i].image,
//       //         //       title: _orders[i].products[i].title,
//       //         //       qty: 1,
//       //         //     ),
//       //         //   ),
//       //         //   itemCount: _orders.length,
//       //         // ),
//       //         OrderListItem(
//       //           item: OrderItem(
//       //             title: "Manana Burger",
//       //             qty: 2,
//       //             price: 12,
//       //             bgColor: Colors.deepOrange,
//       //             image: "assets/images/bag_1.png",
//       //           ),
//       //         ),
//       //         const SizedBox(height: 20.0),
//       //         OrderListItem(
//       //           item: OrderItem(
//       //               title: "Burger",
//       //               qty: 1,
//       //               price: 15,
//       //               bgColor: Colors.deepOrange,
//       //               image: "assets/images/bag_1.png"),
//       //         ),
//       //         const SizedBox(height: 20.0),
//       //         OrderListItem(
//       //           item: OrderItem(
//       //               title: "French Fries",
//       //               qty: 1,
//       //               price: 8,
//       //               bgColor: Colors.deepOrange,
//       //               image: "assets/images/bag_1.png"),
//       //         ),
//       //         const SizedBox(height: 20.0),
//       //         _buildDivider(),
//       //         const SizedBox(height: 20.0),
//       //         // Row(
//       //         //   children: [
//       //         //   //   const SizedBox(width: 40.0),
//       //         //   //   Text(
//       //         //   //     "VAT (10%)",
//       //         //   //     style: priceTextStyle,
//       //         //   //   ),
//       //         //   //   Spacer(),
//       //         //   //   Text(
//       //         //   //     "\$2",
//       //         //   //     style: priceTextStyle,
//       //         //   //   ),
//       //         //   //   const SizedBox(width: 20.0),
//       //         //   // ],
//       //         // ),
//       //         const SizedBox(height: 20.0),
//       //         //_buildDivider(),
//       //         const SizedBox(height: 10.0),
//       //         Row(
//       //           children: [
//       //             const SizedBox(width: 40.0),
//       //             Text(
//       //               "Total",
//       //               style: priceTextStyle.copyWith(color: Colors.black),
//       //             ),
//       //             Spacer(),
//       //             Text(
//       //               "\$49",
//       //               style: priceTextStyle.copyWith(color: Colors.indigo),
//       //             ),
//       //             const SizedBox(width: 20.0),
//       //           ],
//       //         ),
//       //         const SizedBox(height: 10.0),
//       //         Padding(
//       //           padding:
//       //               const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
//       //           child: RaisedButton(
//       //             padding: const EdgeInsets.all(16.0),
//       //             elevation: 0,
//       //             shape: RoundedRectangleBorder(
//       //                 borderRadius: BorderRadius.circular(15.0)),
//       //             color: Colors.yellow.shade700,
//       //             child: Text(
//       //               "Next",
//       //               style: TextStyle(
//       //                 fontWeight: FontWeight.bold,
//       //                 fontSize: 18.0,
//       //               ),
//       //             ),
//       //             onPressed: () {},
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ],
//       // ),
//     );
//   }

//   Container _buildDivider() {
//     return Container(
//       height: 2.0,
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade300,
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//     );
//   }
// }

// class OrderItem {
//   final String title;
//   final int qty;
//   final int price;
//   final String image;
//   final Color bgColor;
//   OrderItem({this.title, this.qty = 1, this.price, this.image, this.bgColor});
// }

// class OrderListItem extends StatelessWidget {
//   final OrderItem item;

//   const OrderListItem({Key key, this.item}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//               color: item.bgColor,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: item.image != null
//                 ? Image.asset(
//                     item.image,
//                     fit: BoxFit.cover,
//                   )
//                 : null,
//           ),
//           const SizedBox(width: 20.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   item.title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   height: 40.0,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         iconSize: 18.0,
//                         padding: const EdgeInsets.all(2.0),
//                         icon: Icon(Icons.remove),
//                         onPressed: () {},
//                       ),
//                       Text(
//                         "${item.qty}",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       IconButton(
//                         iconSize: 18.0,
//                         padding: const EdgeInsets.all(2.0),
//                         icon: Icon(Icons.add),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(width: 10.0),
//           Text(
//             "\$${item.price * item.qty}",
//             style: priceTextStyle,
//           ),
//         ],
//       ),
//     );
//   }
// }
