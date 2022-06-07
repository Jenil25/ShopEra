import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/Auth/login.dart';
// import 'package:startup_try_2/Cart/cartScreen.dart.dart';
// import 'favorites.dart';
import 'package:startup_try_2/Cart/cartScreen.dart';
import 'package:startup_try_2/help.dart';
import 'package:startup_try_2/my_orders.dart';
// import 'package:startup_try_2/Favourites/favorites.dart';
// import 'package:startup_try_2/Shop_Owner/shop_profile.dart';
import 'package:startup_try_2/delivery_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'shopdetails.dart';
import 'package:startup_try_2/main.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:startup_try_2/myorders/my_orders_screen.dart';

class DeliveryHome extends StatefulWidget {
  @override
  _DeliveryHomeState createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      drawer: Drawer(
        child: Container(
          color: color,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/drawer_top.png"))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: Center(
                        child: Text(
                          '${delivery_user['dp_name'][0]}',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '${delivery_user['dp_name']}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeliveryProfilePage()),
                  )
                },
              ),
              Divider(
                height: 0,
                color: Colors.white,
                thickness: 0.4,
                indent: 50,
                endIndent: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.store,
                  color: Colors.white,
                ),
                title: Text(
                  'Pending',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EditProfilePage()),
                  // )
                },
              ),
              Divider(
                height: 0,
                color: Colors.white,
                thickness: 0.4,
                indent: 50,
                endIndent: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                title: Text(
                  'Delivered',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyOrders()),
                  // )
                },
              ),
              Divider(
                height: 0,
                color: Colors.white,
                thickness: 0.4,
                indent: 50,
                endIndent: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                title: Text(
                  'Help',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Help()),
                  )
                },
              ),
              Divider(
                height: 0,
                color: Colors.white,
                thickness: 0.4,
                indent: 50,
                endIndent: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.security,
                  color: Colors.white,
                ),
                title: Text(
                  'Policy',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EditProfilePage()),
                  // )
                },
              ),
              Divider(
                height: 0,
                color: Colors.white,
                thickness: 0.4,
                indent: 50,
                endIndent: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  auth.signOut(),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage())),
                },
              ),
              Divider(
                height: 0,
                color: Colors.white,
                thickness: 0.4,
                indent: 50,
                endIndent: 40,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        // leading: FlatButton(
        //   splashColor: Colors.transparent,
        //   highlightColor: Colors.transparent,
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   child: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
        backgroundColor: color,
        title: Image.asset("assets/images/logo.png"),
        actions: [
          FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 0.2 * height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
//                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text(
                    "Welcome, \n${delivery_user['dp_name']}",
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                  Spacer(),
                  Container(
                    height: 0.18 * height,
                    width: 0.18 * height,
                    child: Image.asset(
                        "assets/images/shopAndDeliveryUI/WelcomeDelivery.png"),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlatButton(
                            child: Container(
                              height: 0.34 * height,
                              width: 0.4 * width,
                              decoration: BoxDecoration(
                                color: Color(0xFFf2f2f2),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF8A959E),
                                    blurRadius: 30.0,
                                    spreadRadius: 0,
                                    offset: Offset(0.0, 30.0),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 8,
                                      child: Image.asset(
                                          "assets/images/shopAndDeliveryUI/PendingOrders.png")),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.blueAccent,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Center(
                                              child: Text(
                                            "Pending Orders",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: color,
                                            ),
                                          )),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                            onPressed: () {
                              //My Shop - page
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          child: Container(
                            height: 0.24 * height,
                            width: 0.4 * width,
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF8A959E),
                                  blurRadius: 30.0,
                                  spreadRadius: 0,
                                  offset: Offset(0.0, 30.0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Image.asset(
                                        "assets/images/shopAndDeliveryUI/AddMember.png")),
                                Divider(
                                  thickness: 2,
                                  color: Colors.blueAccent,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Center(
                                            child: Text(
                                          "Add member",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: color,
                                          ),
                                        )),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            // My Orders - page
                          },
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlatButton(
                          child: Container(
                            height: 0.24 * height,
                            width: 0.4 * width,
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF8A959E),
                                  blurRadius: 30.0,
                                  spreadRadius: 0,
                                  offset: Offset(0.0, 30.0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Image.asset(
                                        "assets/images/shopAndDeliveryUI/MyProfile.png")),
                                Divider(
                                  thickness: 2,
                                  color: Colors.blueAccent,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Center(
                                            child: Text(
                                          "My Profile",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: color,
                                          ),
                                        )),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            // My Profile - page
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          child: Container(
                            height: 0.34 * height,
                            width: 0.4 * width,
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF8A959E),
                                  blurRadius: 30.0,
                                  spreadRadius: 0,
                                  offset: Offset(0.0, 30.0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 8,
                                    child: Image.asset(
                                        "assets/images/shopAndDeliveryUI/DeliveredOrders.png")),
                                Divider(
                                  thickness: 2,
                                  color: Colors.blueAccent,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Center(
                                            child: Text(
                                          "Delivered Orders",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: color,
                                          ),
                                        )),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            // My Products - page
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
