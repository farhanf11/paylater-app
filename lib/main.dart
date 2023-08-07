import 'package:flutter/material.dart';
import 'package:paylater/admin/admin_permintaanCicilan.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/admin/detail_AkunCustomer.dart';
import 'package:paylater/history_page/detail_tagihan.dart';
import 'package:paylater/history_page/rincianPembayaran.dart';
import 'package:paylater/launcherPage.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/user/AkadCustomer.dart';
import 'package:paylater/user/DaftarPage.dart';
import 'package:paylater/user/DetailPembayaran.dart';

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
      home: DetailPembayaran(),
    );
  }
}
