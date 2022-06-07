import 'package:flutter/material.dart';
import 'package:startup_try_2/drawerScreen.dart';
import 'package:startup_try_2/homepage.dart';

class DrawerImp extends StatefulWidget {
  @override
  _DrawerImpState createState() => _DrawerImpState();
}

class _DrawerImpState extends State<DrawerImp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          DrawerScreen(),
          HomePage(),
        ],
      ),
    );
  }
}
