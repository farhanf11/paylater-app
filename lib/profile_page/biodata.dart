import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navbar/NavbarBot.dart';
import '../theme.dart';

class Biodata extends StatefulWidget {
  const Biodata({Key? key}) : super(key: key);

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  String _gender= '';
  String token = "";
  var id = 0;

  void _handleRadioValueChange(String? value) {
    setState(() {
      _gender= value!;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      id = prefs.getInt('id')!;
    });
  }

  final TextEditingController dateController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ibukandungController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kotaControler = TextEditingController();

  ///date
  // void dispose() {
  //   dateController.dispose();
  //   super.dispose();
  // }

  void AddBiodata(String full_name, String nik, String mother_name,
      String birth_date, String gender, String city, String province) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/update-biodata/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'full_name': full_name,
            'nik': nik,
            'mother_name': mother_name,
            'birth_date': birth_date,
            'gender': gender,
            'city': city,
            'province': province,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => NavbarBot()));
          AlertDialog alert = AlertDialog(
            title: Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }
      }
      if (response.statusCode == 422) {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
        title: const Text(
          'Edit Biodata',
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
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xffF6F6F6),
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),

              ///Nama Lengkap
              const Text(
                'Nama Lengkap',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nama Lengkap',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///NIK
              const Text(
                'NIK',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: nikController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'NIK',
                ),
              ),
              //End NIK
              const SizedBox(
                height: 10,
              ),

              ///tanggal Lahir
              const Text(
                'Tanggal Lahir',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ex : 11 Januari 1990',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///ibu kandung
              const Text(
                'Nama Ibu Kandung',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: ibukandungController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nama Ibu Kandung',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///gender
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gender',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: 'male',
                      groupValue: _gender,
                      onChanged: _handleRadioValueChange,
                    ),
                    title: const Text('Male'),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: 'female',
                      groupValue: _gender,
                      onChanged: _handleRadioValueChange,
                    ),
                    title: const Text('Female'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              ///Provinsi
              const Text(
                'Provinsi',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: provinsiController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ex: DKI Jakarta',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///Kota
              const Text(
                'Kota',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: kotaControler,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ex: Jakarta Barat',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(height: 60),

          ///submit
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  AddBiodata(
                      namaController.text.toString(),
                      nikController.text.toString(),
                      ibukandungController.text.toString(),
                      dateController.text.toString(),
                      _gender.toString(),
                      kotaControler.text.toString(),
                      provinsiController.text.toString())
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PaylaterTheme.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text("Batal")),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
