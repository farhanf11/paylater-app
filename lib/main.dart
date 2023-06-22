import 'package:flutter/material.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/profile_page/helpCenter.dart';
import 'package:paylater/profile_page/privacyPolicy.dart';
import 'package:paylater/user/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
