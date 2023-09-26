import 'package:flutter/material.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/user/LoginPage.dart';
import 'package:paylater/user/TransferBank.dart';

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
