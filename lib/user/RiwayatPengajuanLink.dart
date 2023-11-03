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
  var status = "status".obs;
  var user_name = "username".obs;
  var image_face = "image".obs;
  var _currentPage = 0.obs;
  var last_page = 1.obs;

  @override
  void initState() {
    super.initState();
    LinkbyId();
    ProfilebyId();
  }

  ///get profile user
  void ProfilebyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
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
            user_name.value = responseData['data']['user_name'];
            image_face.value = responseData['data']['image_face'];
          });

        }

      }
    } catch (e) {
      print(e.toString());
    }
  }

  void LinkbyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-link?user_id=$id&status='),
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
            url.value = responseData['data']['data']['url'];
            status.value = responseData['data']['data']['status'];
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Link'),
        leading: BackButton(),
        backgroundColor: PaylaterTheme.maincolor,
      ),
      body: Container(
        color: PaylaterTheme.spacer,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
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
                              builder: (BuildContext context) => RincianAkad(
                                link_id: datas[index]['id'],
                                user_id: datas[index]['user_id'],
                              ),
                            ),
                          );},
                          child: Expanded(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: double.infinity),
                              height: 62,
                              width: 360,
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                              decoration: BoxDecoration(
                                  color: PaylaterTheme.white,
                                  border: Border.all(color: Color(0x2700B6A2), width: 3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Flexible(child: Text(
                                          datas[index]['url'],
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: PaylaterTheme.darkerText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),),
                                      ),
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
            Obx(() => NumberPaginator(

              numberPages: last_page.value,
              onPageChange: (index) {
                LinkbyId();
                print(_currentPage);
              },
            ),),
          ],
        ),
      ),
    );
  }
}