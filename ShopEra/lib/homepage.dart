import 'dart:convert';
import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'category/category_navigator.dart';
import 'package:startup_try_2/main.dart';
import 'package:startup_try_2/screens/home/home_screen.dart';
// import 'package:startup_try_2/sendMail.dart';
import 'ShopPage/shoppagenavigator.dart';
import 'package:startup_try_2/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:startup_try_2/models/Product.dart';
// import 'package:startup_try_2/screens/details/details_screen.dart';
import 'package:startup_try_2/screens/details/details_screen_navigator.dart';
import 'package:startup_try_2/nearbyshops.dart';

var counter_count = 0;
var recentSearch = [];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User user;
  var category;
  int _currentIndex = 0;
  bool log;
  // List cardList = [];
  // List cardList = [
  //   Image.network(
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTspM6SMu_d4y2V_yKF3ZnzzsOh-yWUmrEBNQ&usqp=CAU",
  //     fit: BoxFit.cover,
  //   ),
  //   Image.network(
  //     "https://www.danviews.com/wp-content/uploads/2010/08/special-offer.jpg",
  //     fit: BoxFit.cover,
  //   ),
  //   Image.network(
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSAxF0G7WneFCtlWlxcohbpweUCIJodidwI7A&usqp=CAU",
  //     fit: BoxFit.cover,
  //   ),
  //   Image.network(
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQvlzQ0akLnOXRwJaX2UGleVAYLUSd89cyApA&usqp=CAU",
  //     fit: BoxFit.cover,
  //   ),
  // ];

  // void getcarousalimages() {
  //   for (int i = 0; i < carousal_images.length; i++) {
  //     cardList.add(Image.network(
  //         "https://shoperaweb.com/offer_images/carousal/${carousal_images[i]["ci_name"]}",
  //         fit: BoxFit.cover));
  //   }
  // }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  // var l = [];
  // = [
  //   "https://timesofindia.indiatimes.com/thumb/msid-78727829,imgsize-49555,width-400,resizemode-4/78727829.jpg",
  //   "https://blog.hubspot.com/hubfs/limited-time-offer.jpg",
  //   "https://png.pngtree.com/png-clipart/20190630/original/pngtree-festival-special-offers-sale-splash-png-image_4138239.jpg",
  //   "https://70415bb9924dca896de0-34a37044c62e41b40b39fcedad8af927.lmsin.net/Home-Centre/HC-Mobile-2-Offer-060917.jpg",
  //   ""
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3C9kdgf9NGPOKuumAl7J3Yd68kyqBR9cxvg&usqp=CAU",
  // ];

  // void getofferimages() {
  //   for (int i = 0; i < offer_images.length; i++) {
  //     l.add(Image.network(
  //         "https://shoperaweb.com/offer_images/carousal/${offer_images[i]["oi_name"]}",
  //         fit: BoxFit.cover));
  //   }
  // }

  var counterforpagereloads = 0;
  bool nearbyshops = false;
  // bool category = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (counterforpagereloads < 3) {
      GetUser(_auth.currentUser.email);
      //GetCart(user_uid);
      ++counterforpagereloads;
    }
    var err = ["Empty"];
    var cat = [];
    // getcarousalimages();
    return connected == true
        ? Scaffold(
            backgroundColor: Colors.white,
            drawer: NavDrawer(),
            appBar: AppBar(
              backgroundColor: color,
              title: Image.asset("assets/images/logo.png"),
              actions: [
                // Container(),
                FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: DataSearch(shops, products_list));
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ],
            ),
            body: (nearbyshops == true && counter_count == 0)
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.grey[300],
                      width: 70.0,
                      height: 70.0,
                      child: new Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new Center(
                              child: new CircularProgressIndicator())),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: width / 30,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            // pauseAutoPlayOnTouch: Duration(seconds: 10),
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                          // onPageChanged: (index) {
                          //   setState(() {
                          //     _currentIndex = index;
                          //   });
                          // },
                          items: cardList.map((card) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                height:
                                    width > height ? width / 5 : height * 0.30,
                                width: width > height ? height * 1.5 : width,
                                child: Card(
                                  color: Colors.blue,
                                  child: card,
                                ),
                              );
                            });
                          }).toList(),
                        ),
                        SizedBox(
                          height: width / 30,
                        ),
                        Container(
                          margin: EdgeInsets.all(20.0),
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF8A959E),
                                blurRadius: 30.0,
                                spreadRadius: 0,
                                offset: Offset(0.0, 30.0),
                              ),
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                nearbyshops = true;
                              });
                              if (counter_count == 0) {
                                // Future.delayed(Duration(seconds: 3), () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => ShopsNearby(
                                      shops: shops,
                                    ),
                                  ),
                                );
                                // });
                              } else {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => ShopsNearby(
                                              shops: shops,
                                            )));
                              }
                            },
                            child: Text(
                              "View shops",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width / 30,
                        ),
                        Container(
                          margin: EdgeInsets.all(20.0),
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF8A959E),
                                blurRadius: 30.0,
                                spreadRadius: 0,
                                offset: Offset(0.0, 30.0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: DropdownButton(
                              hint: Text('Choose a category',
                                  style: TextStyle(
                                      color: Colors
                                          .white)), // Not necessary for Option 1
                              value: category,
                              onChanged: (newValue) {
                                print("category");
                                print(newValue);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CategoryNavigator(
                                        category_id: newValue,
                                      );
                                    },
                                  ),
                                );
                                setState(() {
                                  category = newValue;
                                });
                              },
                              items: categories.map((category) {
                                return DropdownMenuItem(
                                  child:
                                      new Text("${category['category_name']}"),
                                  value: category['category_id'],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(3.0),
                        //   margin: EdgeInsets.all(5.0),
                        //   height: 0.3 * height,
                        //   width: width,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(5.0),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Color(0xFF8A959E),
                        //         blurRadius: 60.0,
                        //         spreadRadius: 0,
                        //         offset: Offset(0.0, 30.0),
                        //       ),
                        //     ],
                        //   ),
                        //   child: Center(child: Container()
                        //       // Column(
                        //       //   children: [
                        //       //     Spacer(),
                        //       //     Text(
                        //       //       "Categories",
                        //       //       style: TextStyle(
                        //       //         fontSize: 18.0,
                        //       //         fontWeight: FontWeight.bold,
                        //       //       ),
                        //       //       textAlign: TextAlign.start,
                        //       //     ),
                        //       //     Divider(
                        //       //       thickness: 1.2,
                        //       //       indent: 10,
                        //       //       endIndent: 10,
                        //       //     ),
                        //       //     Spacer(),
                        //       //     Center(
                        //       //       child: Row(
                        //       //         mainAxisAlignment:
                        //       //             MainAxisAlignment.spaceBetween,
                        //       //         children: <Widget>[
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Electronics") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               Future.delayed(Duration(seconds: 3),
                        //       //                   () {
                        //       //                 Navigator.push(
                        //       //                     context,
                        //       //                     new MaterialPageRoute(
                        //       //                         builder: (context) =>
                        //       //                             Category(
                        //       //                               cat: (cat.length == 0
                        //       //                                   ? err
                        //       //                                   : cat),
                        //       //                               ob: objects_list
                        //       //                                           .length ==
                        //       //                                       0
                        //       //                                   ? err
                        //       //                                   : objects_list,
                        //       //                             )));
                        //       //               });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Electronics",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/device.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Fashion") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               Future.delayed(Duration(seconds: 3),
                        //       //                   () {
                        //       //                 Navigator.push(
                        //       //                     context,
                        //       //                     new MaterialPageRoute(
                        //       //                         builder: (context) =>
                        //       //                             Category(
                        //       //                               cat: (cat.length == 0
                        //       //                                   ? err
                        //       //                                   : cat),
                        //       //                               ob: objects_list
                        //       //                                           .length ==
                        //       //                                       0
                        //       //                                   ? err
                        //       //                                   : objects_list,
                        //       //                             )));
                        //       //               });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Fashion",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/clothing-icon.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Kitchenware") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               // Future.delayed(Duration(seconds: 3),
                        //       //               // () {
                        //       //               Navigator.push(
                        //       //                   context,
                        //       //                   new MaterialPageRoute(
                        //       //                       builder: (context) =>
                        //       //                           Category(
                        //       //                             cat: (cat.length == 0
                        //       //                                 ? err
                        //       //                                 : cat),
                        //       //                             ob: objects_list
                        //       //                                         .length ==
                        //       //                                     0
                        //       //                                 ? err
                        //       //                                 : objects_list,
                        //       //                           )));
                        //       //               // });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Kitchenware",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/frying-pan.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Meds") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               Future.delayed(Duration(seconds: 3),
                        //       //                   () {
                        //       //                 Navigator.push(
                        //       //                     context,
                        //       //                     new MaterialPageRoute(
                        //       //                         builder: (context) =>
                        //       //                             Category(
                        //       //                               cat: (cat.length == 0
                        //       //                                   ? err
                        //       //                                   : cat),
                        //       //                               ob: objects_list
                        //       //                                           .length ==
                        //       //                                       0
                        //       //                                   ? err
                        //       //                                   : objects_list,
                        //       //                             )));
                        //       //               });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Meds",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/healthcare.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //         ],
                        //       //       ),
                        //       //     ),
                        //       //     Center(
                        //       //       child: Row(
                        //       //         mainAxisAlignment:
                        //       //             MainAxisAlignment.spaceBetween,
                        //       //         children: <Widget>[
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Essentials") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               Future.delayed(Duration(seconds: 3),
                        //       //                   () {
                        //       //                 Navigator.push(
                        //       //                     context,
                        //       //                     new MaterialPageRoute(
                        //       //                         builder: (context) =>
                        //       //                             Category(
                        //       //                               cat: (cat.length == 0
                        //       //                                   ? err
                        //       //                                   : cat),
                        //       //                               ob: objects_list
                        //       //                                           .length ==
                        //       //                                       0
                        //       //                                   ? err
                        //       //                                   : objects_list,
                        //       //                             )));
                        //       //               });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Essentials",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/essentials.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Cosmetics") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               Future.delayed(Duration(seconds: 3),
                        //       //                   () {
                        //       //                 Navigator.push(
                        //       //                     context,
                        //       //                     new MaterialPageRoute(
                        //       //                         builder: (context) =>
                        //       //                             Category(
                        //       //                               cat: (cat.length == 0
                        //       //                                   ? err
                        //       //                                   : cat),
                        //       //                               ob: objects_list
                        //       //                                           .length ==
                        //       //                                       0
                        //       //                                   ? err
                        //       //                                   : objects_list,
                        //       //                             )));
                        //       //               });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Cosmetics",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/cosmetics-icon.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Footwear") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               Future.delayed(Duration(seconds: 3),
                        //       //                   () {
                        //       //                 Navigator.push(
                        //       //                     context,
                        //       //                     new MaterialPageRoute(
                        //       //                         builder: (context) =>
                        //       //                             Category(
                        //       //                               cat: (cat.length == 0
                        //       //                                   ? err
                        //       //                                   : cat),
                        //       //                               ob: objects_list
                        //       //                                           .length ==
                        //       //                                       0
                        //       //                                   ? err
                        //       //                                   : objects_list,
                        //       //                             )));
                        //       //               });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Footwear",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/shoe.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //           FlatButton(
                        //       //             onPressed: () {
                        //       //               for (int i = 0;
                        //       //                   i < products_list.length;
                        //       //                   ++i) {
                        //       //                 if (products_list[i]["p_category"]
                        //       //                         .toString() ==
                        //       //                     "Others") {
                        //       //                   cat.add(products_list[i]);
                        //       //                 }
                        //       //               }
                        //       //               Future.delayed(Duration(seconds: 3),
                        //       //                   () {
                        //       //                 Navigator.push(
                        //       //                     context,
                        //       //                     new MaterialPageRoute(
                        //       //                         builder: (context) =>
                        //       //                             Category(
                        //       //                               cat: (cat.length == 0
                        //       //                                   ? err
                        //       //                                   : cat),
                        //       //                               ob: objects_list
                        //       //                                           .length ==
                        //       //                                       0
                        //       //                                   ? err
                        //       //                                   : objects_list,
                        //       //                             )));
                        //       //               });
                        //       //               category = true;
                        //       //               setState(() {});
                        //       //             },
                        //       //             child: CategoryTab(
                        //       //               title: "Others",
                        //       //               child: Image.asset(
                        //       //                 "assets/images/others.png",
                        //       //                 fit: BoxFit.contain,
                        //       //               ),
                        //       //             ),
                        //       //           ),
                        //       //         ],
                        //       //       ),
                        //       //     ),
                        //       //   ],
                        //       // ),
                        //       ),
                        // ),
                        SizedBox(
                          height: width / 30,
                        ),
                        Container(
                          height: 40 + (205.0) * (l.length),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: l.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Container(
                                    width: width,
                                    height: 200,
                                    child: Image.network(
                                      l[index][0],
                                      fit: BoxFit.cover,
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        : Scaffold(
            body: Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                Container(
                  width: width,
                  child: Image.asset("assets/images/errorpages/noInternet.png"),
                ),
                Text(
                  "No Internet!\nPlease check your connectivity!!",
                  style: TextStyle(
                    fontSize: width / 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  width: width / 3,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text(
                      "Reload",
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
          );
  }
}

class DataSearch extends SearchDelegate<String> {
  final shops;
  final products;

  DataSearch(this.shops, this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    // print("buildactions call");
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // print("buildResults");
    // print(query);
    var result = search
        .where((p) => (p[0].toLowerCase()).startsWith(query.toLowerCase()))
        .toList();
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: () {
                  // print("suggestionListsfaaaaaaaadwq");
                  // print(suggestionList);
                  String name = result[index][0].substring(0, query.length) +
                      result[index][0].substring(query.length);
                  var what = result[index][3];
                  // var item = suggestionList[index][2];
                  print("What");
                  print(what);
                  // print("suggestionList");
                  // print(suggestionList);
                  var search_product,
                      product = null,
                      search_shop,
                      shop = null,
                      search_object,
                      object = null,
                      object_id = 0;

                  if (what == "Shop") {
                    print("NEW METHOD");
                    checkInternet();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ShopPageNavigator(shop: result[index][2])),
                    );
                  } else if (what == "Product") {
                    print("NEW METHOD");
                    checkInternet();
                    // getimages(product["p_id"]);
                    // checkrating(product["p_id"]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreenNavigator(
                              product: result[index][2])),
                    );
                  } else if (what == "Category") {
                    print("NEW METHOD");
                    checkInternet();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryNavigator(
                              category_id: result[index][2]["category_id"])),
                    );
                  }

                  // for (search_product in products_list) {
                  //   if (name == search_product["p_name"]) {
                  //     product = search_product;
                  //     break;
                  //   }
                  // }
                  // for (search_shop in shops) {
                  //   if (name == search_shop["s_name"]) {
                  //     shop = search_shop;
                  //     break;
                  //   }
                  // }
                  // for (search_object in all_categories) {
                  //   if (name == search_object["category_name"]) {
                  //     object = search_object;
                  //     object_id = search_object["category_id"];
                  //     break;
                  //   }
                  // }

                  if (recentSearch.contains(result[index]) == false) {
                    recentSearch.add(result[index]);
                  }

                  // if (shop != null) {
                  //   checkInternet();
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShopPageNavigator(shop: shop)),
                  //   );
                  // } else if (product != null) {
                  //   checkInternet();
                  //   getimages(product["p_id"]);
                  //   checkrating(product["p_id"]);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailsScreenNavigator(product: product)),
                  //   );
                  // } else if (object != null) {
                  //   checkInternet();
                  //   getimages(product["p_id"]);
                  //   checkrating(product["p_id"]);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailsScreenNavigator(product: product)),
                  //   );
                  // } else {
                  //   checkInternet();
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => HomePage()),
                  //   );
                  // }
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: result[index][0].substring(0, query.length),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: result[index][0].substring(query.length),
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        result[index][3] == "Product"
                            ? Text("${result[index][4]["s_name"]}")
                            : Container(),
                      ],
                    ),
                    result[index][1],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: result.length,
    ));
  }

  void getsuggestions() {
    for (int i = 0; i < shops.length; i++) {
      var l1 = [];
      l1.add(shops[i]["s_name"]);
      l1.add(Icon(
        Icons.shop,
        color: Colors.red,
      ));
      l1.add(shops[i]);
      l1.add("Shop");
      // search.add(shops[i]["s_name"]);
      // print("here ");
      search.add(l1);
      // print("inside adding search shop");
      // search
      //     .add([shops[i]["s_name"], shops[i]["s_id"]]); // = shops[i]["s_name"];
    }
    for (int i = 0; i < products.length; i++) {
      var l1 = [];
      l1.add(products[i]["p_name"]);
      l1.add(Icon(
        Icons.shopping_cart,
        color: Colors.blue,
      ));
      l1.add(products[i]);
      l1.add("Product");
      for (int j = 0; j < shops.length; j++) {
        if (products[i]["s_id"] == shops[j]["s_id"]) {
          l1.add(shops[j]);
          break;
        }
      }
      // search.add(products[i]["p_name"]);
      search.add(l1);
      // search.add([products[i]["p_name"], products[i]["p_id"]]);
    }
    for (int i = 0; i < all_categories.length; i++) {
      var l1 = [];
      l1.add(all_categories[i]["category_name"]);
      l1.add(Icon(
        Icons.category,
        color: Colors.yellow,
      ));
      l1.add(all_categories[i]);
      l1.add("Category");
      // search.add(all_categories[i]["category_name"]);
      search.add(l1);
      // search.add([
      //   all_categories[i]["category_name"],
      //   all_categories[i]["category_id"]
      // ]);
      // print("search[0]");
      // print(search[0]);
    }
    flag = false;
  }

  var search = []; //= List<String,int>();
  var flag = true;
  @override
  Widget buildSuggestions(BuildContext context) {
    if (flag) getsuggestions();
    // print("Heserssddf");
    var icons = [];
    final suggestionList = query.isEmpty
        ? recentSearch
        : search
            .where((p) => (p[0].toLowerCase()).startsWith(query.toLowerCase()))
            .toList();
    // print("suggestionList");
    // print(suggestionList);
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: () {
                  // print("suggestionListsfaaaaaaaadwq");
                  // print(suggestionList);
                  String name =
                      suggestionList[index][0].substring(0, query.length) +
                          suggestionList[index][0].substring(query.length);
                  var what = suggestionList[index][3];
                  // var item = suggestionList[index][2];
                  print("What");
                  print(what);
                  // print("suggestionList");
                  // print(suggestionList);
                  var search_product,
                      product = null,
                      search_shop,
                      shop = null,
                      search_object,
                      object = null,
                      object_id = 0;

                  if (what == "Shop") {
                    print("NEW METHOD");
                    checkInternet();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopPageNavigator(
                              shop: suggestionList[index][2])),
                    );
                  } else if (what == "Product") {
                    print("NEW METHOD");
                    checkInternet();
                    // getimages(product["p_id"]);
                    // checkrating(product["p_id"]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreenNavigator(
                              product: suggestionList[index][2])),
                    );
                  } else if (what == "Category") {
                    print("NEW METHOD");
                    checkInternet();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryNavigator(
                              category_id: suggestionList[index][2]
                                  ["category_id"])),
                    );
                  }

                  // for (search_product in products_list) {
                  //   if (name == search_product["p_name"]) {
                  //     product = search_product;
                  //     break;
                  //   }
                  // }
                  // for (search_shop in shops) {
                  //   if (name == search_shop["s_name"]) {
                  //     shop = search_shop;
                  //     break;
                  //   }
                  // }
                  // for (search_object in all_categories) {
                  //   if (name == search_object["category_name"]) {
                  //     object = search_object;
                  //     object_id = search_object["category_id"];
                  //     break;
                  //   }
                  // }

                  if (recentSearch.contains(suggestionList[index]) == false) {
                    recentSearch.add(suggestionList[index]);
                  }

                  // if (shop != null) {
                  //   checkInternet();
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShopPageNavigator(shop: shop)),
                  //   );
                  // } else if (product != null) {
                  //   checkInternet();
                  //   getimages(product["p_id"]);
                  //   checkrating(product["p_id"]);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailsScreenNavigator(product: product)),
                  //   );
                  // } else if (object != null) {
                  //   checkInternet();
                  //   getimages(product["p_id"]);
                  //   checkrating(product["p_id"]);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailsScreenNavigator(product: product)),
                  //   );
                  // } else {
                  //   checkInternet();
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => HomePage()),
                  //   );
                  // }
                },
                title: Column(
                  // mainAxisAlignment: M,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: suggestionList[index][0]
                                .substring(0, query.length),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: suggestionList[index][0]
                                    .substring(query.length)
                                    .trim(),
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        suggestionList[index][1],
                      ],
                    ),
                    suggestionList[index][3] == "Product"
                        ? Text("${suggestionList[index][4]["s_name"]}".trim(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                            ))
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  //final IconData icon;
  final Widget child;
  CategoryTab({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: width / 4,
      width: width / 7,
      //margin: EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width / 7,
            height: width / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0xFF1B0250),
            ),
            child: Center(
              child: child,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 10.0,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:convert';
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:startup_try_2/category.dart';
// import 'package:startup_try_2/main.dart';
// import 'package:startup_try_2/screens/home/home_screen.dart';
// // import 'package:startup_try_2/sendMail.dart';
// import 'package:startup_try_2/shoppage.dart';
// import 'package:startup_try_2/drawer.dart';
// import 'package:http/http.dart' as http;
// import 'package:startup_try_2/models/Product.dart';
// import 'package:startup_try_2/screens/details/details_screen.dart';
// import 'package:startup_try_2/nearbyshops.dart';
//
// var counter_count=0;
// var recentSearch = [
// ];
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   final _auth = FirebaseAuth.instance;
//   User user;
//
//   int _currentIndex = 0;
//   bool log;
//   List cardList = [
//     Image.network(
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTspM6SMu_d4y2V_yKF3ZnzzsOh-yWUmrEBNQ&usqp=CAU",
//       fit: BoxFit.cover,
//     ),
//     Image.network(
//       "https://www.danviews.com/wp-content/uploads/2010/08/special-offer.jpg",
//       fit: BoxFit.cover,
//     ),
//     Image.network(
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSAxF0G7WneFCtlWlxcohbpweUCIJodidwI7A&usqp=CAU",
//       fit: BoxFit.cover,
//     ),
//     Image.network(
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQvlzQ0akLnOXRwJaX2UGleVAYLUSd89cyApA&usqp=CAU",
//       fit: BoxFit.cover,
//     ),
//   ];
//   List<T> map<T>(List list, Function handler) {
//     List<T> result = [];
//     for (var i = 0; i < list.length; i++) {
//       result.add(handler(i, list[i]));
//     }
//     return result;
//   }
//
//   var l = [
//     "https://timesofindia.indiatimes.com/thumb/msid-78727829,imgsize-49555,width-400,resizemode-4/78727829.jpg",
//     "https://blog.hubspot.com/hubfs/limited-time-offer.jpg",
//     "https://png.pngtree.com/png-clipart/20190630/original/pngtree-festival-special-offers-sale-splash-png-image_4138239.jpg",
//     "https://70415bb9924dca896de0-34a37044c62e41b40b39fcedad8af927.lmsin.net/Home-Centre/HC-Mobile-2-Offer-060917.jpg",
//     ""
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3C9kdgf9NGPOKuumAl7J3Yd68kyqBR9cxvg&usqp=CAU",
//   ];
//   var c = 0;
//   bool nearbyshops = false;
//   bool category = false;
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     if(c<3){
//       GetUser(_auth.currentUser.email);
//       //GetCart(user_uid);
//       ++c;
//     }
//     var err = ["Empty"];
//     var cat = [];
//     return connected == true ? Scaffold(
//       backgroundColor: Colors.white,
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         backgroundColor: color,
//         title: Image.asset("assets/images/logo.png"),
//         actions: [
//           FlatButton(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               onPressed: () {
//                 showSearch(
//                     context: context,
//                     delegate: DataSearch(shops, products_list));
//               },
//               child: Icon(
//                 Icons.search,
//                 color: Colors.white,
//               )),
//         ],
//       ),
//       body: (nearbyshops==true && counter_count==0) || category == true? Align(
//         alignment: Alignment.center,
//         child: Container(
//           color: Colors.grey[300],
//           width: 70.0,
//           height: 70.0,
//           child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
//         ),
//       )  : SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: width / 30,
//             ),
//             Container(
//               padding: EdgeInsets.all(3.0),
//               margin: EdgeInsets.all(10.0),
//               height: 80,
//               width: width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: color,
//                     blurRadius: 5.0,
//                     spreadRadius: 0.5,
//                     offset: Offset(
//                       -3.0,3.0
//                     ),
//                   ),
//                 ],
//               ),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FlatButton(
//                           onPressed: (){
//                             for(int i=0;i<products_list.length;++i){
//                               if(products_list[i]["p_category"].toString() == "Electronics"){
//                                 cat.add(products_list[i]);
//                               }
//                             }
//                             Future.delayed(Duration(seconds: 3)  , (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => Category(
//                                         cat : (cat.length==0 ? err : cat),
//                                         ob: objects_list.length == 0 ? err : objects_list,
//                                       )));
//                             });
//                             category = true;
//                             setState(() {
//                             });
//                           },
//                           child: CircleAvatar(
//                               backgroundColor: color,
//                               radius: 26,
//                               child: Image.asset("assets/images/device.png",
//                                 fit: BoxFit.contain,
//                               ),
//                               ),
//                         ),
//                         Text(
//                           "Electronics",
//                           style: TextStyle(
//                               fontSize: 16, color: color),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(
//                     //   width: 10,
//                     // ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FlatButton(
//                           onPressed: (){
//                             for(int i=0;i<products_list.length;++i){
//                               if(products_list[i]["p_category"].toString() == "Fashion"){
//                                 cat.add(products_list[i]);
//                               }
//                             }
//                             Future.delayed(Duration(seconds: 3)  , (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => Category(
//                                           cat : (cat.length==0 ? err : cat),
//                                         ob: objects_list.length == 0 ? err : objects_list,
//                                       )));
//                             });
//                             category = true;
//                             setState(() {
//                             });
//                           },
//                           child :  CircleAvatar(
//                             backgroundColor: color,
//                             radius: 26,
//                             child:  Image.asset("assets/images/clothing-icon.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Fashion",
//                           style: TextStyle(
//                               fontSize: 16, color: color),
//                         ),
//                       ],
//                     ),
//
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [                        FlatButton(
//                         onPressed: (){
//                           for(int i=0;i<products_list.length;++i){
//                             if(products_list[i]["p_category"].toString() == "Kitchenware"){
//                               cat.add(products_list[i]);
//                             }
//                           }
//                           Future.delayed(Duration(seconds: 3)  , (){
//                             Navigator.push(
//                                 context,
//                                 new MaterialPageRoute(
//                                     builder: (context) => Category(
//                                       cat : (cat.length==0 ? err : cat),
//                                       ob: objects_list.length == 0 ? err : objects_list,
//                                     )));
//                           });
//                           category = true;
//                           setState(() {
//                           });
//                         },
//                         child: CircleAvatar(
//                           backgroundColor: color,                            radius: 26,
//                             child: Image.asset("assets/images/frying-pan.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                       ),
//                         Text(
//                           "Kitchenware",
//                           style: TextStyle(
//                               fontSize: 16, color:color),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FlatButton(
//                           onPressed: (){
//                             for(int i=0;i<products_list.length;++i){
//                               if(products_list[i]["p_category"].toString() == "Meds"){
//                                 cat.add(products_list[i]);
//                               }
//                             }
//                             Future.delayed(Duration(seconds: 3)  , (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => Category(
//                                         cat : (cat.length==0 ? err : cat),
//                                         ob: objects_list.length == 0 ? err : objects_list,
//                                       )));
//                             });
//                             category = true;
//                             setState(() {
//                             });
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: color,                            radius: 26,
//                             child:
//                             Image.asset("assets/images/healthcare.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Meds",
//                           style: TextStyle(
//                               fontSize: 16, color: color),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FlatButton(
//                           onPressed: (){
//                             for(int i=0;i<products_list.length;++i){
//                               if(products_list[i]["p_category"].toString() == "Essentials"){
//                                 cat.add(products_list[i]);
//                               }
//                             }
//                             Future.delayed(Duration(seconds: 3)  , (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => Category(
//                                         cat : (cat.length==0 ? err : cat),
//                                         ob: objects_list.length == 0 ? err : objects_list,
//                                       )));
//                             });
//                             category = true;
//                             setState(() {
//                             });
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: color,                            radius: 26,
//                             child: Image.asset("assets/images/essentials.png",
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Essentials",
//                           style: TextStyle(
//                               fontSize: 16, color:color),
//                         ),
//                       ],
//                     ),
//
//
//
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FlatButton(
//                           onPressed: (){
//                             for(int i=0;i<products_list.length;++i){
//                               if(products_list[i]["p_category"].toString() == "Footwear"){
//                                 cat.add(products_list[i]);
//                               }
//                             }
//                             Future.delayed(Duration(seconds: 3)  , (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => Category(
//                                         cat : (cat.length==0 ? err : cat),
//                                         ob: objects_list.length == 0 ? err : objects_list,
//                                       )));
//                             });
//                             category = true;
//                             setState(() {
//                             });
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: color,                            radius: 26,
//                             child:  Image.asset("assets/images/shoe.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Footwear",
//                           style: TextStyle(
//                               fontSize: 16, color:color),
//                         ),
//                       ],
//                     ),
//
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FlatButton(
//                           onPressed: (){
//                             for(int i=0;i<products_list.length;++i){
//                               if(products_list[i]["p_category"].toString() == "Cosmetics"){
//                                 cat.add(products_list[i]);
//                               }
//                             }
//                             Future.delayed(Duration(seconds: 3)  , (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => Category(
//                                         cat : (cat.length==0 ? err : cat),
//                                         ob: objects_list.length == 0 ? err : objects_list,
//                                       )));
//                             });
//                             category = true;
//                             setState(() {
//                             });
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: color,                            radius: 26,
//                             child:  Image.asset("assets/images/cosmetics-icon.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Cosmetics",
//                           style: TextStyle(
//                               fontSize: 16, color: color),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FlatButton(
//                           onPressed: (){
//                             for(int i=0;i<products_list.length;++i){
//                               if(products_list[i]["p_category"].toString() == "Others"){
//                                 cat.add(products_list[i]);
//                               }
//                             }
//                             Future.delayed(Duration(seconds: 8)  , (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => Category(
//                                         cat : (cat.length==0 ? err : cat),
//                                         ob: objects_list.length == 0 ? err : objects_list,
//                                       )));
//                             });
//                             category = true;
//                             setState(() {
//                             });
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: color,                            radius: 26,
//                             child: Image.asset("assets/images/others.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Others",
//                           style: TextStyle(
//                               fontSize: 16, color: color),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: width / 30,
//             ),
//             CarouselSlider(
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 3),
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               pauseAutoPlayOnTouch: Duration(seconds: 10),
//               aspectRatio: 2.0,
//               enlargeCenterPage: true,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },
//               items: cardList.map((card) {
//                 return Builder(builder: (BuildContext context) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     height: width > height ? width / 5 : height * 0.30,
//                     width: width > height ? height * 1.5 : width,
//                     child: Card(
//                       color: Colors.blueAccent,
//                       child: card,
//                     ),
//                   );
//                 });
//               }).toList(),
//             ),
//
//             SizedBox(
//               height: width / 30,
//             ),
//             Container(
//               margin: EdgeInsets.all(10.0),
//               width: width,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     nearbyshops = true;
//                   });
//                   if(counter_count == 0){
//                     Future.delayed(Duration(seconds: 3)  , (){
//                       Navigator.push(
//                           context,
//                           new MaterialPageRoute(
//                               builder: (context) => ShopsNearby(
//                                 shops: shops,
//                               )));
//                     });
//                   }else{
//                     Navigator.push(
//                         context,
//                         new MaterialPageRoute(
//                             builder: (context) => ShopsNearby(
//                               shops: shops,
//                             )));
//                   }
//                 },
//                 child: Text(
//                   "View shops",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: width / 30,
//             ),
//             Container(
//               height: 40 + (205.0) * (l.length),
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: l.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Container(
//                         width: width,
//                         height: 200,
//                         child: Image.network(
//                           l[index],
//                           fit: BoxFit.cover,
//                         )),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     ) : Scaffold(body: Column(
//       children: [
//         Spacer(flex: 1,),
//         Container(width: width,child: Image.asset("assets/images/errorpages/noInternet.png"),),
//         Text("No Internet!\nPlease check your connectivity!!",style: TextStyle(
//           fontSize: width/16,
//           fontWeight: FontWeight.bold,
//         ),textAlign: TextAlign.center,),
//         Spacer(flex: 1,),
//         Container(
//           width: width/3,
//           decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: FlatButton(
//           onPressed: (){
//             Navigator.push(
//                 context,
//                 new MaterialPageRoute(
//                     builder: (context) => MyApp()));
//           },
//           child: Text("Reload",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//         ),),
//         Spacer(flex: 5,),
//       ],
//     ),);
//   }
// }
//
//
// class DataSearch extends SearchDelegate<String> {
//   final shops;
//   final products;
//
//   DataSearch(this.shops, this.products);
//
//
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     print("buildactions call");
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return null;
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> search = List<String>();
//     for (int i = 0; i < shops.length; i++) {
//       search.add(shops[i]["s_name"]); // = shops[i]["s_name"];
//     }
//     for (int i = 0; i < products.length; i++) {
//       search.add(products[i]["p_name"]);
//     }
//     for (int i = 0; i < objects_list.length; i++) {
//       search.add(objects_list[i]["ob_name"]);
//     }
//     final suggestionList = query.isEmpty
//         ? recentSearch
//         : search
//         .where((p) => (p.toLowerCase()).startsWith(query.toLowerCase()))
//         .toList();
//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         title: Card(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 onTap: () {
//
//                   String name =
//                       suggestionList[index].substring(0, query.length) +
//                           suggestionList[index].substring(query.length);
//                   var search_product,
//                       product = null,
//                       search_shop,
//                       shop = null,
//                       search_object,
//                       object = null;
//
//                   for (search_product in products_list) {
//                     if (name == search_product["p_name"]) {
//                       product = search_product;
//                       break;
//                     }
//                   }
//                   for (search_shop in shops) {
//                     if (name == search_shop["s_name"]) {
//                       shop = search_shop;
//                       break;
//                     }
//                   }
//                   for (search_object in objects_list) {
//                     if (name == search_object["ob_name"]) {
//                       object = search_object;
//                       break;
//                     }
//                   }
//                   if(recentSearch.contains(name) == false){
//                     recentSearch.add(name);
//                   }
//
//                   if (shop != null) {
//                     checkInternet();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ShopPage(shop: shop)),
//                     );
//                   } else if (product != null) {
//                     checkInternet();
//                     getimages(product["p_id"]);
//                     checkrating(product["p_id"]);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               DetailsScreen(product: product)),
//                     );
//                   } else {
//                     checkInternet();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage()),
//                     );
//
//                   }
//                 },
//                 title: RichText(
//                   text: TextSpan(
//                     text: suggestionList[index].substring(0, query.length),
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: suggestionList[index].substring(query.length),
//                         style: TextStyle(color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }
