import 'dart:ui';
import 'package:paylater/admin/component/AkunAdminPengawas.dart';
import 'package:paylater/admin/component/AkunCustomer.dart';
import 'package:paylater/admin/component/AkunUnverify.dart';
import 'package:paylater/admin/component/TransaksiBerlangsung.dart';
import 'package:paylater/admin/component/TransaksiPermintaan.dart';
import 'package:paylater/admin/component/TransaksiSelesai.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';

class AdminTransaksi extends StatefulWidget {
  const AdminTransaksi({super.key});

  @override
  _AdminTransaksiState createState() => _AdminTransaksiState();
}

class _AdminTransaksiState extends State<AdminTransaksi> {
  int pageIndex = 0;

  final pages = [
    const TransaksiPermintaan(),
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
          title: Text(
            "Daftar Transaksi",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Permintaan',
              ),
              Tab(
                text: 'Berlangsung',
              ),
              Tab(
                text: "Selesai",
              )
            ],
          ),
        ),
        backgroundColor: PaylaterTheme.white,
        body: const TabBarView(
          children: [
            //Tagihan
            TransaksiPermintaan(),

            //riwayat tagihan
            TransaksiBerlangsung(),

            TransaksiSelesai(),
          ],
        ),
      ),
    );
  }
}
