import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/profile_page/biodata.dart';
import 'package:paylater/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  _BiodataPageState();
  var full_name = "".obs;
  var nik = "".obs;
  var mother_name = "".obs;
  var birth_date = "".obs;
  var gender = "".obs;
  var province = "".obs;
  var city = "".obs;
  var address = "-".obs;
  var job = "".obs;
  var image_face = "".obs;
  var image_ktp = "".obs;

  String token = "";
  var id = 0;

  @override
  void initState() {
    super.initState();
    BiodatabyId();
  }

  void BiodatabyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    try {
      var response = await get(
          Uri.parse(
              'https://paylater.harysusilo.my.id/api/get-user-profile/$id'),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          setState(() {
            full_name.value = responseData['data']['full_name'];
            nik.value = responseData['data']['nik'];
            mother_name.value = responseData['data']['mother_name'];
            birth_date.value = responseData['data']['birth_date'];
            gender.value = responseData['data']['gender'];
            city.value = responseData['data']['city'];
            province.value = responseData['data']['province'];
            job.value = responseData['data']['job'];
            address.value = responseData['data']['address']??"-";
            image_face.value = responseData['data']['image_face'];
            image_ktp.value = responseData['data']['image_ktp'];
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
        backgroundColor: const Color(0xff025464),
        title: const Text(
          'Biodata',
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
                color: PaylaterTheme.spacer,
                borderRadius: BorderRadius.circular(8)),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: PaylaterTheme.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Biodata Diri',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama Lengkap',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        full_name.value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'NIK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        nik.value,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        birth_date.value,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama Ibu Kandung',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        mother_name.value,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gender : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        gender.value,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///provinsi
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Provinsi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        province.value,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///kota
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kota',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        city.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pekerjaan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        job.value,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alamat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: PaylaterTheme.deactivatedText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Text(
                        address.value,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),)
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),

                  Obx(() => Image(
                      image: NetworkImage(image_face.value)
                  ),),
                  const SizedBox(
                    height: 14,
                  ),
                  Obx(() => Image(
                      image: NetworkImage(image_ktp.value)
                  ))
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(Color(0xff025464))),
            onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Biodata())),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('Lengkapi Biodata'),
            ),
          ),
        ],
      ),
    );
  }
}
