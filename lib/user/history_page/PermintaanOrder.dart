import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/RincianCicilanAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';
import 'package:number_paginator/number_paginator.dart';

class PermintaanOrder extends StatefulWidget {
  const PermintaanOrder({Key? key}) : super(key: key);

  @override
  State<PermintaanOrder> createState() => _PermintaanOrderState();
}

class _PermintaanOrderState extends State<PermintaanOrder> {
  _PermintaanOrderState();
  String token = "";
  List datas = [];
  bool isLoading = false;
  var user_name = "username".obs;
  var email_address = "email".obs;
  var phone_number = "phone".obs;
  var image_face = "image".obs;
  int _currentpage = 0;
  int _numPages = 10;


  void initState() {
    super.initState();
    getOrder();
    ProfilebyId();
  }

  final List<Map<String, dynamic>> pages = List.generate(
      50,
          (index) => {

          }
  );
  ///get list order request
  Future<void> getOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      token = prefs.getString('token')!;
    });
    var id = prefs.getInt('id')!;
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-order-list?user_id=$id&status=request&page=$_currentpage'),
          headers: {
            'Authorization': token,
          });
      print(_currentpage);
      inspect(response);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas =  responseData['data']['data'];
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
          });

        }

      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PaylaterTheme.spacer,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: isLoading?const Center(
        child: LinearProgressIndicator(
          ///style
        ),
      ):Column(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => RincianCicilanAdmin(
                              order_id: datas[index]['id'],
                              user_id: datas[index]['user_id'],
                            ),
                          ),
                        );},
                        child: Expanded(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: double.infinity),
                            height: 160,
                            width: 360,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                            decoration: BoxDecoration(
                                color: PaylaterTheme.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Obx(() => CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          image_face.value
                                      ),
                                    ),),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Obx(() => Text(user_name.value,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700
                                        )
                                    ),),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(
                                      image: NetworkImage(datas[index]['image']),
                                      width: 60,
                                      height: 60,
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
                                            ),
                                          ),

                                          /// Tenor cicilan
                                          Text(
                                            '${'Tenor Cicilan :' +
                                                datas[index]['tenor']} bulan',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: PaylaterTheme.darkerText,
                                            ),
                                          ),

                                          ///price
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                                          ///notes
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Catatan : ',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: PaylaterTheme.darkerText,
                                                ),
                                              ),
                                              Text(
                                                datas[index]['note'],
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
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
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          NumberPaginator(
            numberPages: _numPages,

            onPageChange: (index){
                setState(() {
                  _currentpage=index;
                });
            },
          ),
        ],
      ),
    );
  }
}
