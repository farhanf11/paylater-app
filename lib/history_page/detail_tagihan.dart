import 'package:flutter/material.dart';
import 'package:paylater/components/detailTagihan/detailCicilan.dart';
import 'package:paylater/components/detailTagihan/detailPesanan.dart';
import 'package:paylater/history_page/tagihanPage.dart';
import 'package:paylater/history_page/RiwayatTagihan.dart';
import 'package:paylater/user/DetailPembayaran.dart';
import 'package:paylater/user/TransferBank.dart';

import '../admin/component/popup.dart';
import '../theme.dart';

class DetailTagihan extends StatefulWidget {
  const DetailTagihan({Key? key}) : super(key: key);

  @override
  _DetailTagihanState createState() => _DetailTagihanState();
}

class _DetailTagihanState extends State<DetailTagihan> {
  int pageIndex = 0;

  final pages = [
    TagihanPage(),
    RiwayatTagihan(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(seconds: 2),
      length: 4 ,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff025464),
          leading: BackButton(color: Colors.white,),
          title: Text("Detail tagihan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          centerTitle: true,
        ),
        body:Container(
          width: double.maxFinite,
          color: Color(0xffE3E9EB),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                    child: Text('Cicilan Berlangsung', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 2))
                              ],
                              shape: BoxShape.rectangle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://img.freepik.com/free-photo/elegant-smartphone-composition_23-2149437084.jpg?size=626&ext=jpg&ga=GA1.2.208731134.1681022893&semt=ais",
                                  ))),
                        ),
                        SizedBox(height: 16,),
                        Text('Nama Produk', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                        Text('12 - 12 - 2022', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
                      ],
                    ),
                  ),

                  //Rincian pesanan
                  SizedBox(height: 24,),
                  DetailPesanan(),

                  //Rincian Cicilan
                  SizedBox(height: 24,),
                  DetailCicilan(),

                  //alamat
                  SizedBox(height: 24,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Head
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffE3E9EB))),
                          ),
                          child: Text('Alamat Pengiriman',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),

                        //Tenor
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Text('UNJ Kampus A lt.5, koperasi rumpun matematika',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24,),
                  //resi
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Head
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffE3E9EB))),
                          ),
                          child: Text('Resi Pengiriman',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),

                        //Tenor
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Text('ABCD231313',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PaylaterTheme.maincolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            Popup.confirmDialog(context,
                                message: "Bayar Semua Cicilan?",
                                dialogCallback: (value) async {
                                  if (value == 'Ya') {
                                    Navigator.of(context).pop();
                                  }
                                  if (value == 'Batal') {}
                                });
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Bayar Seluruh Tagihan")),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PaylaterTheme.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => TransferBank()));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Bayar Cicilan")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}