// import 'package:flutter/material.dart';
// // import 'file:///C:/Users/Dell/AndroidStudioProjects/startup_try_2/lib/Cart/default_button.dart';
// import 'package:startup_try_2/models/Product.dart';
// //import 'package:shop_app/components/default_button.dart';
//
// class CheckoutCard extends StatelessWidget {
//   const CheckoutCard({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: (15),
//         horizontal: (30),
//       ),
//       // height: 174,
//       decoration: BoxDecoration(
//         color: Colors.lightGreen,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, -15),
//             blurRadius: 20,
//             color: Color(0xFFDADADA).withOpacity(0.15),
//           )
//         ],
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     text: "Total:\n",
//                     children: [
//                       TextSpan(
//                         text: "\$337",
//                         style: TextStyle(fontSize: 16, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: (190),
//                   child: DefaultButton(
//                     text: "Check Out",
//                     press: () {},
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
