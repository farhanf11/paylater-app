import 'dart:ui';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:paylater/user/DaftarPage.dart';
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
              child: Image.asset(
                'assets/images/logo-landing.png',
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
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/ilkompay.png',
                    width: 200,
                    height: 80,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Siap Memenuhi Kebutuhanmu',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      const Text(
                        'Tanpa Bunga',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      const Text(
                        'Dan',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      const Text(
                        'Bebas Riba',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Color(0xff025464)),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 100)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DaftarPage()),
                        ),
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                              color: Color(0xff025464),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
