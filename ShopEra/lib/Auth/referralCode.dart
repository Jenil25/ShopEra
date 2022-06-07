import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:startup_try_2/Auth/auth_services.dart';
import 'package:startup_try_2/homepage.dart';
import 'frostedglass.dart';
import 'package:startup_try_2/models/Product.dart';

class ReferralCode extends StatefulWidget {
  @override
  _ReferralCodeState createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  bool isProgressTrue = false;
  String referralCode, error, codeValidate;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController codeController = TextEditingController();

  Widget _buildCode() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: codeController,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            referralCode = value.trim();
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person_add,
              color: Color(0xFF1B0250),
            ),
            labelText: "Enter Referral Code"),
      ),
    );
  }

  Widget _buildSkipBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 25),
          width: 8 * (MediaQuery.of(context).size.width / 15),
          child: OutlinedButton(
            style: ButtonStyle(
              // TODO Button style
              // side: MaterialStateBorderSide,
              // borderSide: BorderSide(color: Color(0xFF1B0250), width: 1.5),
              // shape:
              // RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
            onPressed: () async {
              setState(() {
                isProgressTrue = true;
              });
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => HomePage()));
              setState(() {
                isProgressTrue = false;
              });
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Color(0xFF1B0250),
                letterSpacing: 1.1,
                fontSize: MediaQuery.of(context).size.height / 43,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 25),
          width: 8 * (MediaQuery.of(context).size.width / 15),
          child: RaisedButton(
            onPressed: () async {
              setState(() {
                isProgressTrue = true;
              });
              try {
                codeValidate = CodeValidator.validate(referralCode);
                if (codeValidate == null) {
                  //function to check whether code exists in the DB
                  //and if it exists, shopOwnerCustomer++
                  int sid = checkcode(referralCode.toUpperCase());
                  if (sid != 0) {
                    incrShopSignups(sid.toString());
                    print("Valid");
                    setState(() {
                      isProgressTrue = false;
                    });
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => HomePage()));
                  } else {
                    print(referralCode.toUpperCase());
                    error = "Invalid Code.Try Again";
                    AlertDialog alert = AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          Text(
                            " Error",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      content: Text(error),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                  setState(() {
                    isProgressTrue = false;
                  });
                } else {
                  error = codeValidate;
                  AlertDialog alert = AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        Text(
                          " Error",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    content: Text(error),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                  setState(() {
                    isProgressTrue = false;
                  });
                }
              } catch (e) {
                print(e);
                error = e.message;
                AlertDialog alert = AlertDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      Text(
                        " Error",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  content: Text(error),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
                setState(() {
                  isProgressTrue = false;
                });
              }
            },
            elevation: 5.0,
            color: Color(0xFF1B0250),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.1,
                fontSize: MediaQuery.of(context).size.height / 43,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReferralCode() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Referral Code",
                style: TextStyle(
                  color: Color(0xFF1B0250),
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 25,
                ),
              ),
            ],
          ),
          Divider(),
          Center(
            child: Text(
              "Enter the referral code you received from the shop to avail more offers."
              "If you don't have one, you can skip it.",
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          _buildCode(),
          SizedBox(
            height: 20,
          ),
          _buildSkipBtn(),
          SizedBox(
            height: 20,
          ),
          _buildContinueBtn(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.90;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1B0250),
        // resizeToAvoidBottomPadding: false,
        body: ModalProgressHUD(
          inAsyncCall: isProgressTrue,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("assets/images/logo_wp1.png").image,
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FrostedGlassBox(
                    width: contWidth,
                    height: 1.3 * contWidth,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildReferralCode(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
