import 'dart:ui';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:paylater/user/LoginPage.dart';


class LandingPage extends StatefulWidget{
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF006A8B), Colors.tealAccent.shade700]
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: new Image.asset('../assets/images/logo-landing.png', height: 120, width: 120,),
            ),
            SizedBox(height: 60,),
            Container(
              height: 557,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
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
                  Image.asset('../assets/images/ilkompay.png', width: 200, height: 80,),
                  Container(
                    child: Column(
                      children: [
                        Text('Siap Memenuhi Kebutuhanmu', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                        Text('Tanpa Bunga', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                        Text('Dan', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                        Text('Bebas Riba', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                        SizedBox(height: 24,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          margin: EdgeInsets.symmetric(horizontal: 65),
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: Color(0xff1288B5),
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white
                          ),
                          child: TextButton(onPressed: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => LoginPage())),
                            child: Text('Login',
                            style: TextStyle(
                                color: Color(0xff1288B5),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),)
                        ),
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

