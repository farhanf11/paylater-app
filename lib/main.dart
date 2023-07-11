import 'package:flutter/material.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/history_page/detail_tagihan.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/user/DaftarPage.dart';
import 'package:paylater/user/LandingPage.dart';
import 'package:paylater/user/ProfilePage.dart';
import 'package:paylater/user/TransferBank.dart';
import 'package:paylater/user/VerifyFace.dart';
import 'launcherPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerifyFace(),
    );
  }
}
