import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/homepage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:startup_try_2/Auth/signup.dart';
import 'referralCode.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  Timer timer;
  bool isProgressTrue = false;
  Future<List> sendUserData(String email, String name) async {
    print("new User created");
    final response =
        await http.post(Uri.parse("https://shopera-app01.000webhostapp.com/uploadUserDetails.php"), body: {
      "u_email": email,
      "name": name,
    });
    print("new User created returned "+response.toString());
  }

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Container(
            height: 0.4 * height,
            width: width,
            child: Image(
              image: Image.asset(
                      "assets/images/initialScreens/verificationScreen.png")
                  .image,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          CircularProgressIndicator(),
          Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "A verification link has been sent to ${user.email}",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Text(
                "Please Verify",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ],
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      sendUserData(user.email, name);
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => ReferralCode()));
    }
  }
}
