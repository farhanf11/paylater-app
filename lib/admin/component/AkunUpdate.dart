import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

class UpdateAkun extends StatefulWidget {
  const UpdateAkun({Key? key}) : super(key: key);

  @override
  State<UpdateAkun> createState() => _UpdateAkunState();
}

class _UpdateAkunState extends State<UpdateAkun> {
  String _role= '';
  String token = "";
  var id = 0;

  void _handleRadioValueChange(String? value) {
    setState(() {
      _role= value!;
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

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController roleController = TextEditingController();


  void AddBiodata(String user_name, String phone_number, String role) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/update-biodata/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'user_name': user_name,
            'phone_number': phone_number,
            'role': role,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
        } else {
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

              Column(
                children: [
                  ///Nama Lengkap
                  const Text(
                    'Username',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Update Username',
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              ///No HP
              Column(
                children: [
                  const Text(
                    'No Telepon',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Update Nonor Telepon',
                    ),
                  ),
                ],
              ),
            ],
          ),
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
                  value: 'User',
                  groupValue: _role,
                  onChanged: _handleRadioValueChange,
                ),
                title: const Text('User'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Pengawas',
                  groupValue: _role,
                  onChanged: _handleRadioValueChange,
                ),
                title: const Text('Pengawas'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Admin',
                  groupValue: _role,
                  onChanged: _handleRadioValueChange,
                ),
                title: const Text('Admin'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
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
                      usernameController.text.toString(),
                      phoneController.text.toString(),
                      _role.toString(),
                  )},
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
