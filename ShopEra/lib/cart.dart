import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'proceed_to_buy.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var items = [
    "product 1",
    "product 2",
    "product 3",
    "product 3",
    "product 3",
    "product 3",
    "product 3",
    "product 3",
    "product 3",
    "product 3",
    "product 3"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blue.shade100,
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      height: 100.0,
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${items[index]}",
                              style: TextStyle(
                                color: Colors.teal.shade900,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          FlatButton(
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                items.remove(items[index]);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            color: Colors.deepOrange,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProceedToBuy(),
                    ),
                  );
                });
              },
              child: Text(
                'Proceed to Buy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// CustomScrollView(
// slivers: <Widget>[
// SliverFixedExtentList(
// itemExtent: 85.0,
// delegate: SliverChildBuilderDelegate(
// (BuildContext context, int index) {
// return Card(
// margin: EdgeInsets.all(10.0),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// color: Colors.blue.shade100,
// child: Container(
// margin: EdgeInsets.all(5.0),
// height: 100.0,
// padding: EdgeInsets.only(left: 20.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Container(
// width: 100.0,
// alignment: Alignment.centerLeft,
// child: Text(
// "${items[index]}",
// style: TextStyle(
// color: Colors.teal.shade900,
// fontSize: 25.0,
// ),
// ),
// ),
// FlatButton(
// splashColor: Colors.transparent,
// onPressed: () {
// setState(() {
// items.remove(items[index]);
// });
// },
// child: Container(
// decoration: BoxDecoration(
// shape: BoxShape.circle, color: Colors.red),
// child: Icon(
// Icons.remove,
// color: Colors.white,
// ),
// ),
// ),
// ],
// ),
// ),
// );
// },
// childCount: items.length,
// ),
// ),
// ],
// ),
