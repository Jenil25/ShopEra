import 'package:flutter/material.dart';
import 'package:startup_try_2/screens/details/details_screen_navigator.dart';
import 'package:startup_try_2/models/Product.dart';

class ProductDetails extends StatefulWidget {
  final pro;
  final start;
  final stop;
  final obname;
  const ProductDetails({Key key, this.pro, this.start, this.stop, this.obname})
      : super(key: key);

  @override
  _ProductDetailsState createState() =>
      _ProductDetailsState(this.pro, this.start, this.stop, this.obname);
}

class _ProductDetailsState extends State<ProductDetails> {
  var pro;
  int start;
  int stop;
  String obname;
  _ProductDetailsState(this.pro, this.start, this.stop, this.obname);

  var d = [];
  void disp() {
    d.clear();
    for (int i = start; i < stop; ++i) {
      d.add(pro[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // d.clear();
    var size = MediaQuery.of(context).size;
    disp();
    print(d);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("$obname"),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 165 * (stop - start).toDouble(),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: d.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: FlatButton(
                    onPressed: () {
                      getimages(d[index]["p_id"]);
                      checkrating(d[index]["p_id"]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreenNavigator(product: d[index])));
                    },
                    child:
                        // Container(child: Row(
                        //   children: [
                        //     SizedBox(
                        //       width: 88,
                        //       child: AspectRatio(
                        //         aspectRatio: 0.88,
                        //         child: Container(
                        //           padding: EdgeInsets.all((10)),
                        //           decoration: BoxDecoration(
                        //             color: Color(0xFFF5F6F9),
                        //             borderRadius: BorderRadius.circular(15),
                        //           ),
                        //           child:
                        //           // Container()
                        //           Image.network(
                        //               "https://shoperaweb.com/image/${d[index]["p_id"]}_1.png"),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(width: 20),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Container(
                        //           width: MediaQuery.of(context).size.width /1.6,
                        //           child: Text(
                        //             d[index]["p_name"],
                        //             style: TextStyle(color: Colors.black, fontSize: 16),
                        //             maxLines: 3,
                        //           ),
                        //         ),
                        //         SizedBox(height: 10),
                        //         Row(
                        //           children: [
                        //             Text.rich(
                        //               TextSpan(
                        //                 text: "Rs.${d[index]["sp"]}",
                        //                 style: TextStyle(
                        //                   fontWeight: FontWeight.w600,
                        //                 ),
                        //               ),
                        //             ),
                        //             SizedBox(width:MediaQuery.of(context).size.width/5,),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),),
                        Container(
                      width: size.width,
                      // margin: EdgeInsets.all(5.0),
                      // color: Colors.blueAccent,
                      height: 150,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          // Those are our background
                          Container(
                            height: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: index.isEven
                                  ? Color(0xFF005FA1)
                                  : Color(0xFFFFA41B),
                              //boxShadow: [kDefaultShadow],
                            ),
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                          // our product image
                          Positioned(
                            top: 38,
                            right: 25,
                            child: Hero(
                              tag: '${d[index]["p_id"]}',
                              child: SizedBox(
                                width: 88,
                                child: AspectRatio(
                                  aspectRatio: 0.88,
                                  child: Container(
                                    padding: EdgeInsets.all((10)),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child:
                                        // Container()
                                        Image.network(
                                            "https://shopera-app01.000webhostapp.com/image/${d[index]["p_id"]}_1.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Product title and price
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: 136,
                              // our image take 200 width, thats why we set out total width - 200
                              width: size.width - 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      d[index]["p_name"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      //style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                  // it use the available space
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20 * 1.5, // 30 padding
                                      vertical: 20 / 4, // 5 top and bottom
                                    ),
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? Color(0xFF005FA1)
                                          : Color(0xFFFFA41B),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22),
                                      ),
                                    ),
                                    child: Text(
                                      "Rs.${d[index]["sp"]}",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      //style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
