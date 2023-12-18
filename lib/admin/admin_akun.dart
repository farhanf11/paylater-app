import 'dart:ui';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/admin/component/AkunAdminPengawas.dart';
import 'package:paylater/admin/component/AkunCustomer.dart';
import 'package:paylater/admin/component/AkunUnverify.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';

class AdminAkun extends StatefulWidget {
  const AdminAkun({super.key});

  @override
  _AdminAkunState createState() => _AdminAkunState();
}

class _AdminAkunState extends State<AdminAkun> {
  int pageIndex = 0;

  final pages = [
    const AkunCustomer(),
    const AkunUnverify(),
    const AkunAdminPengawas(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff025464),
          title: const Text(
            "Kelola Akun",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Unverify',
              ),
              Tab(
                text: 'User',
              ),
              Tab(
                text: "Admin",
              )
            ],
          ),
        ),
        backgroundColor: PaylaterTheme.white,
        body: const TabBarView(
          children: [
            //Tagihan
            AkunUnverify(),

            //riwayat tagihan
            AkunCustomer(),

            AkunAdminPengawas(),
          ],
        ),
      ),
    );
  }
}
