import 'package:flutter/material.dart';
import 'package:paylater/history_page/history_order.dart';
import 'package:paylater/history_page/history_transaksi.dart';

class DetailTagihan extends StatefulWidget {
  const DetailTagihan({Key? key}) : super(key: key);

  @override
  _DetailTagihanState createState() => _DetailTagihanState();
}

class _DetailTagihanState extends State<DetailTagihan> {
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
          title: Text("Detail tagihan"),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Order',),
              Tab(text: 'Transaksi',),
            ],
          ),
        ),
        body:TabBarView(
          children: [
            Center(child: Text('Order Page'),),
            Center(child: Text('Transaksi Page'),),
          ],
        ),
      ),
    );
  }
}