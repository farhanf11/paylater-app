import 'package:flutter/material.dart';
import 'history_page/RiwayatTagihan.dart';
import 'history_page/tagihanBerlangsung.dart';
import 'history_page/tagihanPage.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int pageIndex = 0;

  final pages = [
    TagihanPage(),
    TagihanBerlangsung(),
    RiwayatTagihan(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4 ,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff025464),
            title: const Text("History", style: TextStyle(fontSize: 16),),
            leading: const BackButton(),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Pending',),
                Tab(text: 'Berlangsung',),
                Tab(text: 'Riwayat Tagihan',),
              ],
            ),
          ),
          body:Container(
            color: Color(0xffE3E9EB),
            child: TabBarView(
              children: [
                //Tagihan
                TagihanPage(),

                TagihanBerlangsung(),

                //riwayat tagihan
                RiwayatTagihan(),
              ],
            ),
          ),
      ),
    );
  }
}