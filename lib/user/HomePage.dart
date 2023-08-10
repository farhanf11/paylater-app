import 'dart:ui';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:paylater/user/AkadCustomer.dart';
import 'package:paylater/user/homeComponents/kategoriComp.dart';
import 'package:paylater/user/homeComponents/trendingComp.dart';
import '../components/home_page/banner_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
      body: Container(
        color: Colors.white,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        '../assets/images/background/bg-landing.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/logo.png',
                                height: 48,
                              ),
                              Text(
                                'Paylater Syariah',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BannerView(),
                ],
              ),
            ),

            Container(
              height: 100,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
                color: Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(color: Colors.blue[500], fontSize: 16),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.orangeAccent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white)),
                            prefixIcon: Icon(Icons.link),
                            suffix: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.lightBlueAccent))),
                              ),
                              child: Text('Submit'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => RincianAkad())),
                            ),
                            hintText: 'Paste link here',
                            hintStyle:
                                TextStyle(color: Colors.grey.shade600, fontSize: 15)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'tempel link url barang yang ingin anda ajukan pada kolom diatas*',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),

            KategoriComp(),

            TrendingComp(),
          ],
        ),
      ),
    );
  }
}
