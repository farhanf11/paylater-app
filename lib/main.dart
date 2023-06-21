import 'package:flutter/material.dart';
import 'package:paylater/admin/AdminNavbarBot.dart';
import 'package:paylater/history_page/detail_tagihan.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/profile_page/biodata.dart';
import 'package:paylater/profile_page/ubah_alamat.dart';
import 'package:paylater/user/HistoryPage.dart';
import 'package:paylater/user/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Biodata(),
    );
  }
}
