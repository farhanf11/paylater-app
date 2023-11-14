import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminKeuangan extends StatefulWidget {
  @override
  _AdminKeuanganState createState() => _AdminKeuanganState();
}

class _AdminKeuanganState extends State<AdminKeuangan> {
  String token = "";
  var dana_tersedia = 0.obs;
  var data_cicilan_aktif = 0.obs;
  var dana_belum_kembali = 0.obs;
  var total_dana_keluar = 0.obs;
  var dana_cicilan_masuk = 0.obs;
  var keuntungan = 0.obs;


  void initState() {
    getDataKeuangan();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  void getDataKeuangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    try {
      var response = await get(
        Uri.parse('https://paylater.harysusilo.my.id/api/admin/detail-keuangan'),
        headers: {
          'Authorization': token,
        },
      );
      print(token);

      var resultData = json.decode(response.body);
      print(resultData['data']);
      dana_tersedia.value = resultData['data']['dana_tersedia'];
      data_cicilan_aktif.value = resultData['data']['data_cicilan_aktif'];
      dana_belum_kembali.value = resultData['data']['dana_belum_kembali'];
      total_dana_keluar.value = resultData['data']['total_dana_keluar'];
      dana_cicilan_masuk.value = resultData['data']['dana_cicilan_masuk'];
      keuntungan.value = resultData['data']['email_unverified'];
    } catch (e) {
      print(e);
    }
  }

  final TextEditingController inputDana = TextEditingController();
  void AddDana(String amount) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/cash-store'),
          headers: {
            'Authorization': token,
          },
          body: {
            'amount': amount,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.of(context).pop();
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
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
              child: const Text('Ok'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keuangan Admin',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: BackButton(),
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
                      Obx(() => Text(dana_tersedia.value.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: PaylaterTheme.white
                        ),
                      ),),
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
                          backgroundColor: PaylaterTheme.maincolor),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: const Text('Input Jumlah Dana'),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 8,),
                                          TextField(
                                            controller: inputDana,
                                            decoration: const InputDecoration(
                                              labelText: 'Rp',
                                              icon: Icon(Icons.monetization_on_outlined, color: Colors.yellow,),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                        MaterialStatePropertyAll(Color(0xff025464))),
                                    onPressed: () => {AddDana(
                                      inputDana.text.toString(),
                                    )},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 60),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text('Selanjutnya'),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.point_of_sale,
                        size: 14,
                        color: Color.fromARGB(255, 215, 194, 0),
                      ),
                      label: const Text("Tambah Dana",
                          style: TextStyle(
                              color: PaylaterTheme.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w600)
                      ),
                  ),
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
                                    Obx(() => Text(total_dana_keluar.value.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.decline)),),
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
                                    Obx(() => Text(dana_cicilan_masuk.value.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
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
