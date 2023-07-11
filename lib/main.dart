import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/launcherPage.dart';
import 'package:paylater/user/DaftarPage.dart';
import 'package:paylater/user/LandingPage.dart';
import 'package:paylater/user/LoginPage.dart';

import 'components/cityPicker.dart';

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
      home: AdminNavbarBot(),
    );
  }
}
