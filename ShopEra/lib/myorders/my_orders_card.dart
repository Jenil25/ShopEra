import 'package:flutter/material.dart';
import 'package:startup_try_2/Shop_Owner/delivery.dart';
// import 'package:startup_try_2/delivery_screen.dart';
import 'my_order_details.dart';
import 'package:startup_try_2/myorders/my_orders_screen.dart';

import 'package:startup_try_2/models/Product.dart';

import 'package:intl/intl.dart';

class MyOrderCard extends StatefulWidget {
  final deliveryOrder; // final Order deliveryOrder
  //bool isAccepted;

  MyOrderCard(this.deliveryOrder);

  @override
  _MyOrderCardState createState() => _MyOrderCardState();
}

class _MyOrderCardState extends State<MyOrderCard> {
  @override
  Widget build(BuildContext context) {
    // getorderdata(widget.deliveryOrder["o_id"]);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyOrdersPage(
              order: widget.deliveryOrder,
              totalPrice: widget.deliveryOrder["o_amount"],
              discountPrice: 0,
              quantity: widget.deliveryOrder.length),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Total Price : ${widget.deliveryOrder["o_amount"]}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Ordered On: \n' +
                            '${widget.deliveryOrder["o_datetime"]}',
                        // '${DateFormat.yMMMMd('en_US').format(widget.deliveryOrder["o_datetime"])}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   '${widget.deliveryOrder["o_datetime"]}',
                      //   // '${DateFormat.jm().format(widget.deliveryOrder["o_datetime"])}',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      SizedBox(height: 8),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff1b0250),
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(
                              3.0,
                              3.0,
                            ),
                          ),
                        ]),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 8),
                    height: 100,
                    child: Text("Image"),
                    // Image.asset(
                    //   widget.deliveryOrder.products[0].image,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: widget.deliveryOrder["o_status"] == "true"
                        ? Colors.grey
                        : Colors.red.shade900,
                    onPressed: () {},
                    child: Text(
                      'Pending',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: widget.deliveryOrder["o_status"] == "true"
                        ? Colors.green
                        : Colors.grey,
                    onPressed: () {},
                    child: Text(
                      'Delivered',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
