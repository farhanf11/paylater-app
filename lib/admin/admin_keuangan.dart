import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminKeuangan extends StatefulWidget {
  @override
  _AdminKeuanganState createState() => _AdminKeuanganState();
}

class _AdminKeuanganState extends State<AdminKeuangan> {
  String token = "";
  String dana_tersedia = '';
  String data_cicilan_aktif = '';
  String dana_belum_kembali = '';
  String total_dana_keluar = '';
  String dana_cicilan_masuk = '';
  String keuntungan = '';


  void initState() {
    getDataKeuangan();
  }


  void getDataKeuangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    try {
      Response response = await get(
        Uri.parse('https://paylater.harysusilo.my.id/api/admin/dashboard'),
        headers: {
          'Authorization': token,
        },
      );
      print(token);

      var resultData = json.decode(response.body);
      dana_tersedia = resultData['data']['dana_tersedia'].toString();
      data_cicilan_aktif = resultData['data']['data_cicilan_aktif'].toString();
      dana_belum_kembali = resultData['data']['dana_belum_kembali'].toString();
      total_dana_keluar = resultData['data']['total_dana_keluar'].toString();
      dana_cicilan_masuk = resultData['data']['dana_cicilan_masuk'].toString();
      keuntungan = resultData['data']['email_unverified'].toString();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keuangan Admin',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      backgroundColor: PaylaterTheme.spacer,
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    PaylaterTheme.maincolor,
                    Color.fromRGBO(12, 166, 195, 1),
                  ]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dana_tersedia,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: PaylaterTheme.white)),
                      const Text("Total Dana",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: PaylaterTheme.white)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 20,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: PaylaterTheme.maincolor),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.point_of_sale,
                        size: 14,
                        color: Color.fromARGB(255, 215, 194, 0),
                      ),
                      label: const Text("Tambah Dana",
                          style: TextStyle(
                              color: PaylaterTheme.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w600))),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: PaylaterTheme.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                boxShadow: [
                  BoxShadow(
                    color: PaylaterTheme.grey,
                    blurRadius: 3,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rincian Dana",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Total Dana Keluar',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20, 0, 20, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Rp",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.darkText)),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(total_dana_keluar,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.decline)),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.data_exploration,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Total Dana Saat Ini',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Rp",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.darkText)),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(dana_cicilan_masuk,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.monetization_on,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
