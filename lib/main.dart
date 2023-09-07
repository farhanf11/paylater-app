import 'package:flutter/material.dart';
import 'package:paylater/admin/admin_keuangan.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/profile_page/biodataPage.dart';
import 'package:paylater/user/DaftarPage.dart';
import 'package:paylater/user/HomePage.dart';
import 'package:paylater/user/LoginPage.dart';
import 'package:paylater/user/ProfilePage.dart';
import 'package:paylater/user/VerifyPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavbarBot(),
    );
  }
}
