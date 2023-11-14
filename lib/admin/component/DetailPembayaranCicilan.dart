import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';

import '../../theme.dart';
import '../../user/TransferBank.dart';

class DetailPembayaranCicilan extends StatefulWidget {
  DetailPembayaranCicilan({Key? key,
    required this.order_id,
    required this.instalment_id}) : super(key: key);

  final int order_id;
  final int instalment_id;

  @override
  State<DetailPembayaranCicilan> createState() => _DetailPembayaranCicilanState();
}

class _DetailPembayaranCicilanState extends State<DetailPembayaranCicilan> {
  var tenor = 0.obs;
  var user_id = 0.obs;
  var order_id = 0.obs;
  var instalment_unique_id = "".obs;
  var instalment_number = "3".obs;
  var instalment_price = 0.obs;
  var status = "".obs;
  var due_date = "".obs;
  String token = "";

  void VerifyInstalment(var id, var order_id, String is_approve) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/approval-instalment'),
          headers: {
            'Authorization': token,
          },
          body: {
            'order_id': order_id,
            'instalment_id': id,
            'is_approve': is_approve,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.push(
              context as BuildContext,
              new MaterialPageRoute(
                  builder: (BuildContext context) => AdminNavbarBot()));
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context as BuildContext).pop(),
              ),
            ],
          );

          showDialog(context: context as BuildContext, builder: (context) => alert);
        }

      }
      else {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          content: const Text('Tidak sesuai'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context as BuildContext).pop(),
            ),
          ],
        );
        showDialog(context: context as BuildContext, builder: (context) => alert);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(seconds: 2),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff025464),
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            "Detail Pembayaran",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          color: const Color(0xffE3E9EB),
          child: ListView(physics: const ClampingScrollPhysics(), children: [
            Column(
              children: [
                const SizedBox(
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
                  margin: const EdgeInsets.symmetric(horizontal: 16),
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
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                  margin: const EdgeInsets.symmetric(horizontal: 16),
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

                const SizedBox(height: 14,),

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
                          backgroundColor: PaylaterTheme.maincolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text("Konfirmasi")),
                      ),
                      const SizedBox(
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
