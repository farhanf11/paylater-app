import 'package:flutter/material.dart';
import 'package:paylater/components/card_tagihan.dart';
import 'package:paylater/history_page/history_order.dart';
import 'package:paylater/history_page/history_transaksi.dart';
import 'package:paylater/models/tagihan.dart';

import '../components/card_riwayat_tagihan.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int pageIndex = 0;

  final pages = [
    HistoryOrder(),
    HistoryTransaksi(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4 ,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1288B5),
            title: Text("History"),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tagihan',),
                Tab(text: 'Riwayat Tagihan',),
              ],
            ),
          ),
          body:Container(
            color: Color(0xffE3E9EB),
            child: TabBarView(
              children: [
                //Tagihan
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      CardTagihan(Tagihan(
                          id: 1,
                          imageUrl: "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                          productName: 'Laptop Azuz With Camera Action',
                          tenorCicilan: 12,
                          statusTagihan: 'Lunas',
                          hargaCicilan: 4125899,
                          hargaBarang: 14799000,
                          tanggalJatuhTempo: '12/April/2023'
                      ),
                      ),
                      SizedBox(height: 10,),
                      CardTagihan(
                        Tagihan(
                          id: 2,
                          imageUrl: "https://media.istockphoto.com/id/1286249900/id/foto/merek-baru-iphone-12-pro-max-di-pacific-blue-di-pengaturan-studio.jpg?s=612x612&w=0&k=20&c=ejvqcTDMppI8slqjyRCP66UVJqHkfoAQHpinrini-gY=",
                          productName: 'iPhone 13 Black, 128 gb',
                          tenorCicilan: 12,
                          statusTagihan: 'Berlansung',
                          hargaCicilan: 4125899,
                          hargaBarang: 14799000,
                          tanggalJatuhTempo: '12/April/2023'
                        ),
                      )
                    ],
                  ),
                ),

                //riwayat tagihan
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text('Feb 2023',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, ),),
                      ),
                      CardRiwayatTagihan(Tagihan(
                          id: 1,
                          imageUrl: "https://media.istockphoto.com/id/1286249900/id/foto/merek-baru-iphone-12-pro-max-di-pacific-blue-di-pengaturan-studio.jpg?s=612x612&w=0&k=20&c=ejvqcTDMppI8slqjyRCP66UVJqHkfoAQHpinrini-gY=",
                          productName: 'iPhone 13 Black, 128 gb',
                          tenorCicilan: 12,
                          statusTagihan: 'Lunas',
                          hargaCicilan: 1399899,
                          hargaBarang: 14799000,
                          tanggalJatuhTempo: '12/April/2023'
                      ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text('jan 2023',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, ),),
                      ),
                      CardRiwayatTagihan(Tagihan(
                          id: 2,
                          imageUrl: "https://media.istockphoto.com/id/1286249900/id/foto/merek-baru-iphone-12-pro-max-di-pacific-blue-di-pengaturan-studio.jpg?s=612x612&w=0&k=20&c=ejvqcTDMppI8slqjyRCP66UVJqHkfoAQHpinrini-gY=",
                          productName: 'iPhone 13 Black, 128 gb',
                          tenorCicilan: 12,
                          statusTagihan: 'Lunas',
                          hargaCicilan: 1399899,
                          hargaBarang: 14799000,
                          tanggalJatuhTempo: '12/April/2023'
                      ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text('Des 2022',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, ),),
                      ),
                      CardRiwayatTagihan(Tagihan(
                          id: 3,
                          imageUrl: "https://media.istockphoto.com/id/1286249900/id/foto/merek-baru-iphone-12-pro-max-di-pacific-blue-di-pengaturan-studio.jpg?s=612x612&w=0&k=20&c=ejvqcTDMppI8slqjyRCP66UVJqHkfoAQHpinrini-gY=",
                          productName: 'iPhone 13 Black, 128 gb',
                          tenorCicilan: 12,
                          statusTagihan: 'Lunas',
                          hargaCicilan: 1399899,
                          hargaBarang: 14799000,
                          tanggalJatuhTempo: '12/April/2023'
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}