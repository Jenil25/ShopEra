import 'package:flutter/material.dart';
import 'package:startup_try_2/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue.shade700,
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Miroslava Savitskaya',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/15),),
              Text('Status : Active',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/17))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: drawerItems.map((element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(element['icon'],color: Colors.white,size: 30,),
                  SizedBox(width: 10,),
                  Text(element['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                ],
              ),
            )).toList(),
          ),
          Row(),
        ],
      ),
    );
  }
}
