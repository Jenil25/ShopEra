import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  var sub;
  void launchgmail(String mail_id, String sub) async {
    var mail = 'mailto:$mail_id?subject=$sub&body=';
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw 'Could not launch $mail';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: color,
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: height * 0.7,
            width: width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.amber[900],
                  Colors.amber[700],
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CustomPaint(
                size: Size(width, height),
                painter: CardCustomPainter(),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          width: width,
                          child: Image.asset(
                            'assets/images/logo.png',
                            color: Colors.amber[700],
                            width: width * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "For App related queries drop a message at : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width / 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        GestureDetector(
                          onTap: () {
                            launchgmail("support@shoperaweb.com",
                                "App Related Queries");
                          },
                          child: detailWidget(
                            icon: Icons.email,
                            text: 'support@shoperaweb.com',
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "For Delivery related queries drop a message at : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width / 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        GestureDetector(
                          onTap: () {
                            launchgmail("delivery@shoperaweb.com",
                                "Delivery Related Queries");
                          },
                          child: detailWidget(
                            icon: Icons.email,
                            text: 'delivery@shoperaweb.com',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailWidget({IconData icon, String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white70,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class CardCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.32);
    path.quadraticBezierTo(size.width * 0.24, size.height * 0.45,
        size.width * 0.49, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.73, size.height * 0.45, size.width, size.height * 0.32);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
