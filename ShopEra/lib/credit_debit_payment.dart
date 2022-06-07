import 'package:flutter/material.dart';

class CardPayment extends StatefulWidget {
  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text(
          "Card Payment",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
