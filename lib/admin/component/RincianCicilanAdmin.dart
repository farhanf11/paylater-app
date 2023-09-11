import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/popup.dart';
import 'package:paylater/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../navbar/NavbarBot.dart';
import '../../user/TransferBank.dart';
import 'DetailPembayaranCicilan.dart';

class RincianCicilanAdmin extends StatefulWidget {
  const RincianCicilanAdmin({Key? key}) : super(key: key);

  @override
  State<RincianCicilanAdmin> createState() => _RincianCicilanAdminState();
}

class _RincianCicilanAdminState extends State<RincianCicilanAdmin> {
  _RincianCicilanAdminState();
  String token = "";
  var order_id = 3;

  void initState() {
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  final TextEditingController resiController = TextEditingController();
  final TextEditingController arrivalController = TextEditingController();

  void InputResi(String airwall_bill) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/airwaybill-store'),
          headers: {
            'Authorization': token,
          },
          body: {
            'airwall_bill': airwall_bill,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => NavbarBot()));
          AlertDialog alert = AlertDialog(
            title: Text("Berhasil"),
            content: Container(
              child: Text(responseData['message']),
            ),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }
      }
      else {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void InoutArrivalDate(String airwall_bill) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/airwaybill-store'),
          headers: {
            'Authorization': token,
          },
          body: {
            'airwall_bill': airwall_bill,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => NavbarBot()));
          AlertDialog alert = AlertDialog(
            title: Text("Berhasil"),
            content: Container(
              child: Text(responseData['message']),
            ),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }
      }
      else {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
            "Rincian Tagihan User",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          color: const Color(0xffE3E9EB),
          child: ListView(physics: ClampingScrollPhysics(), children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                  child: const Text(
                    'Rincian Pembayaran',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
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
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Nama Produk',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
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
                      //ID Pesanan
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

                      //Tenor
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

                      //Total Tagihan
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
                              'Total Tagihan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '1.500.000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      //Tagihan Tersisa
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tagihan Tersisa',
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

                ///Rincian Cicilan
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xffE3E9EB))),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rincian Cicilan Pembayaran',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Cicilan 1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              '500.000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPembayaranCicilan()),
                                    ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: PaylaterTheme.maincolor),
                                  child: const Text(
                                    'lihat',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Cicilan 2',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '500.000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPembayaranCicilan()),
                                    ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: PaylaterTheme.maincolor),
                                  child: const Text(
                                    'lihat',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Cicilan 3',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '500.000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPembayaranCicilan()),
                                    ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: PaylaterTheme.maincolor),
                                  child: const Text(
                                    'lihat',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///alamat
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
                          'Alamat Pengiriman',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      //Tenor
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Text(
                          'UNJ Kampus A lt.5, koperasi rumpun matematika',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                ///resi
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xffE3E9EB))),
                        ),
                        child: const Text(
                          'Resi Pengiriman',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      //Tenor
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            TextFormField(
                              controller: resiController,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    PaylaterTheme.maincolor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    )),
                              ),
                              child: Text('Submit'),
                              onPressed: () =>
                              {InputResi(resiController.text.toString())},
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                ///arrival
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
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xffE3E9EB))),
                        ),
                        child: const Text(
                          'Tanggal Barang Sampai',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      ///button
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              TextFormField(
                                controller: arrivalController,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      PaylaterTheme.maincolor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14.0),
                                      )),
                                ),
                                child: Text('Submit'),
                                onPressed: () =>
                                {InputResi(resiController.text.toString())},
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),

                //button
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
                        onPressed: () {
                          Popup.confirmDialog(context,
                              message: "Yakin tagihan ini sudah lunas?",
                              dialogCallback: (value) async {
                            if (value == 'Ya') {
                              Navigator.of(context).pop();
                            }
                            if (value == 'Batal') {}
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Tagihan Lunas")),
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
                            child: Text("Jatuh Tempo")),
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
