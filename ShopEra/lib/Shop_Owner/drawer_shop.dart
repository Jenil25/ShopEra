import 'package:flutter/material.dart';
import 'package:startup_try_2/Auth/login.dart';
// import 'package:startup_try_2/Cart/cartScreen.dart.dart';
// import 'favorites.dart';
import 'package:startup_try_2/Cart/cartScreen.dart';
import 'package:startup_try_2/help.dart';
import 'package:startup_try_2/my_orders.dart';
import 'package:startup_try_2/Favourites/favorites_navigator.dart';
import 'package:startup_try_2/Shop_Owner/shop_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'shopdetails.dart';
import 'package:startup_try_2/main.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:startup_try_2/myorders/my_orders_screen.dart';

class NavDrawer extends StatelessWidget {
  void GetFav(var u_id) async {
    // cart_products.clear();
    print("User_uid");
    print(u_id);
    final response = await http.post(
        Uri.parse("https://shopera-app01.000webhostapp.com/getFavouriteData.php"),
        body: {"u_id": u_id});
    // final response2 = await http.patch("url");
    fav_list = jsonDecode(response.body);
    fav_length = fav_list.length;
    loaded_fav = true;
    print("Inside getfav");
    for (var i = 0; i < fav_list.length; i++) {
      for (var j = 0; j < products_list.length; j++) {
        if (fav_list[i]["p_id"] == products_list[j]["p_id"]) {
          if (fav_products.contains(products_list[j]) == false) {
            fav_products.add(products_list[j]);
            // print(cart_products);
            print("Added product in fav");
          }
        }
      }
    }
  }

  void GetCart(var u_id) async {
    // cart_products.clear();
    print("User_uid");
    print(u_id);
    final response = await http
        .post(Uri.parse("https://shopera-app01.000webhostapp.com/getCartData.php"), body: {"u_id": u_id});
    // final response2 = await http.patch("url");
    cart_list = jsonDecode(response.body);
    cart_length = cart_list.length;
    loaded_cart = true;
    print("Inside getcart");
    for (var i = 0; i < cart_list.length; i++) {
      for (var j = 0; j < products_list.length; j++) {
        if (cart_list[i]["p_id"] == products_list[j]["p_id"]) {
          if (cart_products.contains(products_list[j]) == false) {
            cart_products.add(products_list[j]);
            qty.add(cart_list[i]["qty"]);
            // print(cart_products);
            print("Added product in cart");
          }
        }
      }
    }
  }

  final auth = FirebaseAuth.instance;
  User user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: color,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/drawer_top.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: Center(
                      child: Text(
                        'h', //${user_name[0]}',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'jj', //$user_name',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopProfilePage()),
                )
              },
            ),
            Divider(
              height: 0,
              color: Colors.white,
              thickness: 0.4,
              indent: 40,
              endIndent: 40,
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
              title: Text(
                'My Orders',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrders()),
                )
              },
            ),
            Divider(
              height: 0,
              color: Colors.white,
              thickness: 0.4,
              indent: 40,
              endIndent: 40,
            ),
            ListTile(
              leading: Icon(
                Icons.store_mall_directory,
                color: Colors.white,
              ),
              title: Text(
                'My Products',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                GetFav(user_uid),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavouritesNavigator()),
                )
              },
            ),
            Divider(
              height: 0,
              color: Colors.white,
              thickness: 0.4,
              indent: 40,
              endIndent: 40,
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.white,
              ),
              title: Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Help()),
                )
              },
            ),
            Divider(
              height: 0,
              color: Colors.white,
              thickness: 0.4,
              indent: 40,
              endIndent: 40,
            ),
            ListTile(
              leading: Icon(
                Icons.security,
                color: Colors.white,
              ),
              title: Text(
                'Policy',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                GetCart(user_uid),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                )
              },
            ),
            Divider(
              height: 0,
              color: Colors.white,
              thickness: 0.4,
              indent: 40,
              endIndent: 40,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {
                auth.signOut(),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage())),
              },
            ),
            Divider(
              height: 0,
              color: Colors.white,
              thickness: 0.4,
              indent: 40,
              endIndent: 40,
            ),
          ],
        ),
      ),
    );
  }
}
