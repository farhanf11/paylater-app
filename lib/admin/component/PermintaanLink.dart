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
  var user_name = "username".obs;
  var image_face = "image".obs;
  var _currentPage = 0.obs;
  var last_page = 1.obs;
  List links = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    LinkbyId();
  }

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
        datas =  responseData['data']['data'];
        _currentPage.value = responseData['data']['current_page'];
        last_page.value = responseData['data']['last_page'];
        links = responseData['data']['links'];
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

  void RejectLink(var link_id, String is_approve) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/reject-link/{link_id}'),
          headers: {
            'Authorization': token,
          },
          body: {
            'order_id': link_id,
            'is_approve': is_approve,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => AdminNavbarBot()));
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
          content: const Text('Tidak sesuai'),
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
    return Container(
      color: PaylaterTheme.spacer,
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: ListView.builder(
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
                              builder: (BuildContext context) => PostPengajuanProduk(
                                link_id: datas[index]['id'],
                                user_id: datas[index]['user_id'],
                              ),
                            ),
                          );},
                          child: Expanded(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: double.infinity),
                              height: 72,
                              width: 320,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: PaylaterTheme.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
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
              LinkbyId(url: links[index+1]['url']);
            },
          ),),
        ],
      ),
    );
  }
}
