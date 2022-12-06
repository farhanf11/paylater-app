import 'package:flutter/material.dart';
import 'package:paylater/history_page/history_order.dart';
import 'package:paylater/history_page/history_transaksi.dart';

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
            backgroundColor: Colors.teal[800],
            title: Text("History"),
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