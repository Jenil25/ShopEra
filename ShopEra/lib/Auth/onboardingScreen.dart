import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:startup_try_2/Auth/emailverification.dart';
import 'login.dart';

class IntroScreen extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
    PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    contentMargin: const EdgeInsets.all(10),
  );

  List<PageViewModel> getPages() {
    return [
//      PageViewModel(
//      title: "Title of first page",
//      bodyWidget: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: const [
//          Text("Click on "),
//          Icon(Icons.edit),
//          Text(" to edit a post"),
//          ],
//        ),
//      image: const Center(child: Icon(Icons.android)),
//      ),
      PageViewModel(
          image: Image.asset("assets/images/introScreen/intro_1.png",fit: BoxFit.scaleDown,),
          title: "Various Shops and Products",
          body: "Explore products from your nearby shops online.",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/images/introScreen/intro_2.png"),
          title: "Process your checkout",
          body: "Secure and Easy checkouts",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/images/introScreen/intro_3.png"),
          title: "Choose Products and Rate",
          body: "Rate products and even add them to your favourites list",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/images/introScreen/intro_4.png"),
          title: "Fast Delivery",
          body: "Get products delivered in no time!",
          decoration: pageDecoration),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showSkipButton: true,
        showNextButton: true,
        skip: Text("SKIP",style: TextStyle(fontSize: 20,color: Color(0xFF1E0250)),),
        done: Text("DONE",style: TextStyle(fontSize: 20,color: Color(0xFF1E0250)),),
        next: Text("NEXT",style: TextStyle(fontSize: 20,color: Color(0xFF1E0250)),),
        onDone: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
        },
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(25.0, 10.0),
            activeColor: Color(0xFF1B0250),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}