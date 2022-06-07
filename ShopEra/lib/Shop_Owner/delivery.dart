import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeliveryPage extends StatelessWidget {
  int originalPrice = 500, discountPrice = 400;
  String shopOwnerName = 'Hardik Modi', orderPerson = 'Hardik Modi';
  String shopNo = '6544644561', personNo = '5949956523';
  int quantity = 5;
  String product = 'Mobile';
  String orderDate = DateFormat('dd-mm-yyyy').format(DateTime.now()),
      delieveredDate = DateFormat('dd-mm-yyyy').format(DateTime.now());
  String shopAdress =
          '205,Satyam Appartment Goharbaug bilimora gandevi navsari gujarat india',
      deliveredAdress =
          '205,Satyam Appartment Goharbaug bilimora gandevi navsari gujarat india';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Delivery Page'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Product:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      product,
                      style: TextStyle(fontSize: 20),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'x' + quantity.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Price:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    child: Text(
                      originalPrice.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.lineThrough,
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    child: Text(
                      discountPrice.toString() + ' Rs.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Delivered by:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    shopOwnerName,
                    style: TextStyle(fontSize: 20),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Received by:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    orderPerson,
                    style: TextStyle(fontSize: 20),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 4, 6, 0),
                    child: Text(
                      'Pickup At:-',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  shopAdress,
                  style: TextStyle(fontSize: 20),
                  //textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 4, 6, 0),
                    child: Text(
                      'Delivered At:-',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  deliveredAdress,
                  style: TextStyle(fontSize: 20),
                  //textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Shop no.:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    shopNo,
                    style: TextStyle(fontSize: 20),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(
                      'Customer no.:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    personNo,
                    style: TextStyle(fontSize: 20),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(
                      'Order Date:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    orderDate,
                    style: TextStyle(fontSize: 20),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(
                      'Delievery Date:-',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    delieveredDate,
                    style: TextStyle(fontSize: 20),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
