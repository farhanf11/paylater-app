import 'package:flutter/material.dart';
import 'package:paylater/components/detailTagihan/detailCicilan.dart';
import 'package:paylater/components/detailTagihan/detailPesanan.dart';
import 'package:paylater/history_page/tagihanPage.dart';
import 'package:paylater/history_page/RiwayatTagihan.dart';

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
                  SizedBox(height: 30,),
                  DetailPesanan(),

                  //Rincian Cicilan
                  SizedBox(height: 30,),
                  DetailCicilan(),
                  SizedBox(height: 40,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 65),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Color(0xff025464),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10,),
                        Text('Bayar Cicilan',
                          style: TextStyle(
                              color: Color(0xff025464),
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  //button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 65),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Color(0xff025464),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10,),
                        Text('Bayar Seluruh Tagihan',
                          style: TextStyle(
                              color: Color(0xff025464),
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}