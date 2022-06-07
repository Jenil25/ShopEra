// import 'package:flutter/material.dart';
// import 'package:startup_try_2/models/Product.dart';
// class CartCard extends StatefulWidget {
//   final product;
//
//   const CartCard({Key key, this.product}) : super(key: key);
//   @override
//   _CartCardState createState() => _CartCardState(this.product);
// }
//
// class _CartCardState extends State<CartCard> {
//   var product;
//   _CartCardState(this.product);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: EdgeInsets.all((10)),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child:
//               // Container()
//               Image.network(
//                   "https://shoperaweb.com/image/${widget.product["p_id"]}_1.png"),
//             ),
//           ),
//         ),
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.5,
//               child: Text(
//                 widget.product["p_name"],
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//                 maxLines: 3,
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     text: "Rs.${widget.product["sp"]}",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                     ),
//                     children: [
//                       TextSpan(
//                           text: "   x1",
//                           style: Theme.of(context).textTheme.bodyText1),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width:MediaQuery.of(context).size.width/5,),
//                 Container(width: 40,
//                   child: FlatButton(onPressed: (){
//                     setState(() {
//                     //cart_products.removeAt(index);
//                     deleteCartProduct(user_uid,cart_products[index]["p_id"]);
//                     cart_products.clear();
//                     GetCart(user_uid);
//                     setState(() {
//
//                     });
//                     Future.delayed(Duration(seconds: 3), () {
//                     setState(() {
//
//                     });
//                     });
//                     // });
//                     // Future.delayed(Duration(seconds: 5), () {
//                     // setState(() {
//
//                     // loaded = false;
//                     // });
//                     });
//
//                   }
//                   ,child: Icon(Icons.delete,size: MediaQuery.of(context).size.width/20,)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
