import 'package:flutter/material.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:startup_try_2/main.dart';
import 'package:startup_try_2/models/Product.dart';
import 'ShopPage/shoppagenavigator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:url_launcher/url_launcher.dart';

class ShopsNearby extends StatefulWidget {
  final shops;
  const ShopsNearby({Key key, this.shops}) : super(key: key);
  @override
  _ShopsNearbyState createState() => _ShopsNearbyState(this.shops);
}

void launchCall(int number) async {
  var url = "tel: ${number.toString()}";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not place a call";
  }
}

int number = 0;

class _ShopsNearbyState extends State<ShopsNearby> {
  var shops;
  _ShopsNearbyState(this.shops);

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
    for (int i = 0; i < shops.length; i++) {
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
          shops[i]["s_name"],
          colorsmap[number]['starcolor'],
          colorsmap[number]['endcolor'],
          shops[i]["s_owner_name"],
          shops[i]["s_number"],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    getItems();
    var width = MediaQuery.of(context).size.width;
    checkInternet();
    ++counter_count;
    print(counter_count);
    return connected == true
        ? WillPopScope(
            onWillPop: () async {
              setState(() {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: color,
                title: Text(
                  "Shops",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: ListView.builder(
                itemCount: shops.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  ShopPageNavigator(shop: shops[index])));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                    colors: [
                                      items[index].startColor,
                                      items[index].endColor
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: items[index].endColor,
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: CustomPaint(
                                size: Size(100, 150),
                                painter: CustomCardShapePainter(
                                  24,
                                  items[index].startColor,
                                  items[index].endColor,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: width / 1.7,
                                      margin: EdgeInsets.all(20.0),
                                      child: Text(
                                        items[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: width / 16,
                                            color: Colors.white,
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        "Owner: ${items[index].owner}",
                                        style: TextStyle(
                                            fontSize: width / 26,
                                            color: Colors.white,
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 25.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green.shade700,
                                    radius: 30,
                                    child: FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          launchCall(
                                              int.parse(items[index].number));
                                        });
                                      },
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.yellowAccent.shade700,
        );
      }),
    );
  }
}

class PlaceInfo {
  final String name;
  final Color startColor;
  final Color endColor;
  final String owner;
  final String number;

  PlaceInfo(this.name, this.startColor, this.endColor, this.owner, this.number);
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
