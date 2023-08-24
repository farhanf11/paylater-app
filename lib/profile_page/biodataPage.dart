import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navbar/NavbarBot.dart';
import '../theme.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  String _gender= '';
  String token = "";
  var id = 0;

  void _handleRadioValueChange(String? value) {
    setState(() {
      _gender= value!;
    });
  }

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
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
      body: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Biodata {Username}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            SizedBox(height: 4,),
            Text('{nama lengkap}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

            SizedBox(height: 10,),
            Text('NIK', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            SizedBox(height: 4,),
            Text('{nik}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

            SizedBox(height: 10,),
            Text('Tanggal Lahir', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            SizedBox(height: 4,),
            Text('{tanggal}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

            SizedBox(height: 10,),
            Text('Nama Ibu Kandung', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            SizedBox(height: 4,),
            Text('{nama ibu kandung}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

            SizedBox(height: 10,),
            Text('Gender', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            SizedBox(height: 4,),
            Text('{gender}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

            SizedBox(height: 10,),
            Text('Provinsi', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            SizedBox(height: 4,),
            Text('{provinsi}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),

            SizedBox(height: 10,),
            Text('Kota', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            SizedBox(height: 4,),
            Text('{kota}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
