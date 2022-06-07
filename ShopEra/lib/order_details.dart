// import 'package:flutter/material.dart';
// import 'package:startup_try_2/models/Product.dart';
//
// class OrderDetails extends StatefulWidget {
//   const OrderDetails({
//     Key key,
//     @required this.order,
//   }) : super(key: key);
//
//   final Order order;
//
//   @override
//   _OrderDetailsState createState() => _OrderDetailsState(this.order);
// }
//
// class _OrderDetailsState extends State<OrderDetails> {
//   Order order;
//   _OrderDetailsState(this.order);
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     var shops = ["Shop1", "Shop 2", "Shop 3", "Shop 4", "Shop 5", "Shop 6"];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade900,
//         title: Text(
//           "Order Details",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               // color: Colors.blue.shade500,
//               height: height / 4,
//               margin: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   SizedBox(width: 5.0),
//                   Text(
//                     "Shops: ",
//                     style:
//                         TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                         itemCount: shops.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Card(
//                             margin: EdgeInsets.all(10.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                             ),
//                             color: Colors.blue.shade100,
//                             child: Text(
//                               "${shops[index]}",
//                               style: TextStyle(
//                                   color: Colors.blue.shade900, fontSize: 20.0),
//                             ),
//                           );
//                         }),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Container(
//               // color: Colors.blue.shade500,
//               height: height / 15,
//               margin: const EdgeInsets.all(10.0),
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     "Price: Rs.",
//                     style:
//                         TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
//                   ),
//                   Text(
//                     "${order.order_id}",
//                     style:
//                         TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Container(
//               // color: Colors.blue.shade500,
//               height: height / 15,
//               margin: const EdgeInsets.all(10.0),
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     "Quantity: ",
//                     style: TextStyle(color: Colors.blue.shade900),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Container(
//               // color: Colors.blue.shade500,
//               // height: MediaQuery.of(context).size.height / 15,
//               margin: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: <Widget>[],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
