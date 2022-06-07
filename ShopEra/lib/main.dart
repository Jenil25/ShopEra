import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:startup_try_2/Auth/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:startup_try_2/delivery_home_page.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:startup_try_2/Auth/onboardingScreen.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/Shop_Owner/homePage.dart';
import 'dart:io';

import 'Shop_Owner/shopdetails.dart';

bool connected = false;

void checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connected = true;
    } else {
      connected = false;
    }
  } on SocketException catch (_) {
    connected = false;
  }
}

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool checkShopUser(var email){
  //   for(var i in shops){
  //     if(email == i["s_email"]){
  //       return true;
  //     }
  //   }
  //   return false;
  // }
  // bool checkDeliveryUser(var email){
  //   print("inside checkDeliveryUser");
  //   print("After func call");
  //   for(var i=0;i<deliveryemail.length;i++){
  //     print("Inside for");
  //     if(email == deliveryemail[i]["dp_email"]){
  //       print("Got user in delivery");
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    checkInternet();
    Datacategory();
    Dataproduct();
    Datashop();
    Datadelivery();
    Dataobject();
    Dataimage();
    DataCities();
    CarousalImages();
    OfferImages();
    GetVariables();
    // if (_auth != null) {
    //   tempcart(user_uid);
    //   print("_auth.currentUser.email in main");
    //   print(_auth.currentUser.email);
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
          )
        ],
        child: MaterialApp(
          title: "Shopera",
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  bool checkShopUser(var email) {
    for (var i in shops) {
      if (email == i["s_email"]) {
        shop_user = i;
        return true;
      }
    }
    return false;
  }

  bool checkDeliveryUser(var email) {
    print("inside checkDeliveryUser");
    print("After func call");
    for (var i = 0; i < deliveryemail.length; i++) {
      print("Inside for");
      if (email == deliveryemail[i]["dp_email"]) {
        delivery_user = deliveryemail[i];
        print("Got user in delivery");
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      if (checkShopUser(firebaseUser.email)) {
        return ShopOwnerHome();
      } else if (checkDeliveryUser(firebaseUser.email)) {
        return DeliveryHome();
      }
      return HomePage();
    }
    return IntroScreen();
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AuthenticationWrapper())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B0250),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Container(
              height: 0.4 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image:
                    Image.asset("assets/images/shopera_splashscreen.png").image,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text(
              "The Online Shopping Community",
              softWrap: true,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
