import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/admin_keuangan.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  String token = "";
  var permintaan = ''.obs;
  var berlangsung = ''.obs;
  var selesai = ''.obs;
  var jatuh_tempo = 0.obs;
  var total_user = 0.obs;
  var email_unverified = ''.obs;


  void initState() {
    super.initState();
    getDashboardData();
  }


  void getDashboardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/dashboard'),
          headers: {
            'Authorization': token,
          },
      );
      print(token);

      var resultData = json.decode(response.body);
      permintaan.value = resultData['data']['permintaan'];
      berlangsung.value = resultData['data']['berlangsung'];
      selesai.value = resultData['data']['selesai'];
      jatuh_tempo.value = resultData['data']['jatuh_tempo'];
      total_user.value = resultData['data']['total_user'];
      email_unverified.value = resultData['data']['email_unverified'];
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
      body: Container(
        padding: const EdgeInsets.all(6),
        color: Colors.white,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ), backgroundColor: const Color.fromRGBO(2, 84, 100, 1)),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdminKeuangan()));},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dana Tersedia",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("Lihat dana yang tersedia",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_circle_right,
                            size: 35,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Permintaan',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Obx(() => Text(
                                    permintaan.value,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),)
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Berlangsung",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Obx(() => Text(
                                    berlangsung.value,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Selesai',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Obx(() => Text(
                                    selesai.value,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),)
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Jatuh Tempo',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(() => Text(
                                    jatuh_tempo.value.toString(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //Data Akun Customer
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text(
                            'Data Akun Customer',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(2, 84, 100, 1),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: const Center(
                              child: Text(
                                "Total User",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(2, 84, 100, 1),
                            ),
                            child: Obx(() => Center(
                              child: Text(
                                total_user.value.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(195, 163, 84, 1),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: const Center(
                              child: Text(
                                'Email Unverify',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(195, 163, 84, 1),
                            ),
                            child: Center(
                              child: Obx(() => Text(
                                email_unverified.value.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),)
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              maxRadius: 3,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              maxRadius: 3,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              maxRadius: 3,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //trending product
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text(
                            'Daftar Permintaan Cicilan',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/icon/avatardefault.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Jhon son",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              Text(
                                'Tanggal Permintaan : 28-01-2023',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/barangdefault.png"),
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Iphone 13 Black Series New ibox, 128gb",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  Row(
                                    children: [
                                      Text("Cicilan : " + "3" + " " + "Bulan",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("Harga: ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          )
                                      ),
                                      Text("3.155.000",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  237, 131, 33, 1),
                                              fontWeight: FontWeight.bold)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/icon/avatardefault.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Jhon son",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              Text(
                                'tanggal pembayaran : 28-01-2023',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/barangdefault.png"),
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Iphone 13 Black Series New ibox, 128gb",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  Text("Pembayaran 1/6",
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Cicilan:",
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.black,
                                      )),
                                  Text("3.155.000",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(
                                              237, 131, 33, 1),
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              maxRadius: 3,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              maxRadius: 3,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              maxRadius: 3,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
