import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paylater/user/LandingPage.dart' as user;
import 'dart:async';

class LauncherPage extends StatefulWidget {  
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage>{
  @override
  void initState(){
    super.initState();
    startLaunching();
  }

  @override
  void dispose(){
    super.dispose();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 4);
    return new Timer(duration, () {
      Navigator.of(context)
          .pushReplacement(new MaterialPageRoute(builder: (_) {
        return new user.LandingPage();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              blurRadius: 2,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade800, Colors.tealAccent.shade700]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new Image.asset('assets/images/logo-depan.png', height: 100, width: 100,),
            )
          ],
        ),
      ),
    );
  }
  
}