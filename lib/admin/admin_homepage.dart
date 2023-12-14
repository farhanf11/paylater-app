import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/PostPengajuanProduk.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  String token = "";
  List datas = [];
  var permintaan = ''.obs;
  var berlangsung = ''.obs;
  var selesai = ''.obs;
  var jatuh_tempo = 0.obs;
  var total_user = 0.obs;
  var email_unverified = ''.obs;
  var url = "".obs;
  bool isLoading = false;
  var status = "status".obs;
  var total = 0.obs;


  void initState() {
    super.initState();
    getDashboardData();
    LinkbyId();
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

  void LinkbyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    setState(() {
      isLoading = true;
    });
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-link?user_id=&status=request'),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas =  responseData['data']['data'];
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          setState(() {
            total.value = responseData['data']['total'];
            url.value = responseData['data']['data']['url'];
            status.value = responseData['data']['data']['status'];
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
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
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
            ///style
            color: Colors.grey,
          ):ListView(
            physics: const ClampingScrollPhysics(),
            children: [
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
                              margin: const EdgeInsets.all(10),
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
                                    padding: const EdgeInsets.all(8.0),
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

              ///Data Akun Customer
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Card(
                  elevation: 5,
                  child: ///pengajuan link
                  Container(
                    height: 372,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Obx(() => Text(
                          'Daftar Pengajuan Link (${total.value})',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: PaylaterTheme.maincolor,
                            fontFamily: PaylaterTheme.fontName,
                          ),
                        ),),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 320,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () { Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => PostPengajuanProduk(
                                            link_id: datas[index]['id'],
                                            user_id: datas[index]['user_id'],
                                          ),
                                        ),
                                      );},
                                      child: Container(
                                            constraints: const BoxConstraints(maxWidth: double.infinity),
                                            height: 52,
                                            width: 360,
                                            padding: const EdgeInsets.symmetric(horizontal: 30),
                                            decoration: BoxDecoration(
                                                color: PaylaterTheme.white,
                                                border: Border.all(color: const Color(0x4093B0AF), width: 2),
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(child: Text(
                                                  datas[index]['url'],
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: PaylaterTheme.darkerText,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ),),
                                                PopupMenuButton(
                                                    child: const Align(
                                                      alignment: Alignment.centerRight,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(16.0),
                                                        child: Icon(
                                                          CupertinoIcons.ellipsis_vertical,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                        value: 1,
                                                        child: TextButton(
                                                            onPressed: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text:
                                                                      datas[index]['url']));
                                                              AlertDialog alert = AlertDialog(
                                                                title: const Text('Berhasil Menyalin Link : '),
                                                                content: Text(
                                                                    datas[index]['url']),
                                                                backgroundColor: Colors.white,
                                                                icon: const Icon(
                                                                    CupertinoIcons
                                                                        .checkmark_seal_fill,
                                                                    size: 20),
                                                                iconColor: PaylaterTheme.maincolor,
                                                                actions: [
                                                                  TextButton(
                                                                    child: const Text('Ok'),
                                                                    onPressed: () =>
                                                                        Navigator.of(context).pop(),
                                                                  ),
                                                                ],
                                                              );
                                                              showDialog(
                                                                  context: context,
                                                                  builder: (context) => alert);
                                                            },
                                                            child: const Text(
                                                              'salin',
                                                              style: TextStyle(color: Colors.black),
                                                            )),
                                                      ),
                                                      PopupMenuItem(
                                                        value: 2,
                                                        child: TextButton(
                                                            onPressed: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      PostPengajuanProduk(
                                                                        link_id: datas[index]['id'],
                                                                        user_id: datas[index]['user_id'],
                                                                      )),
                                                            ),
                                                            child: const Text(
                                                              'Akad',
                                                              style: TextStyle(color: Colors.black),
                                                            )),
                                                      ),
                                                    ])
                                              ],
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
