import 'package:flutter/material.dart';
import 'credit_debit_payment.dart';
import 'net_banking.dart';

class Payment extends StatefulWidget {
  const Payment({
    Key key,
    @required this.order,
    this.price,
  }) : super(key: key);

  final int order, price;

  @override
  _PaymentState createState() => _PaymentState(this.order, this.price);
}

class _PaymentState extends State<Payment> {
  int order, price;
  _PaymentState(this.order, this.price);

  int selectedRadioTile, selectedRadio;
  int method = 3;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            "Payment Method",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  order == 0
                      ? "Total price : $price"
                      : "Total price : ${price + 25}(Rs.25 extra for Home Delivery)",
                  style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
                ),
              ),
              // RadioListTile(
              //   value: 1,
              //   groupValue: selectedRadioTile,
              //   title: Text("Net Banking"),
              //   subtitle: Text("Pay through net banking"),
              //   onChanged: (val) {
              //     // print("Radio Tile pressed $val");
              //     // setSelectedRadioTile(val);
              //     // method = 1;
              //   },
              //   activeColor: Colors.white,
              //   secondary: null,
              //   selected: true,
              // ),
              // RadioListTile(
              //   value: 2,
              //   groupValue: method == 0 ? 2 : selectedRadioTile,
              //   title: Text(
              //     "Credit card/Debit card",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   subtitle: Text(
              //     "Pay using credit or debit card",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   onChanged: (val) {
              //     // print("Radio Tile pressed $val");
              //     // setSelectedRadioTile(val);
              //     // method = 2;
              //   },
              //   activeColor: Colors.white,
              //   secondary: null,
              //   selected: false,
              // ),
              RadioListTile(
                value: 3,
                groupValue: 3, //selectedRadioTile,
                title: Text(
                  order == 1 ? "Cash" : "Pay at shop",
                  style: TextStyle(color: Colors.blue.shade900),
                ),
                subtitle: Text(
                  order == 1 ? "Cash On Delivery" : "Pay At Shop",
                  style: TextStyle(color: Colors.blue.shade900),
                ),
                onChanged: (val) {
                  print("Radio Tile pressed $val");
                  setSelectedRadioTile(val);
                  method = 3;
                },
                activeColor: Colors.blue.shade900,
                secondary: null,
                selected: true,
              ),
              method == 3
                  ? Container(
                      color: Colors.blue.shade900,
                      child: FlatButton(
                        onPressed: null,
                        child: Text(
                          "Confirm Order",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.blue.shade900,
                      child: method == 1
                          ? Container(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NetBanking()));
                                  });
                                },
                                child: Text(
                                  "Proceed with Net Banking",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            )
                          : Container(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CardPayment(),
                                        ));
                                  });
                                },
                                child: Text(
                                  "Proceed with Credit/Debit Card",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                    )
            ],
          ),
        ));
  }
}
