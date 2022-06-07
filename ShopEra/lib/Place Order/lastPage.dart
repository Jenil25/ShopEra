import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models.dart';
import 'order_details.dart';
import 'location.dart';
import 'package:startup_try_2/homepage.dart';

Widget makeBtn(
    String title, Function onPressed, Color c1, Color c2, Size size) {
  return TextButton(
    onPressed: onPressed,
    child: Container(
      width: size.width * 0.8,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 30.0,
            spreadRadius: 0,
            offset: Offset(0.0, 30.0),
          ),
        ],
        color: c1,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: c2,
          ),
        ),
      ),
    ),
  );
}

class ThankYouPage extends StatefulWidget {
  final products;
  const ThankYouPage({Key key, this.products}) : super(key: key);
  @override
  _ThankYouPageState createState() => _ThankYouPageState(this.products);
  // const ThankYouPage({Key key}) : super(key: key);

  // @override
  // _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  var products;
  _ThankYouPageState(this.products);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Thank You !",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Your order has been successfully placed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Image.asset(
                "assets/delivery.gif",
                fit: BoxFit.fitHeight,
              ),
              height: 300,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text("Estimated delivery in ",style: TextStyle(
            //       color: Colors.grey,
            //       fontSize: 20,
            //     ),),
            //     Text("30 minutes",style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //     ),),
            //   ],
            // ),
            SizedBox(
              height: 40,
            ),
            Text(
              products.length.toString() + " items will be delivered at",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Address here",
                // address.addressLine.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            makeBtn("BACK TO HOME", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              setState(() {
                products.clear();
              });
            }, Colors.blue, Colors.white, size),
            SizedBox(
              height: 10,
            ),
            makeBtn("ORDER DETAILS", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OrderSummary(products: products, placed: true)));
            }, Colors.white, Colors.black, size),
          ],
        ),
      ),
    );
  }
}
