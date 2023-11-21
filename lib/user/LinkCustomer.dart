import 'dart:ui';
import 'package:paylater/admin/component/AkunUnverify.dart';
import 'package:paylater/admin/component/TransaksiPermintaan.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:paylater/user/AcceptedLink.dart';
import 'package:paylater/user/RiwayatPengajuanLink.dart';

class LinkCustomer extends StatefulWidget {
  const LinkCustomer({super.key});

  @override
  _LinkCustomerState createState() => _LinkCustomerState();
}

class _LinkCustomerState extends State<LinkCustomer> {
  int pageIndex = 0;

  final pages = [
    const RiwayatPengajuanLink(),
    const AcceptedLink(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff025464),
          title: const Text(
            "Daftar Link",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Diajukan',
              ),
              Tab(
                text: 'Diterima',
              ),
            ],
          ),
        ),
        backgroundColor: PaylaterTheme.white,
        body: const TabBarView(
          children: [
            //request Link
            RiwayatPengajuanLink(),

            //link accepted
            AcceptedLink(),
          ],
        ),
      ),
    );
  }
}
