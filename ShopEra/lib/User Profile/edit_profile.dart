import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: color,
        elevation: 1,
        leading: FlatButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
                        editUserDetails(
                            user_uid, new_mob.toString(), new_add.toString());
                      } else if (new_add != "") {
                        editUserDetails(
                            user_uid, user_mob.toString(), new_add.toString());
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
    );
  }
}
