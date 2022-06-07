import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = true, isEditTrue = false;
  var c1 = 0;
  var c2 = 0;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController add = TextEditingController();
  TextEditingController contact = TextEditingController();

  var new_mob = "", new_add = "";
  var image =
      "https://imgk.timesnownews.com/story/Dreaming_about_a_horse.jpg?tr=w-600,h-450";
  Widget buildTextField(
      String labelText, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          alignLabelWithHint: true,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }

  Widget buildTextContent(String fieldValue, String value, bool isAddress,
      int maxlines, Color textcolor) {
    var height = MediaQuery.of(context).size.height / 3.5;
    var width = MediaQuery.of(context).size.width * 0.55;
    GetUser(user_email);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Text(
              fieldValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            Container(
              child: Text(" : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Container(
                width: width,
                height: isAddress == true ? height : null,
                child: Text(
                  value,
                  maxLines: maxlines,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, color: textcolor),
                )),
          ],
        ),
      ),
    );
  }

  var c3 = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (c3 == 0) {
      c1 = 0;
      c2 = 0;
    }
    return isEditTrue == true
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Edit Profile"),
              backgroundColor: color,
              elevation: 1,
              leading: FlatButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsUI()),
                  );
                  // Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              width: size.width,
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: TextField(
                        maxLines: 6,
                        controller: add,
                        obscureText: false,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          suffixIcon: null,
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: 'Address',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: c1.isOdd ? "" : user_address,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: color),
                        ),
                        onChanged: (value) {
                          new_add = value;
                        },
                        onTap: () {
                          setState(() {
                            ++c1;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: TextField(
                        obscureText: false,
                        controller: contact,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: null,
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: 'Contact No.',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: c2.isOdd ? "" : user_mob,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: color),
                        ),
                        onChanged: (value) {
                          new_mob = value.trim();
                        },
                        onTap: () {
                          setState(() {
                            ++c2;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            //TODO Button Style
                            // padding: EdgeInsets.symmetric(horizontal: 50),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            setState(() {
                              isEditTrue = false;
                              c3 = 0;
                            });
                          },
                          child: Text("CANCEL",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (new_add != "" && new_mob != "") {
                              editUserDetails(user_uid, new_mob.toString(),
                                  new_add.toString());
                            } else if (new_add != "") {
                              editUserDetails(user_uid, user_mob.toString(),
                                  new_add.toString());
                            } else if (new_mob != "") {
                              editUserDetails(user_uid, new_mob.toString(),
                                  user_address.toString());
                            }
                            setState(() {
                              isEditTrue = false;
                            });
                          },
                          color: color,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: color,
              title: Text("Profile"),
              elevation: 1,
              leading: FlatButton(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  tooltip: "Edit Profile",
                  icon: Icon(
                    Icons.mode_edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isEditTrue = true;
                    });
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                height: 750,
                width: size.width,
                padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: color.withOpacity(0.5),
                                  offset: Offset(0, 3))
                            ],
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              user_name[0],
                              style: TextStyle(
                                  fontSize: 65,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1B0250)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: size.width,
                        // margin: EdgeInsets.all(5.0),
                        // color: Colors.blueAccent,
                        height: 70,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            // Those are our background
                            Container(
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color(0xFF005FA1),
                                //boxShadow: [kDefaultShadow],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            // our product image

                            // Product title and price
                            Positioned(
                              top: 20,
                              left: 0,
                              child: buildTextContent(
                                  "  Name     ", user_name, false, 1, color),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: size.width,
                        // margin: EdgeInsets.all(5.0),
                        // color: Colors.blueAccent,
                        height: 100,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            // Those are our background
                            Container(
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color(0xFFFFA41B),
                                //boxShadow: [kDefaultShadow],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            // our product image

                            // Product title and price
                            Positioned(
                              top: 20,
                              left: 0,
                              child: buildTextContent(
                                  "  Email     ", user_email, false, 2, color),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: size.width,
                        // margin: EdgeInsets.all(5.0),
                        // color: Colors.blueAccent,
                        height: 90,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            // Those are our background
                            Container(
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color(0xFF005FA1),
                                //boxShadow: [kDefaultShadow],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            // our product image

                            // Product title and price
                            Positioned(
                              top: 20,
                              left: 0,
                              child: buildTextContent(
                                  "  Contact \n  No.",
                                  user_mob == null
                                      ? "Click on edit button to add"
                                      : user_mob,
                                  false,
                                  2,
                                  user_mob == null ? Colors.red : color),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: size.width,
                        // margin: EdgeInsets.all(5.0),
                        // color: Colors.blueAccent,
                        height: 200,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            // Those are our background
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color(0xFFFFA41B),
                                //boxShadow: [kDefaultShadow],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            // our product image

                            // Product title and price
                            Positioned(
                              top: 20,
                              left: 0,
                              child: buildTextContent(
                                  "  Address",
                                  user_address == null
                                      ? "Click on edit button to add"
                                      : user_address,
                                  true,
                                  6,
                                  user_address == null ? Colors.red : color),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
