import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';

class Description extends StatefulWidget {

  final desc;

  const Description({Key key, this.desc}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState(this.desc);
}

class _DescriptionState extends State<Description> {

  var desc;
  _DescriptionState(this.desc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text("Description",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Expanded(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.all(20.0),
            child: Text(desc,style: TextStyle(color: color,fontSize: MediaQuery.of(context).size.width/15),textAlign: TextAlign.left,),
          ),
        ),
      ),
    );
  }
}
