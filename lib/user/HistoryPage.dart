import 'package:flutter/material.dart';
import 'package:paylater/components/card_tagihan.dart';
import 'package:paylater/history_page/tagihanPage.dart';
import 'package:paylater/history_page/RiwayatTagihan.dart';
import 'package:paylater/models/tagihan.dart';
import 'package:paylater/user/ProfilePage.dart';

import '../components/card_riwayat_tagihan.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int pageIndex = 0;

  final pages = [
    TagihanPage(),
    RiwayatTagihan(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4 ,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff025464),
            title: Text("History", style: TextStyle(fontSize: 16),),
            leading: GestureDetector(
              child: Icon( Icons.arrow_back, color: Colors.white,),
              onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfilePage())),
            ) ,
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
                TagihanPage(),

                //riwayat tagihan
                RiwayatTagihan(),
              ],
            ),
          ),
      ),
    );
  }
}