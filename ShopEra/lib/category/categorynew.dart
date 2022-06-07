import 'package:flutter/material.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/productDetails.dart';
import 'dart:ui' as ui;
import 'package:startup_try_2/screens/details/details_screen_navigator.dart';
import 'category_navigator.dart';

class Category extends StatefulWidget {
  final category_id;
  final category_items;
  final bool product;
  const Category({Key key, this.category_id, this.category_items, this.product})
      : super(key: key);
  @override
  _CategoryState createState() =>
      _CategoryState(this.category_id, this.category_items, this.product);
}

class _CategoryState extends State<Category> {
  var category_id;
  var category_items;
  bool product;
  _CategoryState(this.category_id, this.category_items, this.product);

  int number = 0;
  var items = [];
  void getItems() {
    var colorsmap = [
      {
        'starcolor': Color(0xff6DC8F3),
        'endcolor': Color(0xff73A1F9),
      },
      {
        'starcolor': Color(0xffFFB157),
        'endcolor': Color(0xffFFA057),
      },
      {
        'starcolor': Color(0xffFF5B95),
        'endcolor': Color(0xffF8556D),
      },
      {
        'starcolor': Color(0xffD76EF5),
        'endcolor': Color(0xff8F7AFE),
      },
      {
        'starcolor': Color(0xff42AA95),
        'endcolor': Color(0xff3BB2B8),
      }
    ];
    for (int i = 0; i < category_items.length; i++) {
      if (number == 0) {
        number = 1;
      } else if (number == 1) {
        number = 2;
      } else if (number == 2) {
        number = 3;
      } else if (number == 3) {
        number = 4;
      } else {
        number = 0;
      }
      items.add(
        PlaceInfo(
          category_items[i],
          colorsmap[number]['starcolor'],
          colorsmap[number]['endcolor'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Category"),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Container(
            width: width,
            height: 120 * category_items.length + 10.0,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                // scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: category_items.length,
                itemBuilder: (BuildContext context, int index) {
                  return product
                      ? FlatButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>ProductDetails(pro: category_items[index],start: index == 0 ? 0 : no_of_objects[index-1],stop: no_of_objects[index],obname: ob_name[index],)
                            //   ),
                            // );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreenNavigator(
                                      product: category_items[index])),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius: BorderRadius.circular(18)),
                              width: width,
                              margin: EdgeInsets.all(5.0),
                              // height: 70,
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.only(left: 5),
                                height: 35,
                                child: Text(
                                  '${category_items[index]["p_name"]}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width / 17),
                                ),
                              )))
                      : FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryNavigator(
                                      category_id: category_items[index]
                                          ["category_id"])),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius: BorderRadius.circular(18)),
                              width: width,
                              margin: EdgeInsets.all(5.0),
                              // height: 70,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.only(left: 5),
                                        height: 35,
                                        child: Text(
                                          '${category_items[index]["category_name"]}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width / 17),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              )));
                  // GestureDetector(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //     context,
                  //     //     new MaterialPageRoute(
                  //     //         builder: (context) => ProductDetails(
                  //     //               pro: object_product,
                  //     //               start: index == 0
                  //     //                   ? 0
                  //     //                   : no_of_objects[index - 1],
                  //     //               stop: no_of_objects[index],
                  //     //               obname: ob_name[index],
                  //     //             )));
                  //   },
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child: Stack(children: <Widget>[
                  //         Container(
                  //           height: 80,
                  //           width: width,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(24),
                  //             gradient: LinearGradient(
                  //                 colors: [
                  //                   items[index].startColor,
                  //                   items[index].endColor
                  //                 ],
                  //                 begin: Alignment.topLeft,
                  //                 end: Alignment.bottomRight),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: items[index].endColor,
                  //                 blurRadius: 12,
                  //                 offset: Offset(0, 6),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Positioned(
                  //           right: 0,
                  //           bottom: 0,
                  //           top: 0,
                  //           child: CustomPaint(
                  //             size: Size(100, 150),
                  //             painter: CustomCardShapePainter(
                  //               24,
                  //               items[index].startColor,
                  //               items[index].endColor,
                  //             ),
                  //           ),
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             Column(
                  //               //mainAxisSize: MainAxisSize.min,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: <Widget>[
                  //                 SizedBox(
                  //                   height: 6,
                  //                 ),
                  //                 Container(
                  //                   width: width / 1.7,
                  //                   margin: EdgeInsets.all(20.0),
                  //                   child: Text(
                  //                     items[index].name,
                  //                     overflow: TextOverflow.ellipsis,
                  //                     style: TextStyle(
                  //                         fontSize: width / 16,
                  //                         color: Colors.white,
                  //                         fontFamily: 'Avenir',
                  //                         fontWeight: FontWeight.w700),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Icon(
                  //               Icons.arrow_forward_ios,
                  //               color: Colors.white,
                  //             ),
                  //           ],
                  //         ),
                  //       ]),
                  //     ),
                  //   ),
                  // );
                })),
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
