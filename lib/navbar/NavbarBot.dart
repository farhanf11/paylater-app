import 'package:flutter/material.dart';
import 'package:paylater/user/HistoryPage.dart';
import 'package:paylater/user/LandingPage.dart';
import 'package:paylater/user/ProfilePage.dart';

class NavbarBot extends StatefulWidget {
  const NavbarBot({Key? key}) : super(key: key);

  @override
  _NavbarBotState createState() => _NavbarBotState();
}

class _NavbarBotState extends State<NavbarBot> {
  int pageIndex = 0;

  final pages = [
    LandingPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Color(0xFF005E54),
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              size: 35,
              color: Color(0xFF005E54),
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.fact_check,
              color: Color(0xFF005E54),
              size: 35,
            )
                : const Icon(
              Icons.fact_check_outlined,
              color: Color(0xFF005E54),
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.person,
              color: Color(0xFF005E54),
              size: 35,
            )
                : const Icon(
              Icons.person_outline,
              color: Color(0xFF005E54),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}