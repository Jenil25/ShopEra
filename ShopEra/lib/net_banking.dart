import 'package:flutter/material.dart';

class NetBanking extends StatefulWidget {
  @override
  _NetBankingState createState() => _NetBankingState();
}

class _NetBankingState extends State<NetBanking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text(
          "Net Banking",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: Container(),
    );
  }
}
