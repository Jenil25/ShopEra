import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Text("Profile"),
      ),
    );
  }
}
