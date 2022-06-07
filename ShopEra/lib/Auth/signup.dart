import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:startup_try_2/Auth/auth_services.dart';
import 'package:startup_try_2/Auth/emailverification.dart';
import 'package:startup_try_2/Auth/frostedglass.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/Auth/referralCode.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

String name;

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = true, showConfirmPassword = true, isProgressTrue = false;
  String email,
      password,
      confirmPassword,
      error,
      passwordValidate = "a",
      nameValidate = "a";
  //,confirmPasswordValidate
  final TextEditingController textController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: textController,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            name = value.trim();
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: color,
            size: 30,
          ),
          labelText: "Name",
          labelStyle: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
//        onSaved: (value) => email=value,
//        validator: EmailValidator.validate,
        onChanged: (value) {
          setState(() {
            email = value.trim();
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xFF1B0250),
            size: 30,
          ),
          labelText: "E-mail",
          labelStyle: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: showPassword,
//        onSaved: (value) => password = value,
//        validator: PasswordValidator.validate,
        onChanged: (value) {
          setState(() {
            password = value.trim();
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Color(0xFF1B0250),
            size: 30,
          ),
          labelText: "Password",
          labelStyle: TextStyle(
            color: color,
          ),
          suffixIcon: showPassword
              ? IconButton(
                  icon: Icon(
                    Icons.visibility_off,
                    color: Color(0xFF1B0250),
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )
              : IconButton(
                  icon: Container(
                    child: Icon(
                      Icons.visibility,
                      color: Color(0xFF1B0250),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: showConfirmPassword,
//        onSaved: (value) => password = value,
//        validator: PasswordValidator.validate,
        onChanged: (value) {
          setState(() {
            confirmPassword = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xFF1B0250),
            size: 30,
          ),
          labelText: "Confirm Password",
          labelStyle: TextStyle(
            color: color,
          ),
          suffixIcon: showConfirmPassword
              ? IconButton(
                  icon: Icon(
                    Icons.visibility_off,
                    color: Color(0xFF1B0250),
                  ),
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                )
              : IconButton(
                  icon: Container(
                    child: Icon(
                      Icons.visibility,
                      color: Color(0xFF1B0250),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      height: 1.4 * (MediaQuery.of(context).size.height / 25),
      width: 6 * (MediaQuery.of(context).size.width / 15),
      child: RaisedButton(
        onPressed: () async {
          try {
            // setState(() {
            //   //isProgressTrue = true;
            // });
            print("${email},${password}");
            passwordValidate = PasswordValidator.validate(password);
            nameValidate = NameValidator.validate(name);
            if (passwordValidate == null && nameValidate == null) {
              setState(() {
                isProgressTrue = true;
              });
              print("In if");
              if (password == confirmPassword) {
                final newUser = await auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
//              FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => VerifyScreen()));
                  setState(() {
                    isProgressTrue = false;
                  });
                }
              } else {
                error = "Passwords do not match";
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
//                  actions: [
//                    FlatButton(
//                      child: Text("OK"),
//                      onPressed: () {
//                        setState(() {
//                          Navigator.of(context).push(MaterialPageRoute(
//                              builder: (context) => SignUpPage()));
//                        });
//                      },
//                    )
//                  ],
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
            } else if (nameValidate == null) {
              setState(() {
                isProgressTrue = true;
              });
              error = passwordValidate;
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
//                actions: [
//                  FlatButton(
//                    child: Text("OK"),
//                    onPressed: () {
//                      setState(() {
//                        Navigator.of(context).push(MaterialPageRoute(
//                            builder: (context) => SignUpPage()));
//                      });
//                    },
//                  )
//                ],
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
            } else if (passwordValidate == null) {
              setState(() {
                isProgressTrue = true;
              });
              error = nameValidate;
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
//                actions: [
//                  FlatButton(
//                    child: Text("OK"),
//                    onPressed: () {
//                      setState(() {
//                        Navigator.of(context).push(MaterialPageRoute(
//                            builder: (context) => SignUpPage()));
//                      });
//                    },
//                  )
//                ],
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
            } else {
              setState(() {
                isProgressTrue = true;
              });
              print("In else");
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
                content: Text("Enter Values"),
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
          }
//          try{
//         final newUser = await auth.createUserWithEmailAndPassword(email: email, password: password);
//            if(newUser != null){
////              FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => VerifyScreen()));
//            }
//          }
          catch (e) {
            print(e);
            error = e.message;
            setState(() {
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
//                actions: [
//                  FlatButton(
//                    child: Text("OK"),
//                    onPressed: () {
//                      setState(() {
//                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
//                      });
//                    },
//                  )
//                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
              isProgressTrue = false;
            });
          }
        },
        elevation: 5.0,
        color: Color(0xFF1B0250),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.1,
            fontSize: MediaQuery.of(context).size.height / 43,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // height: MediaQuery.of(context).size.height/2.5,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 0.65 * MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage("assets/images/auth_header.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildName(),
                    _buildEmail(),
                    _buildPassword(),
                    _buildConfirmPassword(),
                    // _buildName(),
                    // _buildEmail(),
                    // _buildPassword(),
                    // _buildConfirmPassword(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildSignUpBtn(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double contWidth = size.width * 0.90;
    double contHeight = size.height * 0.90;
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
                    height: contHeight * 0.7,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildSignUp(),
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
