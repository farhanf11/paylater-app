import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:paylater/user/history_page/detail_tagihan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';

class TagihanBerlangsung extends StatefulWidget {
  const TagihanBerlangsung({Key? key}) : super(key: key);

  @override
  State<TagihanBerlangsung> createState() => _TagihanBerlangsungState();
}

class _TagihanBerlangsungState extends State<TagihanBerlangsung> {
  _TagihanBerlangsungState();
  List datas = [];
  String token = "";
  // bool isLoading = false;
  var user_name = "username".obs;
  var email_address = "email".obs;
  var phone_number = "phone".obs;
  var image_face = "image".obs;
  var _currentPage = 0.obs;
  var last_page = 1.obs;
  List links = [];

  void initState() {
    super.initState();
    getTagihanBerlangsung();
    ProfilebyId();
  }

  ///get list order request
  Future<void> getTagihanBerlangsung({url = ''}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // isLoading = true;
      token = prefs.getString('token')!;
    });
    var id = prefs.getInt('id')!;

    try {
      var response;
      if(url == ''){
        response = await get(
            Uri.parse('https://paylater.harysusilo.my.id/api/get-order-list?user_id=$id&status=ongoing&page=1'),
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
        print(token);
      }

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas =  responseData['data']['data'];
        _currentPage.value = responseData['data']['current_page'];
        last_page.value = responseData['data']['last_page'];
        links = responseData['data']['links'];
      }else{
        print('gagal');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      // isLoading = false;
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => RincianTagihan(
                              order_id: datas[index]['id'],
                              user_id: datas[index]['user_id'],
                            ),
                          ),
                        );},
                        child: Expanded(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: double.infinity),
                            height: 160,
                            width: 360,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                                        overflow: TextOverflow.ellipsis,
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
                                          ///Nama produk
                                          Text(
                                            datas[index]['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: PaylaterTheme.darkerText,
                                              fontSize: 16,
                                            ),
                                          ),

                                          Text(
                                            '${datas[index]['no_order']}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: PaylaterTheme.darkerText,
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
          Obx(() => NumberPaginator(

            numberPages: last_page.value,
            onPageChange: (index) {
              getTagihanBerlangsung(url: links[index+1]['url']);
              print(_currentPage);
            },
          ),),
        ],
      ),
    );
  }
}
