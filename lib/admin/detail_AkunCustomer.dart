import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/user/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../admin/component/popup.dart';
import '../theme.dart';

class DetailAkun extends StatefulWidget {
  const DetailAkun({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<DetailAkun> createState() => _DetailAkunState();
}

class _DetailAkunState extends State<DetailAkun> {
  _DetailAkunState();
  String token = "";
  var id = 0.obs;
  var user_name = ''.obs;
  var mail_address = ''.obs;
  var phone_number = ''.obs;
  var job = ''.obs;
  var image_face = ''.obs;
  var image_ktp = ''.obs;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    GetUserData();
  }

  void GetUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    isLoading = true;
    try {
      var response = await get(
        Uri.parse('https://paylater.harysusilo.my.id/api/get-user-profile/${widget.id}'),
        headers: {
          'Authorization': token,
        },);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData['data']['user_name']);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          user_name.value = responseData['data']['user_name'];
          mail_address.value = responseData['data']['email_address'];
          phone_number.value = responseData['data']['phone_number'];
          job.value = responseData['data']['job'];
          image_face.value = responseData['data']['image_face'];
          image_ktp.value = responseData['data']['image_ktp'];
        }
      }else{
        print('gagal');
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaylaterTheme.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Detail Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: PaylaterTheme.darkText,
              )),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: PaylaterTheme.darkText,
              size: 20,
            )),
      ),
      body: isLoading?const LinearProgressIndicator(
        ///style
        color: Colors.grey,
      ):Container(
        color: PaylaterTheme.spacer,
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ///Username
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() => Text(
                            user_name.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      ///email
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() => Text(
                            mail_address.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),)

                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      ///Nomor Telepon
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Nomor Telepon',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() => Text(
                            phone_number.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),)
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ///Pekerjaan
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Pekerjaan',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() => Text(
                            job.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),)

                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      ///wajah
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Lampiran Foto Wajah',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() => Image(
                              width: 150,
                              image: NetworkImage(
                                image_face.value,
                              ))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      ///verif ktp
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Lampiran KTP',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() => Image(
                              width: 200,
                              image: NetworkImage(
                                image_ktp.value,
                              ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
