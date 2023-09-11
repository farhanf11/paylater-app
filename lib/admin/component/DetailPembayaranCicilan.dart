import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paylater/admin/component/popup.dart';

import '../../theme.dart';
import '../../user/TransferBank.dart';

class DetailPembayaranCicilan extends StatefulWidget {
  const DetailPembayaranCicilan({Key? key}) : super(key: key);

  @override
  State<DetailPembayaranCicilan> createState() => _DetailPembayaranCicilanState();
}

class _DetailPembayaranCicilanState extends State<DetailPembayaranCicilan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(seconds: 2),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff025464),
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            "Detail Pembayaran",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          color: Color(0xffE3E9EB),
          child: ListView(physics: ClampingScrollPhysics(), children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: PaylaterTheme.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                  child: const Text(
                    'Rincian',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: PaylaterTheme.maincolor),
                  ),
                ),

                ///Rincian pesanan
                const SizedBox(
                  height: 24,
                ),
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
                      ///ID Pesanan
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xffEBEBEB))),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID Pesanan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '12345678',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      ///Tenor
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xffEBEBEB))),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tenor Cicilan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '3 Bulan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      ///Tagihan Tersisa
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tagihan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '500.000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///bukti bayar
                const SizedBox(
                  height: 24,
                ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xffE3E9EB))),
                        ),
                        child: const Text(
                          'Bukti Pembayaran',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      ///bukti
                      Container(
                        height: 300,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://th.bing.com/th?id=OIP.jzQ_d0P6x-t0ueozQTTOiwHaMS&w=194&h=321&c=8&rs=1&qlt=90&o=6&dpr=2.2&pid=3.1&rm=2',
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 14,),

                ///button
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24),
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
                        onPressed: () {},
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Konfirmasi")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: PaylaterTheme.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TransferBank()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Kembali")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
