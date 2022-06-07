import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/description.dart';
import 'package:startup_try_2/productDetails.dart';
//import 'package:startup_try_2/homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';
import 'package:startup_try_2/category/categorynew.dart';

class NewShopPage extends StatefulWidget {
  final shop, shop_objects, category_products;

  const NewShopPage(
      {Key key, this.shop, this.shop_objects, this.category_products})
      : super(key: key);

  @override
  _NewShopPageState createState() =>
      _NewShopPageState(this.shop, this.shop_objects, this.category_products);

// @override
// _ShopPageState createState() => _ShopPageState();
}

class _NewShopPageState extends State<NewShopPage> {
  var shop, shop_objects, category_products;
  _NewShopPageState(this.shop, this.shop_objects, this.category_products);

  var width;
  var height;
  var dropdownlist = [];

  void initialize() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // for (var i = 0; i < object_set.length; ++i) {
    //   print(i);
    //   dropdownlist.add(0);
    // }
  }

  void launchgmail(String mail_id) async {
    var mail = 'mailto:$mail_id?subject=&body=';
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw 'Could not launch $mail';
    }
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not get location";
    }
  }

  void launchCall(int number) async {
    var url = "tel: ${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not place a call";
    }
  }

  // var req_products = [];
  // var objects = [];
  // var count = 0;
  // var object_set;
  // var no_of_objects = [];
  // void fetchShopProducts() {
  //   count++;
  //   for (var i in products_list) {
  //     if (i["s_id"] == shop["s_id"]) {
  //       req_products.add(i);
  //       objects.add(i["p_category"]);
  //     }
  //     object_set = Set.of(objects);
  //   }
  // }
  //
  // var i = 0;
  // var ob_name = [];
  // var object_product = [];
  // var count_objects = 0;
  // var k = 0;
  // void fetchobjects() {
  //   //print("before for");
  //   for (var i = 0; i < object_set.length; i++) {
  //     for (var j = 0; j < req_products.length; j++) {
  //       if (req_products[j]["ob_id"].toString().toLowerCase() ==
  //           object_set.elementAt(i).toString().toLowerCase()) {
  //         object_product.add(req_products[j]);
  //         ++count_objects;
  //       }
  //     }
  //     no_of_objects.add(count_objects);
  //     //count_objects = 0;
  //   }
  // }
  //
  // void getObName() {
  //   for (var i = 0; i < object_set.length; ++i) {
  //     for (var j = 0; j < all_categories.length; ++j) {
  //       if (object_set.elementAt(i).toString() ==
  //           all_categories[j]["category_id"].toString()) {
  //         ob_name.add(all_categories[j]["category_name"]);
  //         //break;
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color,
        title: Text("${shop["s_name"]}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              //color: Colors.blue.shade200,
              // height: height / 4,
              height: width > height ? width / 2.5 : height / 4,
              child: Image.network(
                "https://5.imimg.com/data5/OE/IH/MY-39291562/shop-advertising-board-500x500.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: height * 0.3),
              padding: EdgeInsets.only(
                top: height / 15,
              ),

              height: height - height / 1.6 + shop_objects.length * (80) + 15,
              width: width,
              //height: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "${shop["s_name"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width / 12,
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                launchCall(int.parse(shop["s_number"]));
                              });
                            },
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            height: 50,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              shape: BoxShape.circle,
                            ),
                            child: FlatButton(
                              onPressed: () {
                                launchgmail("${shop["s_email"]}");
                              },
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              launchURL("${shop["s_map_link"]}");
                            },
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: width,
                    height: 25,
                    child: Text(
                      "${shop["s_description"]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width / 17,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    desc: shop["s_description"],
                                  )),
                        );
                      },
                      child: Text(
                        "Read more >   ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width / 21,
                        ),
                        //textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        //scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        itemCount: shop_objects.length, //object_set.length
                        itemBuilder: (BuildContext context, int index) {
                          return FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category(
                                            category_id: shop_objects[index]
                                                ["category_id"],
                                            category_items:
                                                category_products[index],
                                            product: true,
                                          )),
                                );
                              },
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18)),
                                  width: width,
                                  margin: EdgeInsets.all(5.0),
                                  height: 70,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.all(8.0),
                                            padding:
                                                EdgeInsets.fromLTRB(5, 7, 0, 0),
                                            height: 35,
                                            child: Text(
                                              '${shop_objects[index]["category_name"]}',
                                              style: TextStyle(
                                                  color: color,
                                                  fontSize: width / 17),
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            color: color,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )));
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
