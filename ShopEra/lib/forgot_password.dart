// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:startup_try_2/animation.dart';
// import 'package:startup_try_2/homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:startup_try_2/email.dart';
//
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class ForgotPage extends StatefulWidget {
//   @override
//   _ForgotPageState createState() => _ForgotPageState();
// }
//
// class _ForgotPageState extends State<ForgotPage> {
//   String email, code;
//   bool sent = false;
//
//   Future<List> sendcodedata(String email, String code) async {
//     final response = await http
//         .post("https://shopera-app01.000webhostapp.com/insertdata.php", body: {
//       "email_id": email,
//       "code": code,
//     });
//   }
//
//   final _auth = FirebaseAuth.instance;
//   @override
//   @override
//   Widget _buildEmail() {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: TextFormField(
//         keyboardType: TextInputType.emailAddress,
//         onChanged: (value) {
//           setState(() {
//             email = value;
//           });
//         },
//         decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.email,
//               color: Colors.blue,
//             ),
//             hintText: "Enter Email-Id"),
//       ),
//     );
//   }
//
//   Widget _buildConfirmBtn() {
//     return Container(
//       height: 1.4 * (MediaQuery.of(context).size.height / 25),
//       width: 6 * (MediaQuery.of(context).size.width / 15),
//       child: RaisedButton(
//         onPressed: () async {
//           setState(() {});
//         },
//         elevation: 5.0,
//         color: Colors.blue,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         child: Text(
//           "Confirm",
//           style: TextStyle(
//             color: Colors.white,
//             letterSpacing: 1.1,
//             fontSize: MediaQuery.of(context).size.height / 43,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildVerifyCodeBtn() {
//     return Container(
//       height: 1.4 * (MediaQuery.of(context).size.height / 25),
//       width: 6 * (MediaQuery.of(context).size.width / 15),
//       child: RaisedButton(
//         onPressed: () async {
//           setState(() {
//             sendEmail(email.toString());
//             sent = true;
//           });
//         },
//         elevation: 5.0,
//         color: Colors.blue,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         child: Text(
//           "Send code",
//           style: TextStyle(
//             color: Colors.white,
//             letterSpacing: 1.1,
//             fontSize: MediaQuery.of(context).size.height / 43,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCode() {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: TextFormField(
//         maxLength: 4,
//         keyboardType: TextInputType.number,
//         onChanged: (value) {
//           setState(() {
//             code = value;
//           });
//         },
//         decoration: InputDecoration(hintText: "Enter Code"),
//       ),
//     );
//   }
//
//   Widget _buildForgot() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         vertical: 200,
//         horizontal: 50,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.all(
//               Radius.circular(40),
//             ),
//             child: FadeAnimation(
//               2,
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.6,
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 color: Colors.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           "Send code",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                             fontSize: MediaQuery.of(context).size.height / 25,
//                           ),
//                         ),
//                       ],
//                     ),
//                     //_buildName(),
//                     _buildEmail(),
//                     // _buildConfirmPassword(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     _buildVerifyCodeBtn(),
//                     sent
//                         ? Column(
//                             children: <Widget>[
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               _buildCode(),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               _buildConfirmBtn()
//                             ],
//                           )
//                         : Container(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomPadding: false,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: <Widget>[
//               FadeAnimation(
//                 1.2,
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.6,
//                   width: MediaQuery.of(context).size.width,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(colors: [
//                           Colors.lightBlue,
//                           Colors.blue,
//                           Colors.indigo,
//                         ]),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: const Radius.circular(50),
//                           bottomRight: const Radius.circular(50),
//                         )),
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   _buildForgot(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
