import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/homepage.dart';
import 'lastPage.dart';
import 'lastPageNavigator.dart';
import 'location.dart';
import 'models.dart';
import 'package:startup_try_2/models/Product.dart';

class OrderSummary extends StatefulWidget {
  final products;
  final placed;
  const OrderSummary({Key key, this.products, this.placed}) : super(key: key);
  @override
  _OrderSummaryState createState() =>
      _OrderSummaryState(this.products, this.placed);

  // const OrderSummary({Key key}) : super(key: key);

  // @override
  // _OrderSummaryState createState() => _OrderSummaryState();
}

Widget _makeBill(var products, Size size, var total_delivery_charges) {
  int total = 0;
  // int delivery = 20;
  for (int i = 0; i < products.length; i++) {
    total = total +
        (int.parse(products[i]["sp"].toString()) *
            (int.parse(products[i]["qty"].toString())));
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(
          "Order Summary",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // ListView.builder(
      //     itemCount: myCart.length,
      //     shrinkWrap: true,
      //     scrollDirection: Axis.vertical,
      //     itemBuilder: (context, index){
      //       return Padding(
      //         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(myCart[index].itemName + "   x " + myCart[index].quantity.toString(),style: TextStyle(
      //               fontSize: 16,
      //               color: Colors.white,
      //             ),),
      //             Text("Rs. " + (myCart[index].price * myCart[index].quantity).toString(),
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      // ),
      //Divider(thickness: 1.5,color: Colors.white,),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Item Sub-Total",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              "Rs. " + total.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Charges",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              "Rs. " + total_delivery_charges.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Divider(
        thickness: 1.5,
        color: Colors.white,
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              "Rs. " + (total + total_delivery_charges).toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class _OrderSummaryState extends State<OrderSummary> {
  var products;
  var placed = false;
  _OrderSummaryState(this.products, this.placed);
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (int i = 0; i < products.length; i++) {
      total = total +
          (int.parse(products[i]["sp"].toString()) *
              (int.parse(
                  products[i]["qty"].toString()))); //myCart[i].quantity);
    }
    Set<int> shops = Set();
    for (var i in products) {
      shops.add(int.parse(i["s_id"]));
    }
    var total_delivery_charges = delivery_charges * shops.length;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Order Details"),
      ),
      body: products.isNotEmpty
          ? SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "Your Cart",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                products.length.toString() + " items",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        ListView.builder(
                            itemCount: products.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 8.0,
                                          spreadRadius: 2.0,
                                          offset: Offset(0, 5.0)),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 85,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                                "https://shopera-app01.000webhostapp.com/image/${products[index]["p_id"]}_1.png"),
                                            // myCart[index].image,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                products[index]["p_name"],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                // overflow: TextOverflow
                                                //     .ellipsis,
                                              ),
                                              width: size.width * 0.6,
                                            ),
                                            Text(
                                              "Rs. ${products[index]["sp"].toString()}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _makeBill(products, size, total_delivery_charges),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 200,
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            width: size.width,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: Colors.black87,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Address",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 20,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.edit,
                                                ),
                                                iconSize: 20,
                                                color: Colors.grey.shade600,
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: size.width * 0.8,
                                            child: Text(
                                              user_address,
                                              // address.addressLine.toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.payment_outlined,
                                                  color: Colors.black87,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Payment",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                    fontSize: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: size.width * 0.8,
                                            child: Text(
                                              "Cash on Delivery",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Container(
              child: Center(
                child: Container(
                  width: size.width * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSK0tHcC-rQMkhFbm0ZiVnk52ka_j1pkFD9A&usqp=CAU"),
                        height: 300,
                      ),
                      Text(
                        "Looks like you haven't added something to your cart yet",
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      makeBtn("BACK TO HOME", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }, Colors.blue, Colors.white, size),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
      persistentFooterButtons: [
        SizedBox(
          height: 5,
        ),
        if (products.isNotEmpty && !placed)
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                  "Total Payable Amount",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                  ),
                )),
                Container(
                  child: Text(
                    "Rs. " + (total + total_delivery_charges).toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (products.isNotEmpty && !placed)
          Container(
            width: size.width,
            child: Center(
              child: makeBtn("PLACE ORDER", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThankYouPageNavigator(
                            products: products,
                            user_id: user_uid,
                            o_amount: total + total_delivery_charges,
                            o_name: user_name,
                            o_mobile_number: user_mob,
                            o_address_line1: "",
                            o_address_line2: "",
                            o_city: "",
                            o_mode: "homedelivery")));
              }, Colors.blue.shade800, Colors.white, size),
            ),
          ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
