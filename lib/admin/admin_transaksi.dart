import 'dart:math';
import 'dart:ui';
import 'package:paylater/admin/models/modelTransaksi.dart';
import 'package:paylater/admin/component/cardtransaksi.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';

class AdminTransaksi extends StatefulWidget {
  const AdminTransaksi({super.key});

  @override
  _AdminTransaksiState createState() => _AdminTransaksiState();
}

List<String> titles = <String>[
  'Permintaan',
  'Berlangsung',
  'Selesai',
];

class _AdminTransaksiState extends State<AdminTransaksi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBarNav(),
    );
  }
}

class AppBarNav extends StatelessWidget {
  const AppBarNav({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transaksi',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          automaticallyImplyLeading: false,
          foregroundColor: PaylaterTheme.darkerText,
          backgroundColor: PaylaterTheme.white,
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            labelColor: PaylaterTheme.white,
            unselectedLabelColor: PaylaterTheme.deactivatedText,
            overlayColor: MaterialStateProperty.all(PaylaterTheme.background),
            indicatorWeight: 5,
            indicatorPadding: const EdgeInsets.all(10),
            indicator: const BoxDecoration(
              color: PaylaterTheme.background,
              shape: BoxShape.rectangle,
            ),
            tabs: <Widget>[
              Tab(
                text: titles[0],
              ),
              Tab(
                text: titles[1],
              ),
              Tab(
                text: titles[2],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child:
                  ListView(physics: const ClampingScrollPhysics(), children: [
                CardPermintaan(
                  Transaksi(
                    userId: 1,
                    name: "jhon",
                    profileimg: "assets/icon/avatardefault.png",
                    id: 1,
                    imageUrl:
                        "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                    productName: 'Laptop Azuz With Camera Action',
                    tenorCicilan: 12,
                    statusTransaksi: 'Lunas',
                    hargaCicilan: 4125899,
                    hargaBarang: 15499899,
                    tanggalPembayaran: 'Tanggal permintaan : 12-01-2023',
                    catatan: "pilihan warnanya yang hitam ya",
                  ),
                ),
                CardPermintaan(
                  Transaksi(
                    userId: 2,
                    name: "jhonny",
                    profileimg: "assets/icon/avatardefault.png",
                    id: 2,
                    imageUrl:
                        "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                    productName: 'Iphone 13 Black Series New ibox, 128gb',
                    tenorCicilan: 12,
                    statusTransaksi: 'Lunas',
                    hargaCicilan: 4125899,
                    hargaBarang: 15499899,
                    tanggalPembayaran: 'Tanggal permintaan : 12-01-2023',
                    catatan: "pilihan warnanya yang hitam ya",
                  ),
                ),
                CardPermintaan(Transaksi(
                  userId: 2,
                  name: "jhonny",
                  profileimg: "assets/icon/avatardefault.png",
                  id: 2,
                  imageUrl:
                      "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                  productName: 'Iphone 13 Black Series New ibox, 128gb',
                  tenorCicilan: 12,
                  statusTransaksi: 'Lunas',
                  hargaCicilan: 4125899,
                  hargaBarang: 15499899,
                  tanggalPembayaran: 'Tanggal permintaan : 12-01-2023',
                  catatan: "pilihan warnanya yang hitam ya",
                ))
              ]),
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return CardBerlangsung(Transaksi(
                  userId: 1,
                  name: "john",
                  profileimg: "assets/icon/avatardefault.png",
                  id: 1,
                  imageUrl:
                      "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                  productName: 'Laptop Azuz With Camera Action',
                  tenorCicilan: 12,
                  statusTransaksi: "cicil",
                  hargaCicilan: 200,
                  hargaBarang: 15499899,
                  tanggalPembayaran: 'Tanggal permintaan : 12-01-2023',
                  catatan: "pilihan warnanya yang hitam ya",
                ));
              },
            ),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return CardSelesai(Transaksi(
                  userId: 1,
                  name: "john",
                  profileimg: "assets/icon/avatardefault.png",
                  id: 1,
                  imageUrl:
                      "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                  productName: 'Laptop Azuz With Camera Action',
                  tenorCicilan: 12,
                  statusTransaksi: "cicil",
                  hargaCicilan: 200,
                  hargaBarang: 15499899,
                  tanggalPembayaran: 'Tanggal permintaan : 12-01-2023',
                  catatan: "pilihan warnanya yang hitam ya",
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
