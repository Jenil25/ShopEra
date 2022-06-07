// import 'package:flutter/material.dart';
// import 'package:startup_try_2/models/Product.dart';
// import 'package:startup_try_2/screens/details/details_screen.dart';
// import 'order_details.dart';
//
// class MyOrders extends StatefulWidget {
//   final Order order;
//   const MyOrders({Key key, this.order}) : super(key: key);
//
//   @override
//   _MyOrdersState createState() => _MyOrdersState(order);
// }
//
// class _MyOrdersState extends State<MyOrders> {
//   // List<Product> product = [
//   //   Product(
//   //       id: 1,
//   //       title: "Office Code",
//   //       price: 234,
//   //       size: 12,
//   //       description: dummyText,
//   //       review: dummyreview,
//   //       image: "assets/images/bag_1.png",
//   //       rating: 4.0,
//   //       done: false,
//   //       incart: false,
//   //       color: Color(0xFF3D82AE)),
//   //   Product(
//   //       id: 2,
//   //       title: "Belt Bag",
//   //       price: 234,
//   //       size: 8,
//   //       description: dummyText,
//   //       review: dummyreview,
//   //       image: "assets/images/bag_2.png",
//   //       rating: 4.5,
//   //       done: false,
//   //       incart: false,
//   //       color: Color(0xFFD3A984)),
//   //   Product(
//   //       id: 3,
//   //       title: "Hang Top",
//   //       price: 234,
//   //       size: 10,
//   //       description: dummyText,
//   //       review: dummyreview,
//   //       image: "assets/images/bag_3.png",
//   //       rating: 3.5,
//   //       done: false,
//   //       incart: false,
//   //       color: Color(0xFF989493)),
//   //   Product(
//   //       id: 4,
//   //       title: "Old Fashion",
//   //       price: 234,
//   //       size: 11,
//   //       description: dummyText,
//   //       review: dummyreview,
//   //       image: "assets/images/bag_4.png",
//   //       rating: 3.0,
//   //       done: false,
//   //       incart: false,
//   //       color: Color(0xFFE6B398)),
//   //   Product(
//   //       id: 5,
//   //       title: "Office Code",
//   //       price: 234,
//   //       size: 12,
//   //       description: dummyText,
//   //       review: dummyreview,
//   //       image: "assets/images/bag_5.png",
//   //       rating: 4.5,
//   //       done: false,
//   //       incart: false,
//   //       color: Color(0xFFFB7883)),
//   //   Product(
//   //     id: 6,
//   //     title: "Office Code",
//   //     price: 234,
//   //     size: 12,
//   //     description: dummyText,
//   //     review: dummyreview,
//   //     image: "assets/images/bag_6.png",
//   //     rating: 4.0,
//   //     done: false,
//   //     incart: false,
//   //     color: Color(0xFFAEAEAE),
//   //   ),
//   // ];
//   // Order order;
//
//   Order order;
//   _MyOrdersState(this.order);
//
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
//         itemCount: orders.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             margin: EdgeInsets.all(10.0),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             color: Colors.blue.shade100,
//             child: Container(
//               margin: EdgeInsets.all(5.0),
//               height: 100.0,
//               padding: EdgeInsets.only(left: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => OrderDetails(
//                                       order: orders[index],
//                                     )));
//                       });
//                     },
//                     child: Container(
//                       // width: 100.0,
//                       alignment: Alignment.centerLeft,
//                       child: Column(
//                         children: <Widget>[
//                           Text("Order Date: ${orders[index].date}"),
//                           Container(
//                             child: Text(
//                               " ADD REPEAT BUTTON!!!!!!!!!Products: ${orders[index].products[0].title}",
//                               style: TextStyle(
//                                 color: Colors.blue.shade900,
//                                 fontSize: 30.0,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
