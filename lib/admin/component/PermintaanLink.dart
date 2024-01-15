import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:paylater/admin/component/PostPengajuanProduk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';
import 'AdminNavbarBot.dart';

class PermintaanLink extends StatefulWidget {
  const PermintaanLink({Key? key}) : super(key: key);

  @override
  State<PermintaanLink> createState() => _PermintaanLinkState();
}

class _PermintaanLinkState extends State<PermintaanLink> {
  String token = "";
  List datas = [];
  var url = "".obs;
  var link_id = 0.obs;
  var _currentPage = 0.obs;
  var last_page = 1.obs;
  var role = "".obs;
  List links = [];
  bool isLoading = false;
  bool success = false;

  @override
  void initState() {
    super.initState();
    LinkbyId();
    getToken();
    ProfilebyId();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  ///get role
  void ProfilebyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    setState(() {
      isLoading = true;
    });
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-user-profile/$id'),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          setState(() {
            role.value = responseData['data']['role'];
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
  // role.value == 'pengawas'?null:

  Future<void> LinkbyId({url = ''}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    setState(() {
      isLoading = true;
    });
    try {
      var response;
      if(url == ''){
        response = await get(
            Uri.parse('https://paylater.harysusilo.my.id/api/get-link?user_id=&status=request'),
            headers: {
              'Authorization': token,
            });
      }else{
        response = await get(
            Uri.parse(url),
            headers: {
              'Authorization': token,
            }
        );
      }

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        success = responseData['success'];
        datas =  responseData['data']['data'];
        _currentPage.value = responseData['data']['current_page'];
        last_page.value = responseData['data']['last_page'];
        links = responseData['data']['links'];
        link_id.value = responseData['data']['data']['link_id'];
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          setState(() {
            url.value = responseData['data']['data']['url'];
          });
        }
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return success == false?
    Center(
      child: isLoading
          ? const CircularProgressIndicator(
        ///style
        color: Colors.grey,
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/dataNotFound.jpg',
            height: 300,
          ),
          const SizedBox(height: 5,),
          const Text('Transaksi Tidak Ditemukan',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    ):Container(
      color: PaylaterTheme.spacer,
      padding: const EdgeInsets.symmetric(vertical: 14.0),
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
                          onPressed: role.value == 'pengawas'?null:() { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => PostPengajuanProduk(
                                link_id: datas[index]['id'],
                                user_id: datas[index]['user_id'],
                                url: datas[index]['url'],
                                address: datas[index]['address'],
                                note: datas[index]['note'],
                              ),
                            ),
                          );},
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: double.infinity),
                            height: 72,
                            width: 320,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                            decoration: BoxDecoration(
                                color: PaylaterTheme.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '(${datas[index]['id']}) ',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: PaylaterTheme.orange,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                Flexible(
                                    child: Text(
                                      datas[index]['url'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: PaylaterTheme.darkerText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                ),
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
          ),
          Obx(() => NumberPaginator(

            numberPages: last_page.value,
            onPageChange: (index) {
              LinkbyId(url: links[index+1]['url']);
            },
          ),),
        ],
      ),
    );
  }
}
