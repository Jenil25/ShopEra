import 'package:flutter/material.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';
import '../ShopPage/shoppage.dart';
import 'package:startup_try_2/models/Product.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(product: product),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all((20)),
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
                      child: Image.network(
                          "https://shopera-app01.000webhostapp.com/image/${product["p_id"]}_1.png"),
                      // Text("Image"),
                      // Image.asset(product.image),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        product["p_name"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "Rs. ${product["sp"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                              text: "   x quantity",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: product)),
              );
            },
            //icon: Icon(Icons.shopping_bag),
            child: Text(
              'View Product',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
