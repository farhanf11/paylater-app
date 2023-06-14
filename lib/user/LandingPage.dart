import 'dart:ui';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:paylater/user/LoginPage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff025464), Colors.tealAccent.shade700]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: new Image.asset(
                '../assets/images/logo-landing.png',
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 557,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, -2))
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 36, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ILKOM PAY',
                    style: TextStyle(
                        fontFamily: 'Mochiy Pop P One',
                        color: Color(0xff025464),
                        fontSize: 24),
                  ),
                  // Image.asset(
                  //   '../assets/images/ilkompay.png',
                  //   width: 200,
                  //   height: 80,
                  // ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Siap Memenuhi Kebutuhanmu',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xff025464)),
                        ),
                        Text(
                          'Tanpa Bunga',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xff025464)),
                        ),
                        Text(
                          'Dan',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xff025464)),
                        ),
                        Text(
                          'Bebas Riba',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xff025464)),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage())),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 72, vertical: 10),
                              margin: EdgeInsets.symmetric(horizontal: 65),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xff025464)),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
