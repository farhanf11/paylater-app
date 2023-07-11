import 'dart:math';
import 'dart:ui';
import 'package:paylater/admin/component/AkunAdminPengawas.dart';
import 'package:paylater/admin/component/AkunCustomer.dart';
import 'package:paylater/admin/component/AkunUnverify.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';

import '../user/ProfilePage.dart';

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
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff025464),
            title: Text("History", style: TextStyle(fontSize: 16),),
            leading: BackButton(),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Unverify',),
                Tab(text: 'Customer',),
                Tab(text: "Admin Pengawas",)
              ],
            ),
          ),
          backgroundColor: PaylaterTheme.white,
          body: Container(
            color: Color(0xffE3E9EB),
            child: const TabBarView(
              children: [
                //Tagihan
                AkunUnverify(),

                //riwayat tagihan
                AkunCustomer(),

                AkunAdminPengawas(),
              ],
            ),
          ),

      ),
    );
  }
}
