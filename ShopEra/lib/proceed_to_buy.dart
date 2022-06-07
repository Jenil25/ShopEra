import 'package:flutter/material.dart';
// import 'package:startup_try_2/cartcard.dart';
// import 'buynow_order_card.dart';
import 'models/Product.dart';
import 'package:startup_try_2/Cart/cartScreen.dart';
import 'payment.dart';
import 'package:startup_try_2/Confirm Order/order_processing.dart';
// import 'file:///C:/Users/Dell/AndroidStudioProjects/startup_try_2_FEB/startup_try_2/lib/Confirm%20Order/order_confirmed.dart';

class ProceedToBuy extends StatefulWidget {
  final buynow;
  const ProceedToBuy({Key key, this.buynow}) : super(key: key);
  @override
  _ProceedToBuyState createState() => _ProceedToBuyState(this.buynow);
}

class _ProceedToBuyState extends State<ProceedToBuy> {
  var buynow;
  _ProceedToBuyState(this.buynow);
  String getaddress1 = user_address,
      getaddress2 = user_address,
      getname = user_name,
      getphoneno = user_mob,
      getcity;
  // OrderConfirmed(totalprice, getname, getphoneno, getaddress1, getaddress2, getcity, getby)
  int quantity = 5,
      count = 0,
      getby = 0, //0 MEANS "PICK UP", 1 MEANS "HOME DELIVERY"
      detailsreceived = 0, //1 FOR NAME, 2 FOR MOBILE NUMBER, 3 FOR ADDRESS
      totalprice;

  int selectedRadioTile;
  bool pickup = false;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 1;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //var shops = ["Shop1", "Shop 2", "Shop 3", "Shop 4", "Shop 5", "Shop 6"];
    if (buynow.length == 1)
      totalprice = int.parse(buynow[0]['sp']);
    else
      totalprice = total;
    return Scaffold(
      //backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // color: Colors.blue.shade500,
              height: height / 15,
              margin: const EdgeInsets.all(10.0),
              // width: MediaQuery.of(context).size.width / 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // SizedBox(width: MediaQuery.of(context).size.width / 12),
                  Text(
                    "Name: ",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
                  ),
                  SizedBox(width: width / 12),
                  Text(
                    user_name,
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              // color: Colors.blue.shade500,
              // height: height / 3,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(width: 5.0),
                  Text(
                    "Your Products: ",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                      child: Column(
                    children: List.generate(buynow.length, (index) {
                      //TO TRAVERSE THROUGH ALL PRODUCTS
                      return Container(
                        child: Column(
                          children: [
                            Text(buynow[index]["p_name"]),
                            SizedBox(
                              height: 10,
                            ),
                            Text(buynow[index]["sp"])
                          ],
                        ),
                      );
                    }),
                  )
                      // child: ListView.builder(
                      //   itemCount: buynow.length,
                      //   itemBuilder: (context, index) => Padding(
                      //     padding: EdgeInsets.symmetric(vertical: 10),
                      //     child: Container(
                      //       child: Row(
                      //         children: [
                      //           SizedBox(
                      //             width: 88,
                      //             child: AspectRatio(
                      //               aspectRatio: 0.88,
                      //               child: Container(
                      //                 padding: EdgeInsets.all((10)),
                      //                 decoration: BoxDecoration(
                      //                   color: Color(0xFFF5F6F9),
                      //                   borderRadius: BorderRadius.circular(15),
                      //                 ),
                      //                 child:
                      //                     // Container()
                      //                     Image.network(
                      //                         "https://shoperaweb.com/image/${buynow[index]["p_id"]}_1.png"),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(width: 20),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Container(
                      //                 width:
                      //                     MediaQuery.of(context).size.width * 0.5,
                      //                 child: Text(
                      //                   buynow[index]["p_name"],
                      //                   style: TextStyle(
                      //                       color: Colors.black, fontSize: 16),
                      //                   maxLines: 3,
                      //                 ),
                      //               ),
                      //               SizedBox(height: 10),
                      //               Row(
                      //                 children: [
                      //                   Text.rich(
                      //                     TextSpan(
                      //                       text: "Rs.${buynow[index]["sp"]}",
                      //                       style: TextStyle(
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                       children: [
                      //                         TextSpan(
                      //                             text: "   x1",
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyText1),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     width:
                      //                         MediaQuery.of(context).size.width /
                      //                             5,
                      //                   ),
                      //                   // Container(
                      //                   //   width: 40,
                      //                   //   child: FlatButton(
                      //                   //       onPressed: () {
                      //                   //         //setState(()
                      //                   //         loaded = false;
                      //                   //         deleteCartProduct(user_uid,
                      //                   //             cart_products[index]["p_id"]);
                      //                   //         total = total -
                      //                   //             int.parse(
                      //                   //                 cart_products[index]["sp"]);
                      //                   //         cart_products.removeAt(index);
                      //                   //         qty.removeAt(index);
                      //                   //         setState(() {});
                      //                   //
                      //                   //         // setState(() {
                      //                   //         // });
                      //                   //         print(cart_products);
                      //                   //         // Future.delayed(Duration(seconds: 3), () {
                      //                   //         //   loaded = true;
                      //                   //         //   //setState(() {});
                      //                   //         // });
                      //                   //       },
                      //                   //       child: Icon(
                      //                   //         Icons.delete,
                      //                   //         size: MediaQuery.of(context)
                      //                   //             .size
                      //                   //             .width /
                      //                   //             20,
                      //                   //       )),
                      //                   // ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: 1,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Container(
                  //           child: Text(buynow["p_name"]),
                  //         );
                  //         // BuynowCartCard(
                  //         //   product: widget.buyorders[index]);
                  //       }),
                  // )
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              // color: Colors.blue.shade500,
              height: height / 15,
              margin: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Price: Rs.",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
                  ),
                  Text(
                    buynow.length == 1 ? "${buynow[0]["sp"]}" : "$total",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              // color: Colors.blue.shade500,
              height: height / 15,
              margin: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Quantity: ",
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                  Text(
                    "$quantity",
                    style: TextStyle(color: Colors.blue.shade900),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              // color: Colors.blue.shade500,
              // height: MediaQuery.of(context).size.height / 15,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    value: 1,
                    selected: true,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Pick up",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                    subtitle: Text(
                      "Go to the shop and pick up your order",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                    onChanged: (val) {
                      print("Radio Tile pressed $val");
                      setSelectedRadioTile(val);
                      getby = 0;
                      // setState(() {
                      //   if (pickup == false) {
                      //     pickup = true;
                      //   } else {
                      //     pickup = false;
                      //   }
                      // });
                    },
                    activeColor: Colors.blue.shade900,
                    secondary: null,
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Home Delivery",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                    subtitle: Text(
                      "Get your order delivered home(Rs.20 Extra)",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                    onChanged: (val) {
                      print("Radio Tile pressed $val");
                      setSelectedRadioTile(val);
                      getby = 1;
                    },
                    activeColor: Colors.blue.shade900,
                    secondary: null,
                    // selected: false,
                  ),
                ],
              ),
            ),
            getby == 0
                ? Container(
                    width: width,
                    // color: Colors.blue.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total price:" +
                              (buynow.length == 1
                                  ? " ${buynow[0]["sp"]}"
                                  : " ${total}"),
                          style: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: height / 28),
                        ),
                        SizedBox(
                          height: height / 23,
                        ),
                        Container(
                          height: height / 14,
                          child: FlatButton(
                            color: Colors.blue.shade900,
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderProcessing(
                                              totalprice: totalprice,
                                              getname: getname,
                                              getphoneno: getphoneno,
                                              getaddress1: getaddress1,
                                              getaddress2: getaddress2,
                                              getcity: getcity,
                                              getby: getby,
                                              products: buynow,
                                            )));
                              });
                            },
                            child: Text(
                              "Confirm Order",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: height / 28,
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                : Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(
                                height > width ? height / 100 : width / 100000),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "For home delivery enter your details",
                                    style:
                                        TextStyle(color: Colors.blue.shade900),
                                  ),
                                ),
                                TextFormField(
                                  initialValue: user_name,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    setState(() {
                                      getname = value;
                                      detailsreceived = 1;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.yellow,
                                      ),
                                      labelText: "Name"),
                                ),
                                TextFormField(
                                  initialValue: user_mob,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      getphoneno = value.toString();
                                      detailsreceived = 2;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.yellow,
                                    ),
                                    labelText: "Phone Number",
                                  ),
                                ),
                                TextFormField(
                                  initialValue: user_address,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    setState(() {
                                      getaddress1 = value;
                                      detailsreceived = 3;
                                      print("Details:$detailsreceived");
                                    });
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.home,
                                        color: Colors.yellow,
                                      ),
                                      labelText: "Address Line 1"),
                                ),
                                TextFormField(
                                  initialValue: user_address,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    setState(() {
                                      getaddress2 = value;
                                      detailsreceived = 3;
                                      print("Details:$detailsreceived");
                                    });
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.home,
                                        color: Colors.yellow,
                                      ),
                                      labelText: "Address Line 2"),
                                ),
                                DropdownButton(
                                  hint: Text(
                                      'Choose a city'), // Not necessary for Option 1
                                  value: getcity,
                                  onChanged: (newValue) {
                                    setState(() {
                                      getcity = newValue;
                                    });
                                  },
                                  items: cities.map((city) {
                                    return DropdownMenuItem(
                                      child: new Text("${city['city_name']}" +
                                          " - ${city['city_pincode']}"),
                                      value: city['city_name'],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        getname != "" &&
                                getaddress1 != "" &&
                                getaddress2 != "" &&
                                getphoneno != "" &&
                                count == 0
                            ? Container(
                                width: width,
                                // color: Colors.blue.shade100,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(height: 15),
                                    Text(
                                      // ignore: unrelated_type_equality_checks
                                      "Total price:" +
                                          (buynow.length == 1
                                              ? " ${int.parse(buynow[0]["sp"]) + 20}"
                                              : " ${int.parse(total.toString()) + 20}"),
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: height > width
                                              ? height / 30
                                              : width / 30),
                                    ),
                                    Text("(Rs. 20 Extra for home delivery)"),
                                    SizedBox(
                                      height: height / 23,
                                    ),
                                    Container(
                                      height: height > width
                                          ? height / 14
                                          : width / 14,
                                      child: FlatButton(
                                        color: Colors.blue.shade900,
                                        onPressed: () {
                                          setState(() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderProcessing(
                                                          totalprice:
                                                              totalprice,
                                                          getname: getname,
                                                          getphoneno:
                                                              getphoneno,
                                                          getaddress1:
                                                              getaddress1,
                                                          getaddress2:
                                                              getaddress2,
                                                          getcity: getcity,
                                                          getby: getby,
                                                          products: buynow,
                                                        )));
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         Payment(order: 0, price: price),
                                            //   ),
                                            // );
                                          });
                                        },
                                        child: Text(
                                          "Confirm Order",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height > width
                                                ? height / 28
                                                : width / 28,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                            : Container()
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
