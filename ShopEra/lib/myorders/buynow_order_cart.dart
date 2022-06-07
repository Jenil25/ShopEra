import 'package:flutter/material.dart';
// import './models/Product.dart';

class BuynowCartCard extends StatelessWidget {
  const BuynowCartCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all((10)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.image),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product["p_name"],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "\$${product["sp"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                          text: "   x${2}",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
