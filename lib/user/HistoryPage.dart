import 'package:flutter/material.dart';
import 'package:paylater/user/HomePage.dart';
import 'history_page/RiwayatTagihan.dart';
import 'history_page/tagihanBerlangsung.dart';
import 'history_page/PermintaanOrder.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int pageIndex = 0;

  final pages = [
    const PermintaanOrder(),
    const TagihanBerlangsung(),
    const RiwayatOrder(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4 ,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff025464),
            title: const Text("Transaksi User", style: TextStyle(fontSize: 16),),
            leading: BackButton(
              onPressed: () => HomePage(),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Pending',),
                Tab(text: 'Berlangsung',),
                Tab(text: 'Riwayat',),
              ],
            ),
          ),
          body:Container(
            color: const Color(0xffE3E9EB),
            child: const TabBarView(
              children: [
                PermintaanOrder(),

                TagihanBerlangsung(),

                RiwayatOrder(),
              ],
            ),
          ),
      ),
    );
  }
}