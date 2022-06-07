import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:startup_try_2/Shop_Owner/delivery.dart';
import 'package:startup_try_2/Shop_Owner/product_detail.dart';
import 'package:startup_try_2/Shop_Owner/shop_profile.dart';
import 'package:startup_try_2/Shop_Owner/your_orders.dart';
import 'package:startup_try_2/Shop_Owner/drawer_shop.dart';

class UserProductsScreen extends StatelessWidget {
  var title = 'Horse';

  var image =
      "https://imgk.timesnownews.com/story/Dreaming_about_a_horse.jpg?tr=w-600,h-450";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //final productData = Provider.of<Products>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersScreen(),
                  //builder: (context) => EditProfilePage(),
                  //builder: (context) => EditProductScreen(),
                  //builder: (context) => DeliveryPage()
                ),
              );
            },
          ),
        ],
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
