import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminDetailTagihan.dart';
import 'package:paylater/admin/component/RincianCicilanAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';
import 'package:number_paginator/number_paginator.dart';

import 'AdminNavbarBot.dart';

class TransaksiPermintaan extends StatefulWidget {
  const TransaksiPermintaan({Key? key}) : super(key: key);

  @override
  State<TransaksiPermintaan> createState() => _TransaksiPermintaanState();
}

class _TransaksiPermintaanState extends State<TransaksiPermintaan> {
  _TransaksiPermintaanState();
  String token = "";
  List datas = [];
  bool isLoading = false;
  bool success = false;
  var user_name = "".obs;
  var email_address = "".obs;
  var phone_number = "".obs;
  var image_face = "".obs;
  var _currentPage = 0.obs;
  var last_page = 1.obs;
  List links = [];
  var tenor = "".obs;
  var role = "".obs;

  @override
  void initState() {
    super.initState();
    getOrder();
    ProfilebyId();
  }

  ///get list order request
  Future<void> getOrder({url = ''}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      isLoading = true;
    });

    try {
      var response;
      if(url == ''){
        response = await get(
            Uri.parse('https://paylater.harysusilo.my.id/api/admin/get-order?status=request&page=1'),
            headers: {
              'Authorization': token,
            }
        );
      } else {
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
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          user_name.value = responseData['data']['data']['user']['user_name'];
          email_address.value = responseData['data']['email_address'];
          phone_number.value = responseData['data']['phone_number'];
          image_face.value = responseData['data']['image_face'];
        }
      }else{
        print('gagal');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  ///acc transaksi
  void VerifyOrder(var order_id, String is_approve) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/approval-order'),
          headers: {
            'Authorization': token,
          },
          body: {
            'order_id': order_id,
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
            email_address.value = responseData['data']['email_address'];
            phone_number.value = responseData['data']['phone_number'];
            image_face.value = responseData['data']['image_face'];
            role.value = responseData['data']['role'];
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
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
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              ):ListView.builder(
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: role.value == 'pengawas'?null:() { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => AdminDetailTagihan(
                                order_id: datas[index]['id'],
                                user_id: datas[index]['user_id'],
                              ),
                            ),
                          );},
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: double.infinity),
                            height: 140,
                            width: 360,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: PaylaterTheme.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(
                                      image: NetworkImage(datas[index]['image']),
                                      width: 66,
                                      height: 80,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(width: 20,),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ///Nama
                                          Text(
                                            datas[index]['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: PaylaterTheme.darkerText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),

                                          /// No order
                                          Text(
                                            '${datas[index]['no_order']}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: PaylaterTheme.darkerText,
                                            ),
                                          ),

                                          ///price
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Harga : Rp ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: PaylaterTheme.darkerText,
                                                ),
                                              ),
                                              Text(
                                                datas[index]['price'].toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: PaylaterTheme.orange,
                                                ),
                                              ),
                                            ],
                                          ),

                                          /// Tenor cicilan
                                          if (tenor.value == "3" && tenor.value == "6" && tenor.value == "12")
                                          Text(
                                            '${datas[index]['tenor']} Bulan',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: PaylaterTheme.darkerText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: role.value == 'pengawas'?null:() {
                                VerifyOrder(
                                    datas[index]['id'].toString(),
                                    "approve"
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: PaylaterTheme.maincolor,
                                  borderRadius: BorderRadius.all(Radius.circular(6))
                                ),

                                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                                child: const Text('Setujui', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),),
                              ),
                            ),

                            MaterialButton(
                              onPressed: role.value == 'pengawas'?null:() {
                                VerifyOrder(
                                    datas[index]['id'].toString(),
                                    "reject"
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(6))
                                ),

                                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                                child: const Text('Tolak', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),),
                              ),
                            ),
                          ],
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
              getOrder(url: links[index+1]['url']);
            },
          ),),
        ],
      ),
    );
  }
}
