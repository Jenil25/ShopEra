import 'package:flutter/material.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:startup_try_2/models/Product.dart';

class OrderConfirmed extends StatefulWidget {
  final totalprice,
      getname,
      getphoneno,
      getaddress1,
      getaddress2,
      getcity,
      getby,
      products;

  const OrderConfirmed(
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
  _OrderConfirmedState createState() => _OrderConfirmedState(
      this.totalprice,
      this.getname,
      this.getphoneno,
      this.getaddress1,
      this.getaddress2,
      this.getcity,
      this.getby,
      this.products);
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  var totalprice,
      getname,
      getphoneno,
      getaddress1,
      getaddress2,
      getcity,
      getby,
      products;
  _OrderConfirmedState(
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
  Widget build(BuildContext context) {
    if (getby == 0) {
      mode = "pickup";
      getaddress1 = "NA";
      getaddress2 = "NA";
      getcity = "NA";
    } else
      mode = "homedelivery";

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Confirmed"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Your Order is Confirmed" + mode + " "),
            SizedBox(
              height: 10,
            ),
            Text("Total Amount:" + " $totalprice"),
            Text("Name:" + " $getname"),
            Text("Phone Number:" + " $getphoneno"),
            Text("Address Line 1:" + " $getaddress1"),
            Text("Address Line 2:" + " $getaddress2"),
            Text("City:" + " $getcity"),
            Text("Getby:" + " $getby"),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text("HOME"),
            )
          ],
        ),
      ),
    );
  }
}
