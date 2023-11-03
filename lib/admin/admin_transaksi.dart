import 'dart:ui';
import 'package:paylater/admin/component/AkunAdminPengawas.dart';
import 'package:paylater/admin/component/AkunCustomer.dart';
import 'package:paylater/admin/component/AkunUnverify.dart';
import 'package:paylater/admin/component/TransaksiBerlangsung.dart';
import 'package:paylater/admin/component/TransaksiPermintaan.dart';
import 'package:paylater/admin/component/TransaksiSelesai.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';

import 'component/PermintaanLink.dart';

class AdminTransaksi extends StatefulWidget {
  const AdminTransaksi({super.key});

  @override
  _AdminTransaksiState createState() => _AdminTransaksiState();
}

class _AdminTransaksiState extends State<AdminTransaksi> {
  int pageIndex = 0;

  final pages = [
    const PermintaanLink(),
    const TransaksiPermintaan(),
    const AkunUnverify(),
    const AkunAdminPengawas(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff025464),
          title: const Text(
            "Daftar Transaksi",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Link',
              ),
              Tab(
                text: 'Request',
              ),
              Tab(
                text: 'Berjalan',
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
            //Link
            PermintaanLink(),

            //Tagihan
            TransaksiPermintaan(),

<<<<<<< HEAD
            //Berlangsung
            TransaksiBerlangsung(),

            //Selesai
=======
            //riwayat tagihan
            TransaksiBerlangsung(),

>>>>>>> 980740962cd6867870733bad7be4f8006ff48921
            TransaksiSelesai(),
          ],
        ),
      ),
    );
  }
}
