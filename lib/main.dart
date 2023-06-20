import 'package:flutter/material.dart';
import 'package:paylater/launcherPage.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/profile_page/edit_profile.dart';
import 'package:paylater/user/HistoryPage.dart';
import 'package:paylater/user/KategoriPage.dart';
import 'package:paylater/user/LoginPage.dart';
import 'package:paylater/user/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
