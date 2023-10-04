import 'dart:convert';

import 'package:flutter/material.dart';
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
  var full_name = "full_name";
  var nik = "nik";
  var mother_name = "mother_name";
  var birth_date = "birth_date";
  var gender = "gender";
  var province = "province";
  var city = "city";
  var address = "address";
  var job = "job";
  var image_face = "image_face";
  var image_ktp = "image_ktp";

  String token = "";
  var id = 0;

  void initState() {
    BiodatabyId();
  }

  void BiodatabyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    try {
      Response response = await get(
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
            full_name = responseData['data']['full_name'];
            nik = responseData['data']['nik'];
            mother_name = responseData['data']['mother_name'];
            birth_date = responseData['data']['birth_date'];
            gender = responseData['data']['gender'];
            city = responseData['data']['city'];
            province = responseData['data']['province'];
            job = responseData['data']['job'];
            address = responseData['data']['address'];
            image_face = responseData['data']['image_face'];
            image_ktp = responseData['data']['image_ktp'];
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
                      Text(
                        full_name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
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
                      Text(
                        nik.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
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
                      Text(
                        birth_date.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
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
                      Text(
                        mother_name.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
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
                      Text(
                        gender.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                  Text(
                    province.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                  Text(
                    city.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                  Text(
                    job.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                  Text(
                    address.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              image_face,
                            ))),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              image_ktp,
                            ))),
                  ),
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
              child: Text('Lengkapi Biodata'),
            ),
          ),
        ],
      ),
    );
  }
}
