import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'order_confirmed.dart';

class OrderProcessing extends StatefulWidget {
  final totalprice,
      getname,
      getphoneno,
      getaddress1,
      getaddress2,
      getcity,
      getby,
      products;

  const OrderProcessing(
      {Key key,
      this.totalprice,
      this.getname,
      this.getphoneno,
      this.getaddress1,
      this.getaddress2,
      this.getcity,
      this.getby,
      this.products})
      : super(key: key);
  @override
  _OrderProcessingState createState() => _OrderProcessingState(
      this.totalprice,
      this.getname,
      this.getphoneno,
      this.getaddress1,
      this.getaddress2,
      this.getcity,
      this.getby,
      this.products);
}

class _OrderProcessingState extends State<OrderProcessing> {
  var totalprice,
      getname,
      getphoneno,
      getaddress1,
      getaddress2,
      getcity,
      getby,
      products;
  _OrderProcessingState(
      this.totalprice,
      this.getname,
      this.getphoneno,
      this.getaddress1,
      this.getaddress2,
      this.getcity,
      this.getby,
      this.products);

  var mode;

  @override
  void initState() {
    super.initState();
    if (getby == 0) {
      mode = "pickup";
      getaddress1 = "NA";
      getaddress2 = "NA";
      getcity = "NA";
    } else
      mode = "homedelivery";
    confirmOrder(user_uid, totalprice, getname, getphoneno, getaddress1,
        getaddress2, getcity, mode, products);
  }

  var orderid;
  void confirmOrder(var uid, var amount, var name, var mobile_number,
      var address1, var address2, var city, var mode, var products) async {
    print("Inside confirmOrder\n");
    final response = await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/confirmOrder.php"), body: {
      "uid": uid,
      "status": "0",
      "datetime": DateTime.now().toString(),
      "amount": amount.toString(),
      "name": name,
      "mobile_number": mobile_number.toString(),
      "address1": address1,
      "address2": address2,
      "city": city,
      "mode": mode
    });
    print("After response\n");
    orderid = jsonDecode(response.body);
    print(orderid);
    confirmOrderProducts(products, orderid);
  }

  void confirmOrderProducts(var products, var oid) async {
    for (var product in products) {
      final response = await http
          .post(Uri.parse("https://shopera-app01.000webhostapp.com/confirmOrderProducts.php"), body: {
        "pid": product["p_id"].toString(),
        "sid": product["s_id"].toString(),
        "oid": oid.toString()
      });
    }
    print("inside confirm order products");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OrderConfirmed(
          totalprice: totalprice,
          getname: getname,
          getphoneno: getphoneno,
          getaddress1: getaddress1,
          getaddress2: getaddress2,
          getcity: getcity,
          getby: getby,
          products: products,
        ),
      ),
    );
  }

  // void demmo() async {
  //   // confirmOrder(user_uid, totalprice, getname, getphoneno, getaddress1,
  //   //     getaddress2, getcity, mode, products);
  //
  //   Future.delayed(Duration(seconds: 5), () {
  //     print("dd");
  //     // Navigator.push(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //         builder: (context) => OrderConfirmed(
  //     //               totalprice: totalprice,
  //     //               getname: getname,
  //     //               getphoneno: getphoneno,
  //     //               getaddress1: getaddress1,
  //     //               getaddress2: getaddress2,
  //     //               getcity: getcity,
  //     //               getby: getby,
  //     //               products: products,
  //     //             )));
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return Scaffold(
  //             appBar: AppBar(
  //               title: Text("Order Confirmed"),
  //             ),
  //           );
  //         },
  //       ),
  //     );
  //   });
  //   // Timer(Duration(seconds: 3), () {
  //   //   print("orderconfirmed = true");
  //   //   orderconfirmed = true;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    // if (getby == 0) {
    //   mode = "pickup";
    //   getaddress1 = "NA";
    //   getaddress2 = "NA";
    //   getcity = "NA";
    // } else
    //   mode = "homedelivery";
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Processing"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("INSIDE order_processing.dart\nYour Order is being Processed" +
                mode +
                " "),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
