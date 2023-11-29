import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:paylater/user/AkadCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

class RiwayatPengajuanLink extends StatefulWidget {
  const RiwayatPengajuanLink({Key? key}) : super(key: key);

  @override
  State<RiwayatPengajuanLink> createState() => _RiwayatPengajuanLinkState();
}

class _RiwayatPengajuanLinkState extends State<RiwayatPengajuanLink> {

  String token = "";
  List datas = [];
  var url = "url".obs;
  var link_id = 0.obs;
  var status = "status".obs;
  var user_name = "username".obs;
  var image_face = "image".obs;
  var _currentPage = 0.obs;
  var last_page = 1.obs;
  bool isLoading = false;
  bool success = false;

  @override
  void initState() {
    super.initState();
    LinkbyId();
  }

  void LinkbyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    setState(() {
      isLoading = true;
    });
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-link?user_id=$id&status=request'),
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
            link_id.value = responseData['data']['data']['id'];
            url.value = responseData['data']['data']['url'];
            status.value = responseData['data']['data']['status'];
            success = responseData['success'];
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
    return success == true?
    Center(
      child: isLoading
          ? const CircularProgressIndicator(
        ///style
        color: Colors.grey,
      ):Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dataNotFound.jpg',
              height: 300,
            ),
            const SizedBox(height: 5,),
            const Text('Data Pengajuan Link Tidak Ditemukan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6,),
            const Text('Silahkan mengajukan Link Produk terlebih dahulu pada halaman Home',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ):Container(
      color: PaylaterTheme.spacer,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                ///style
                color: Colors.grey,
              ):ListView.builder(
                itemCount: datas.length,
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
                              builder: (BuildContext context) => RincianAkad(
                                link_id: datas[index]['id'],
                                user_id: datas[index]['user_id'],
                                status: datas[index]['status'],
                              ),
                            ),
                          );},

                          child: Expanded(
                            child:Container(
                              constraints: const BoxConstraints(maxWidth: double.infinity),
                              height: 62,
                              width: 360,
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: PaylaterTheme.white,
                                  border: Border.all(color: const Color(0x4093B0AF), width: 3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
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
                                      Flexible(child: Text(
                                        datas[index]['status'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: PaylaterTheme.orange,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                        ),
                                      )),
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
                                                            RincianAkad(
                                                              link_id: datas[index]['id'],
                                                              user_id: datas[index]['user_id'],
                                                              status: datas[index]['status'],
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(() => NumberPaginator(

            numberPages: last_page.value,
            onPageChange: (index) {
              LinkbyId();
              print(_currentPage);
            },
          ),),
        ],
      ),
    );
  }
}
