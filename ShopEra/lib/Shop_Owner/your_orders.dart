import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  var title = 'Horse';

  var image =
      "https://imgk.timesnownews.com/story/Dreaming_about_a_horse.jpg?tr=w-600,h-450";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //final productData = Provider.of<Products>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Your Orders'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemBuilder: (_, i) => Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  margin: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    leading: Container(
                      //decoration: BoxDecoration(color: Colors.black),
                      padding: EdgeInsets.only(bottom: 12),
                      child: Image.network(
                        image,
                      ),
                      //padding: EdgeInsets.only(top: 10),
                    ),
                    trailing: Container(
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
