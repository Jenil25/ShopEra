import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'lastPage.dart';

class ThankYouPageNavigator extends StatefulWidget {
  final products,
      user_id,
      o_amount,
      o_name,
      o_mobile_number,
      o_address_line1,
      o_address_line2,
      o_city,
      o_mode;
  const ThankYouPageNavigator(
      {Key key,
      this.products,
      this.user_id,
      this.o_amount,
      this.o_name,
      this.o_mobile_number,
      this.o_address_line1,
      this.o_address_line2,
      this.o_city,
      this.o_mode})
      : super(key: key);
  @override
  _ThankYouPageNavigatorState createState() => _ThankYouPageNavigatorState(
      this.products,
      this.user_id,
      this.o_amount,
      this.o_name,
      this.o_mobile_number,
      this.o_address_line1,
      this.o_address_line2,
      this.o_city,
      this.o_mode);
}

class _ThankYouPageNavigatorState extends State<ThankYouPageNavigator> {
  var products,
      user_id,
      o_amount,
      o_name,
      o_mobile_number,
      o_address_line1,
      o_address_line2,
      o_city,
      o_mode;
  _ThankYouPageNavigatorState(
      this.products,
      this.user_id,
      this.o_amount,
      this.o_name,
      this.o_mobile_number,
      this.o_address_line1,
      this.o_address_line2,
      this.o_city,
      this.o_mode);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // placeOrder();
    confirmOrder(user_id, o_amount, o_name, o_mobile_number, o_address_line1,
        o_address_line2, o_city, o_mode, products);
  }

  var orderid;
  void confirmOrder(var uid, var amount, var name, var mobile_number,
      var address1, var address2, var city, var mode, var products) async {
    print("Inside confirmOrder\n");
    final response =
        await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/confirmOrder.php"), body: {
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
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => OrderConfirmed(
    //       totalprice: totalprice,
    //       getname: getname,
    //       getphoneno: getphoneno,
    //       getaddress1: getaddress1,
    //       getaddress2: getaddress2,
    //       getcity: getcity,
    //       getby: getby,
    //       products: products,
    //     ),
    //   ),
    // );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ThankYouPage(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
