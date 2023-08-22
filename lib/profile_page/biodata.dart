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
  String token = "";
  var id = 0;

  void initState() {
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

  void dispose() {
    dateController.dispose();
    super.dispose();
  }

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
          print('gagal');
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => NavbarBot()));
          AlertDialog alert = AlertDialog(
            title: Text("Berhasil"),
            content: Container(
              child: Text(responseData['message']),
            ),
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
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
      if (response.statusCode == 404) {
        AlertDialog alert = AlertDialog(
          title: Text("Email tidak terdaftar"),
          content: Container(
            child: Text("Email yang anda masukan salah"),
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
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
          'Biodata Diri',
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
        padding: EdgeInsets.all(20),
        color: Color(0xffF6F6F6),
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
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
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nama Lengkap',
                ),
              ),
              SizedBox(
                height: 10,
              ),

              ///NIK
              Text(
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
              SizedBox(
                height: 10,
              ),

              ///tanggal Lahir
              Text(
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
                readOnly: true,
                controller: dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tanggal Lahir',
                ),
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    dateController.text = DateFormat('MM/dd/yyyy').format(date);
                  }
                },
              ),
              SizedBox(
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

              ///gender
              TextField(
                controller: genderController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Jenis Kelamin',
                ),
              ),

              SizedBox(
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
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: provinsiController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Provinsi',
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              ///Kota
              Text(
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
                  hintText: 'Kota',
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          SizedBox(height: 60),
          //submit
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  AddBiodata(
                      namaController.text.toString(),
                      nikController.toString(),
                      ibukandungController.toString(),
                      dateController.toString(),
                      genderController.toString(),
                      kotaControler.toString(),
                      provinsiController.toString())
                },
              ),
              SizedBox(
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
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Batal")),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
